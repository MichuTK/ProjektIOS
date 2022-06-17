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
    
    var body: some View {
        VStack{
            HStack{
                Text(bike.marka!).font(.title)
                Text(bike.model!).font(.title)
            }
            Text("Cena \(String(bike.cena)) PLN").font(.subheadline)
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
