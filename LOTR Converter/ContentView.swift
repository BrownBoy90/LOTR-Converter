//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Gurnoor Singh on 05/12/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false //Redhighlisht for a keyword
//        let means that don't let this property change
//        if we type var instead of let then this means that we can change it later on
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var showSelectCurrency = false
    
    @FocusState var leftTyping  // allows the property to which this variable is associated the master state meaning that no other onChange change the property while cursor is in the property to which this var is associated ,use .focussed to the property
    @FocusState var rightTyping
    
    @State var leftCurrency = Currency.silverPiece  //  we could do this in place of declaring a dataType
    @State var rightCurrency: Currency = .goldPiece // here we are writing the type as well as the initial value because just by .goldPiece it can't infer the dataType
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            // BAckground Image
            Image(.background)// Puts a Image
                .resizable()    //Resize the image untill safe area
                .ignoresSafeArea()  //Ignores Safe area
            
            VStack {
                //Prancing ponny image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()  // When resized the image gets streched to occupy the whole screen incl. safe area this is just to tell to maintain the orignal height:width Ratio
                    .frame(height: 200) //Used to tell that get the height to 200 points
                
                
                //Currency Exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                
                //Conversion Section
                HStack {
                    //Left Conversion Sectionss
                    VStack {
                        //Currency
                        HStack {
                            //Currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency = true
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)    // It should be attached wherever we want to show our tip even if the property used as a parameter is in the body not in HStack
                        //Text Field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder) //makes a white background with displaying default text and rounded corners
                            .focused($leftTyping)
                        
                        //         Binding<String>  The difference between a normal string and a string with a binding wrapper is that normal string can only be modified by the person doing coding but the binding<String> can be modified by the user as well as coder
                        
                    }
                    
                    //Equal Sign
                    Image(systemName: "equal")
                    //  .resizable() // This could also be used with SF symbols but at this time it is not required
                        .font(.largeTitle)  //Used to increase size of equal sign, to be used only in case of SF symbols
                        .foregroundColor(Color.white)  // SF sybols are not in the assets that's why to access them we need to use systemName: to access them as they are provided by the system
                        .symbolEffect(.pulse)   // it is used to create effect in this case the "equal to" sign is blinking
                    //Right Conversion Section
                    VStack {
                        //Currency
                        HStack {
                            //Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundColor(Color.white)
                            
                            //Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency = true
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        //Text Field
                        TextField("Amount", text: $rightAmount)// This dollar sign indicates a 2 way communication in which we as programmer and the user is able to change the value
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing) //makes Amount in the TextField go to right
                            .focused($rightTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))    //add abackground shape to a view
                .clipShape(.capsule) //clip a shape to the view in this case capsule
                .keyboardType(.decimalPad)
                Spacer()
                
                HStack {
                    Spacer()
                    Button{
                        //                    showExchangeInfo = true //If you do this it will still throw an error even with the var, Imagine struct as a building you cannot change it once it is made, but IFF you still wish to change it you need a special type of property.
                        //                    That special property is a property wrapper.
                        //                    It wraps around a property and changes it in a way to do certain things or to allow certain functionalities and that thing depends on what property wrapper we are using
                        //                    The property wrapper which we are using is @State.
                        //                    It tells the body var and ContentView that allow this property be change the state of our view.
                        showExchangeInfo.toggle()
                        //                    print("showExchangeInfo value: \(showExchangeInfo)")  \() This is string interpolation used to display the varible info what's inside it.
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(Color.white)
                            .padding(.trailing)
                            .font(.largeTitle)
                    }
                    .task {
                        // This allows to run the code in the background when the screen appears it does not has anything to do with TipKit
                        try? Tips.configure()// This try says that run this fuction and if it does throw error just give up but don't crash the app and the ? is simply used for making it optional
                    }
                    .onChange(of: rightCurrency) {
                        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                    }
                    .onChange(of: leftCurrency) {
                        leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                    }
                    .onChange(of: rightAmount) {
                        if rightTyping {
                            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                        }
                    }
                    .onChange(of: leftAmount) {
                        if leftTyping {
                            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                        }
                    }
                    .sheet(isPresented: $showExchangeInfo)  {   // It can be placed anywhere in the ContentView Structure
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency) {
                        SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
                }
                
            }
            //            .border(.blue)  //This is used to place a border around a view
        }
    }
}

#Preview {
    ContentView()
}
