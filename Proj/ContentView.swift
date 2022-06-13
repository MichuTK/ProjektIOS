//
//  ContentView.swift
//  Proj
//
//  Created by student on 06/06/2022.
//  Copyright © 2022 PL. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(
                    destination: AdminView(), label: {
                        Text("Admin")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 60)
                            .background(Color.blue)
                            .padding()
                })
                NavigationLink(
                    destination: UserView(), label: {
                        Text("Klient")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 60)
                            .background(Color.green)
                            .padding()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
