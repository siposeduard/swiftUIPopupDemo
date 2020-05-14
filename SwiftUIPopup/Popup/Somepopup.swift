//
//  Somepopup.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import SwiftUI

struct Somepopup: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all).opacity(0.40)
            
            ZStack {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Divider().frame(width: 5, height: 0).opacity(0)
                        Button (action: {
                            self.appState.dismissPopup.send(true)
                        }) {
                            Image("xIcon")
                                .resizable()
                                .frame(width: 10, height: 12)
                                .scaledToFit()
                                .foregroundColor(Color.white)
                                .padding()
                        }
                        Spacer()
                    }
                    
                    Text("Some text")
                        .foregroundColor(Color.white)
                        .padding()
                    
                    Button(action: {
                        print("Big Button Pressed")
                    }) {
                        HStack {
                            Spacer()
                            Text("Big Button Text")
                                .foregroundColor(Color.white)
                                .bold()
                                .padding()
                            Spacer()
                        }
                        .background(Color.green)
                        .cornerRadius(8)
                    }
                    .frame(height: 50)
                    .padding()
                }
                .background(Color.black.opacity(0.80))
                .cornerRadius(20)
            }.padding()
        }
        
    }
}

struct Somepopup_Previews: PreviewProvider {
    static var previews: some View {
        Somepopup()
    }
}
