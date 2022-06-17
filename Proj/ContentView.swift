//
//  ContentView.swift
//  Proj
//
//  Created by student on 06/06/2022.
//  Copyright © 2022 PL. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var scaleImg: CGFloat = 1.0
    
    var body: some View {
        NavigationView{
            VStack{
                Image("bike_logo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scaleImg)
                    .gesture(TapGesture()
                                .onEnded(){_ in scaleImg -= 0.20
                                    if  (scaleImg<0.2) {scaleImg = 1}
                                }
                    )
                NavigationLink(
                    destination: AdminView(), label: {
                        Text("Admin")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 60)
                            .background(Color.blue)
                            .padding()
                            .clipShape(Capsule())
                })
                NavigationLink(
                    destination: UserView(), label: {
                        Text("Klient")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 60)
                            .background(Color.green)
                            .padding()
                            .clipShape(Capsule())
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
