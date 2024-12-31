//
//  CurrencyTip.swift
//  LOTR Converter
//
//  Created by Gurnoor Singh on 30/12/24.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring the Currency screen")
    
    var image: Image? = Image(systemName: "hand.tap.fill") // This ? mark makes this as the optional type which means the variable can either have a default value or no value at all 
}
