////
////  NetworkManager.swift
////  CapstoneLittleLemon
////
////  Created by Sophie Pitcairn on 12/06/2023.
////
//
//import Foundation
//
//class NetworkManager{
//    func getMenuData(completion:@escaping (Result<MenuList, Error>)->()){
//        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request) { data, _,error in
//            if let data = data {
//                let  decoder = JSONDecoder()
//                let menuList = try! decoder.decode(MenuList.self, from: data)
//                completion(.success(menuList))
//            }
//            
//        }
//        task.resume()
//    }
//}
//
//
//class getMenuData {
//
////        let address:String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
//
//    let url:URL
//    var request:URLRequest
//    let dataTask:URLSessionDataTask
//
//    init(){
//        self.url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
//        self.request = URLRequest(url: url)
//        self.dataTask = URLSession.shared.dataTask(with: request){
//            data,  response, error in
//                if let data = data {
//                    let  decoder = JSONDecoder()
//                    let menuList = try! decoder.decode(MenuList.self, from: data)
//                    print(menuList)
//                }
//        }
//        dataTask.resume()
//    }
//    static func createDishesrom(menuList:<MenuList, _ context:NSManagedObjectContext){
//        for menuItem in menuList {
//            let oneDish = Dish(context: context)
//            oneDish.title = menuItem.title
//            oneDish.image = menuItem.image
//            oneDish.price = menuItem.price
//        } try? viewContext.save()
//    }
//}
//
//
////    class getMenuData{
////        func getMenu(completion:@escaping (Result<MenuList, Error>)->()){
////            let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
////            let request = URLRequest(url: url)
////            let task = URLSession.shared.dataTask(with: request) { data, _,error in
////                if let data = data {
////                    let  decoder = JSONDecoder()
////                    let menuList = try! decoder.decode(MenuList.self, from: data)
////                    completion(.success(menuList))
////                    print(menuList)
////                    for menuItem in menuList{
////                        let oneDish = Dish()
////                    }
////                }
////            }
////            task.resume()
////        }
////    }
