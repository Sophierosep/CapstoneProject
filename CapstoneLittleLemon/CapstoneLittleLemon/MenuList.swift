//
//  MenuList.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 11/06/2023.
//

import Foundation

struct MenuList: Decodable{
    let menu: [MenuItem]
}

struct MenuItem: Decodable{
    let title:String
    let image:String
    let price:String
}
