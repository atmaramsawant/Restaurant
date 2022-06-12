//
//  MainView.swift
//  SwiftUIRestaurant
//
//  Created by SJI on 14/05/21.
//

import SwiftUI

struct MainView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        TabView {
            ContentView(itemArray: menu[0].items)
                       .tabItem {
                           Label("Menu", systemImage: "list.dash")
                       }

                   OrderView()
                       .tabItem {
                           Label("Order", systemImage: "square.and.pencil")
                       }
               }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
