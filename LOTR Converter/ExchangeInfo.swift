//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Gurnoor Singh on 07/12/24.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss     //@Environment it lets us use properties that are already defined in the environment we can make a custom property or use which are already there
    
    var body: some View {
        ZStack{
            //Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                //Heading Exchange Rate
                Text("Exchange Rate")
                    .font(.largeTitle)
                    .tracking(3)    // Adds space between letters of a word
                
                //TEXT para
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .padding()
                    .font(.title3)
                
                //Built in views are color coded purple
                //custom views are light green
                
                //ExchangeRate 
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)

                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)

                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver Penny = 100 copper Pennies", rightImage: .silverpiece)
                
                //Button Done
                Button("Done")  {
                    dismiss()
                }// Use only curly braces when you want that your button should only be an image, but when you want to display text use parenthesis
                .buttonStyle(.borderedProminent) //used to highlight the background of the button
                .tint(.brown.mix(with: .black, by: 0.2))   // Used to give color to the button
                //.mix is used to mix the color of the background with some other color out of the given options
                .font(.largeTitle) // to increase the size of the button
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)    // to render the foreground elements black color
            
        }
    }
}

#Preview {
    ExchangeInfo()
}


