//
//  SecondView.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var popupManager: PopupManager
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("View 2")
                    .font(Font.system(size: 25))
                    .foregroundColor(Color.white)
                
                Divider().frame(height: 20).opacity(0)
                
                Button(action: {
                    self.popupManager.showPopup.send(.somepopup)
                }){
                    Text("show popup")
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.white)
                        .padding()
                }
                .background(Color.white.opacity(0.1))
                .cornerRadius(8)
                
                Divider().frame(height: 20).opacity(0)
                
                Button(action: {
                    self.popupManager.showPopup.send(.someFullScreenPopup(text: "Some text"))
                }){
                    Text("show big popup")
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.white)
                        .padding()
                }
                .background(Color.white.opacity(0.1))
                .cornerRadius(8)
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
