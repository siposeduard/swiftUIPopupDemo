//
//  SecondView.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("View 2")
                    .font(Font.system(size: 25))
                    .foregroundColor(Color.white)
                
                Divider().frame(height: 20).opacity(0)
                
                Button(action: {
                    self.appState.showPopup.send(.somepopup)
                }){
                    Text("show popup")
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.white)
                        .padding()
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
