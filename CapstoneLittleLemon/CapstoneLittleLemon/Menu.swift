//
//  Menu.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 11/06/2023.
//

import SwiftUI
import Foundation
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText = ""

    
    var body: some View {
        VStack{
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist. Order your food here!")
            
            NavigationView {
                FetchedObjects(
                    predicate:buildPredicate(),
                    sortDescriptors: buildSortDescriptors()) {
                        (dishes: [Dish]) in
                        List{
                            ForEach (dishes, id:\.self) {dish in
                                NavigationLink(destination: DishDetail(dish: dish)) {
                                    HStack {
                                        Text("\(dish.title ?? "") - \(dish.price ?? "")")
                                        AsyncImage(url: URL(string: dish.image ?? "")){
                                            image in image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 50, height: 50)
                                        
                                    }
                                }
                            }
                        }
                    }
            }
        }.onAppear(perform: getMenuData)
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func getMenuData() {
            
            let persistence = PersistenceController.shared
            let serverUrl = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
            let url = URL(string: serverUrl)!
            let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let menuList = try? decoder.decode(MenuList.self, from: data) {
                        
                        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
                        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                        do {
                            try viewContext.execute(batchDeleteRequest)
                            try viewContext.save()
                        } catch {
                            // handle the error
                        }
                        
                        let fullMenuList = menuList.menu

                        for menuItem in fullMenuList {
                            
                            print(menuItem)
                            
                            let newDish = Dish(context: viewContext)

                            newDish.title = menuItem.title
                            newDish.image = menuItem.image
                            newDish.price = menuItem.price
                        }
                        try? viewContext.save()
                    }
                }
            }
            task.resume()
        }
    
}

//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        Menu()
//    }
//}
