//
//  Network.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 11/06/2023.
//

import Foundation

func getMenuData() {
    
    let address = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
    
    let url = URL(string: address)!
    
    let request = URLRequest(url: url)
    let dataTask = URLSession.shared.dataTask(with: url){ data,  response, error in
            if let data = data,
               let responseString = String(data:data, encoding: .utf8){
                print(responseString)
            }
    }
    dataTask.resume()
}
