//
//  Currency.swift
//  LOTR Converter
//
//  Created by Gurnoor Singh on 11/12/24.
//

import SwiftUI
//struct Puppy {
//    let breed: Breed
//    let furColor: [Color]
//    let gender: Gender
//}
//
//enum Breed: String {
//    case goldenRetriever  //Default String or raw value "goldenRetriever" i.e. the same name as the case
//    case labradorRetriever
//    case goldenRetrieverWithWhitePaws
//}
//
//enum Gender: String {
//    case male
//    case female
//}

enum Currency: Double, CaseIterable, Identifiable { //CaseIterable generates an array out of enum which can be accessed using property .allCases
    
    // We have to use Identifiable because ForEach requires our enum to conform to it and the real reason is that it helps swift to keep track of changes to cases and to differentiate between them
    case copperPenny = 6400       // Default is 0 (value)
    case silverPenny = 64       // Default is 1
    case silverPiece = 16       // Default is 2
    case goldPenny   = 4       // Default is 2
    case goldPiece   = 1       // Default is 3
    
    // Identifiable has to have the id property to identify to each case
    var id: Currency { self }   // This or       But it has to be unique
//    var id: Double { rawValue } // or this     But it has to be unique
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    func convert(_ amountString: String, to currency:Currency) -> String {   //func nameOfFunc(Parameters) -> return type //when calling the function they are called arguments and their names can be different
        guard let doubleAmount = Double(amountString)   // type casting is done here guard is used to tell our app that convert string to double wherever possible if it is not possible do something else
                else {
            return ""
        }
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)  // we could do String(convertedAmount) but this represents a lot of decimal places the format in the code represents the format in which answer is represented in upto 2 decimal places
    }
}
