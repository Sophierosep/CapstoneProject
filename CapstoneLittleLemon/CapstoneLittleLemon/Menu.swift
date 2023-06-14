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
            Image("Logo").frame(width:50,height:50)
            VStack{
                Text("Little Lemon")
                    .font(.custom("Georgia", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .foregroundColor(Color("yellow"))
                Text("Chicago")
                    .font(.custom("Georgia", size: 32))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.regular)
                    .foregroundColor(Color("grey"))
                HStack{
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(.custom("Georgia", size: 18))
                            .frame(maxWidth: .infinity, maxHeight:130, alignment: .leading)
                            .fontWeight(.regular)
                            .foregroundColor(Color("grey"))
                    Image("Hero image")
                        .resizable()
                        .frame(width: 100,height: 120)
                        .cornerRadius(8)
                }.padding(0)
                TextField("Search",text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            .padding(10)
            .background(Color("green"))
            VStack{
                Text("ORDER FOR DELIVERY!")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,10)
                HStack{
                    Text("Starters")
                        .fontWeight(.bold)
                        .padding([.bottom, .top],8)
                        .padding([.leading, .trailing],8)
                        .background(Color("grey"))
                        .cornerRadius(16)
                        .padding(5)
                    
                    Text("Mains")
                        .fontWeight(.bold)
                        .padding([.bottom, .top],8)
                        .padding([.leading, .trailing],8)
                        .background(Color("grey"))
                        .cornerRadius(16)
                        .padding(5)

                    Text("Desserts")
                        .fontWeight(.bold)
                        .padding([.bottom, .top],8)
                        .padding([.leading, .trailing],8)
                        .background(Color("grey"))
                        .cornerRadius(16)
                        .padding(5)

                    Text("Drinks")
                        .fontWeight(.bold)
                        .padding([.bottom, .top],8)
                        .padding([.leading, .trailing],8)
                        .background(Color("grey"))
                        .cornerRadius(16)
                        .padding(5)
                }
            }

            NavigationView {
                FetchedObjects(
                    predicate:buildPredicate(),
                    sortDescriptors: buildSortDescriptors()) {
                        (dishes: [Dish]) in
                        List{
                            ForEach (dishes, id:\.self) {dish in
                                NavigationLink(destination: DishDetail(dish: dish)) {

                                    VStack{
                                        Text("\(dish.title ?? "")")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fontWeight(.bold)
                                        HStack{
                                            VStack{
                                                Text("\(dish.dishDescription ?? "")")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .fontWeight(.light)

                                                Text("£\(dish.price ?? "").00")
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .fontWeight(.medium)
                                                    .padding(2)
                                            }
                                        AsyncImage(url: URL(string: dish.image ?? "")){
                                            image in image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 80,height: 100)
                                                .clipped()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 80)
                                        }
                                    }
                                }
                            }
                        }
                    }
            }
            .listStyle(.plain)
            
        }.onAppear(perform: getMenuData)
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText, "hi")
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
                        
                        let fullMenu = menuList.menu

                        for menuItem in fullMenu {
                            let newDish = Dish(context: viewContext)
                            newDish.title = menuItem.title
                            newDish.image = menuItem.image
                            newDish.price = menuItem.price
                            newDish.dishDescription = menuItem.description
                        }
                        try? viewContext.save()
                    }
                }
            }
            task.resume()
        }
    
}
