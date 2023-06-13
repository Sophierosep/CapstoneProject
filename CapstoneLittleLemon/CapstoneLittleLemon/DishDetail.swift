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
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                    image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            
            } placeholder: {
                Color.gray
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
            .scaledToFit()
            .padding()
            
            Text(dish.title ?? "")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text("Price: \(dish.price ?? "")")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(dish.title ?? ""), displayMode: .inline)
    }
}




//struct DishDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        DishDetail(dish:Dish)
//    }
//}
