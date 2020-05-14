//
//  SomeFullScreenPopup.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import SwiftUI

struct SomeFullScreenPopup: View {
    @EnvironmentObject var appState: AppState
    
    let text: String
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(spacing: 0) {
                    Divider().frame(width: 5, height: 0).opacity(0)
                    Button (action: {
                        self.appState.dismissPopup.send(true)
                    }) {
                        Image("xIcon")
                            .resizable()
                            .frame(width: 18, height: 20)
                            .scaledToFit()
                            .foregroundColor(Color.white)
                            .padding()
                    }
                    Spacer()
                }
                
                Divider().frame(height: 25).opacity(0)
                Text("Full Screen Popup with a background")
                    .font(Font.system(size: 40))
                    .bold().foregroundColor(Color.white)
                    .background(Color.black.opacity(0.3))
                Spacer()
                
                Text(self.text)
                    .font(Font.system(size: 40))
                    .bold().foregroundColor(Color.white)
                    .background(Color.black.opacity(0.3))
                
                Spacer()
                Button(action: {
                    print("Big Button Pressed")
                }) {
                    HStack {
                        Spacer()
                        Text("Just a big button Here")
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
                
                Divider().frame(height: 25).opacity(0)
            }
        }
    }
}

struct SomeFullScreenPopup_Previews: PreviewProvider {
    static var previews: some View {
        SomeFullScreenPopup(text: "Content")
    }
}
