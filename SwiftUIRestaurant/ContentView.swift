//
//  ContentView.swift
//  SwiftUIRestaurant
//
//  Created by SJI on 14/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var itemArray: [MenuItem]
    @State var selectedCategory: Int = 0
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
    NavigationView{
            VStack(spacing: 5){
            ScrollView(.horizontal , showsIndicators: false, content: {
                HStack(spacing: 15){
                    
                    ForEach(0..<menu.count) { i in
                        Button(action: {
                            selectedCategory = i
                            itemArray.removeAll()
                            itemArray.append(contentsOf: menu[i].items)
                        }, label: {
                             Text("\(self.menu[i].name)")
                            .padding(2)
                        }).padding(.vertical,10)
                          .padding(.horizontal)
                          .background(selectedCategory == i ? Color.red.opacity(0.9) : Color.gray.opacity(0.08))
                          .clipShape(Capsule())
                          .foregroundColor(selectedCategory == i ? .white : .black)
                    }
                }.padding(.horizontal)
            })
                List{
                    ForEach(itemArray) {item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                        }
                      
                    }
                        
                }
            .navigationTitle("Menu")
            .listStyle(PlainListStyle())
            }.padding(0)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(itemArray: [])
    }
}

