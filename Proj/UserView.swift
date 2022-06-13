//
//  UserView.swift
//  Proj
//
//  Created by student on 06/06/2022.
//  Copyright © 2022 PL. All rights reserved.
//

import SwiftUI
import CoreData

struct UserView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Bike.marka, ascending: true)])
    
    private var bikes: FetchedResults<Bike>
    
    var body: some View {
        NavigationView{
            List {
                ForEach(bikes) { bike in
                    NavigationLink(destination: BikeView(bike: bike)){
                        HStack {
                            VStack {
                                Text("\(bike.marka!) \(bike.model!)")
                                Text("Cena \(String(bike.cena)) PLN")
                            }
                        }
                    }
                }
            }
        }
    }
       
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
