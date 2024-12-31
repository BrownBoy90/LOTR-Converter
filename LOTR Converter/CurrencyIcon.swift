//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by Gurnoor Singh on 07/12/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage:ImageResource
    let currencyName:String
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {    //This is used to transfer the Zstack below or above
                    //Currency Image
                Image(currencyImage)
                        .resizable()
                        .scaledToFit()
                    
                    //Currency Name
                Text(currencyName)
                        .padding(3)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .background(.brown.opacity(0.75))
                }
                .padding(3)
                .background(.brown.opacity(0.75))
                .frame(width: 100, height: 100)
                .cornerRadius(25)
                //*5
                
                
                
            }
            .padding()
            .multilineTextAlignment(.center)
            .frame(width: 100, height: 100)
        }
    }


#Preview {
    CurrencyIcon(currencyImage: .goldpenny, currencyName: "Gold Penny")
    
}
