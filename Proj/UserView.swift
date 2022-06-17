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
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Type.type, ascending: true)])
    
    private var types: FetchedResults<Type>
    
    var body: some View {
        List {
            ForEach(types, id: \.self) { type in
                Text(type.type!)
                ForEach(type.bikeArray, id: \.self){ bike in
                    NavigationLink(destination: BikeView(bike: bike)){
                        VStack {
                            Text("\(bike.marka!) \(bike.model!)")
                            Text("Cena \(String(bike.cena)) PLN")
                        }
                    }
                }
            }
        }.navigationBarTitle("Katalog rowerów")
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
