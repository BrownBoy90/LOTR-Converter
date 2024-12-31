//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Gurnoor Singh on 07/12/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text:String
    let rightImage: ImageResource
    
    //Right Click and select Extract Subview
    var body: some View {
        HStack{
            //Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //Text
            Text(text)
            
            //Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
    
}
