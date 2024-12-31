//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by Gurnoor Singh on 07/12/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
//    let currency: Int   //this is not allowed as this is in the same scope
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                    ForEach(Currency.allCases) { currency in // here loop is the variable which assumes values 0,1,2,3,4 doring the loop we could even put an underscore in its place. ForEach is also a container view but it is a special one.    // _ underscore is a special property name it is used when you know that there is a property but you don't want to use its name.
                        
                        //ContainerView it is a view that groups and manages multiple child views within it.
                        if self.currency == currency {  //we aren't allowed to have properties with the same name in the same scope
                            CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                                .shadow(color: .black, radius: 10)
                            //                            .border(.black)   // as it doesn't follow rounded edges so we use overlay
                                .overlay {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 3)
                                        .opacity(0.5)
                                }   // This is used to display something over like in ZStack
                        } else {
                            CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                                .onTapGesture {
                                    self.currency = currency
                                    
                                }   // This is used to give taps and it modifies some values on non-buttons
                        }
                    }
                }
        }
    
}

#Preview {
    @Previewable @State var currency: Currency = .silverPiece
    
    IconGrid(currency: $currency)
    
}
