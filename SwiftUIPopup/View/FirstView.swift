//
//  ContentView.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var appState: AppState
    @State var selection: Int? = nil
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("View 1")
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
                
                Divider().frame(height: 20).opacity(0)
                
                Button(action: {
                    self.selection = 1
                }){
                    Text("Navigate to the next View")
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.white)
                        .padding()
                }
            }
            if self.selection == 1 {
                NavigationLink(destination: SecondView(), tag: 1, selection: self.$selection){
                    EmptyView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
