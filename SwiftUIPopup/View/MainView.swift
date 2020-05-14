//
//  NavigationView.swift
//  SwiftUIPopup
//
//  Created by Sipos Eduard on 14/05/2020.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            FirstView()
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
