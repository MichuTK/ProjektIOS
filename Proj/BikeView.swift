//
//  BikeView.swift
//  Proj
//
//  Created by student on 13/06/2022.
//  Copyright © 2022 PL. All rights reserved.
//

import SwiftUI
import CoreData

struct BikeView: View {
    
    let bike: Bike
    @State private var pln = true
    
    var body: some View {
        
        VStack{
            Toggle("Waluta PLN", isOn: $pln)
            
            HStack{
                Text(bike.marka!).font(.title)
                Text(bike.model!).font(.title)
            }
            if pln {
                Text("Cena \(bike.cena) PLN").font(.subheadline)
            } else {
                Text("Cena \(Double(bike.cena)/4.68, specifier: "%.2f") EUR").font(.subheadline)
            }
            
            Text("Opis").font(.caption)
            Text(bike.opis!)

        }.navigationBarTitle("Szczególy")
    }
    
    private func addToCart(){
        
    }
    
}

struct BikeView_Previews: PreviewProvider {
    static var previews: some View {
        BikeView(bike: Bike())
    }
}
