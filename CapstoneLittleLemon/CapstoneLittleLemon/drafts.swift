//
//  drafts.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 13/06/2023.
//

import Foundation


//    func getMenuData() {
//        let address = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
//        let url = URL(string: address)!
//
//        let request = URLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request){
//            data,  response, error in
//            _ = response
//            if let data = data {
//                let  decoder = JSONDecoder()
//                let fullMenu = try! decoder.decode(MenuList.self, from: data)
//
//                let menuItems = fullMenu.menu
//                print(menuItems)
//
                
                
                //                    let newDish = NSEntityDescription.insertNewObject(forEntityName: "Dish", into: viewContext)
                
                //                    var oneDish = Dish(context: viewContext)
                
                //                    for menuItem in fullMenu.menu {
                //
                //                        print(menuItem)
                //                        oneDish.title = menuItem.title
                //                        oneDish.image = menuItem.image
                //                        oneDish.price = menuItem.price
                //                    }
                //                    try? viewContext.save()
//            }
//        }
//        task.resume()
//    }
    
    
    
    //        let menuItems = fullMenu.menu
    //        for menuItem in menuItems {
    //            let oneDish = Dish(context: viewContext)
    //            oneDish.title = menuItem.title
    //            oneDish.image = menuItem.image
    //            oneDish.price = menuItem.price
    //        }
    //        try? viewContext.save()
 
    
//    func createDish(menuItems:[MenuItem],context:NSManagedObjectContext)->Dish{
//        var newDish = Dish(context: viewContext)
//        for menuItem in menuItems {
//            newDish.title = menuItem.title
//            newDish.image = menuItem.image
//            newDish.price = menuItem.price}
//            try? viewContext.save()
//        return
//    }
