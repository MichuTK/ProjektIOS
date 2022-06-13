//
//  AdminView.swift
//  Proj
//
//  Created by student on 06/06/2022.
//  Copyright © 2022 PL. All rights reserved.
//

import SwiftUI
import CoreData

struct AdminView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Bike.marka, ascending: true)])
    
    private var bikes: FetchedResults<Bike>
    
    @State private var marka : String = ""
    @State private var model : String = ""
    @State private var cena : String = ""
    
    var body: some View {
        VStack {
            TextField("Marka: ", text: $marka)
            TextField("Model: ", text: $model)
            TextField("Cena: ", text: $cena)
            Button(action: addBike){
                Text("Dodaj rower")
            }
            List {
                ForEach(bikes) { bike in
                    HStack {
                        VStack {
                            Text("\(bike.marka!) \(bike.model!)")
                            Text("Cena \(String(bike.cena)) PLN")
                        }
                    }
                }.onDelete(perform: deleteBike)
            }
        }
    }
    
    private func addBike(){
        let newBike = Bike(context: viewContext)
        newBike.marka = marka
        newBike.model = model
        newBike.cena = Int32(cena)!
        
        do{
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        marka = ""
        model = ""
        cena = ""
    }
    
    private func deleteBike(offsets: IndexSet) {withAnimation {
        offsets.map { bikes[$0] }.forEach(viewContext.delete)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        }
    }
    
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
