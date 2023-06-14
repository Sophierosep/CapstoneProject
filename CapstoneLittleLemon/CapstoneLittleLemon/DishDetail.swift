//
//  DishDetails.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 13/06/2023.
//

import SwiftUI

struct DishDetail: View {
    let dish: Dish

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dish.image ?? "")){
                image in image
                    .resizable()
                    .scaledToFill()
                    .frame(width:350, height: 100)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
            .scaledToFit()
            .padding()
            
            Text("\(dish.dishDescription ?? "")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.light)
                .padding(.leading, 20)

            Text("£\(dish.price ?? "").00")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.medium)
                .padding(2)
                .padding(.leading, 20)

        }
        .navigationBarTitle(Text(dish.title ?? ""), displayMode: .inline)
    }
}

