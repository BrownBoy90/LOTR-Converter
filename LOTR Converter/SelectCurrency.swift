//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Gurnoor Singh on 07/12/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
//    let currency: Int   //this is not allowed as this is in the same scope
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                //Image
                IconGrid(currency: $topCurrency)
                    
                //*5
                
                //Text
                Text("Select the currency you would like to convert to")
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                //Image
                IconGrid(currency: $bottomCurrency)
//                *5
                
                //Done button
                Button("Done")  {
                    dismiss()
                }// Use only curly braces when you want that your button should only be an image, but when you want to display text use parenthesis
                .buttonStyle(.borderedProminent) //used to highlight the background of the button
                .tint(.brown.mix(with: .black, by: 0.2))   // Used to give color to the button
                //.mix is used to mix the color of the background with some other color out of the given options
                .font(.largeTitle) // to increase the size of the button
                .padding()
                
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
    
}
