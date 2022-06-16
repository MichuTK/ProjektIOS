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
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Type.type, ascending: true)])
    
    private var types: FetchedResults<Type>
    
    @State private var selectedType: Type?
    @State private var marka : String = ""
    @State private var model : String = ""
    @State private var cena : String = ""
    @State private var opis: String = ""
    
    var body: some View {
        VStack {
            Picker(selection: $selectedType, label: Text("Wybierz rodzaj roweru")){
                ForEach(types, id: \.self) { (type: Type) in
                    Text(type.type!).tag(type as Type?)
                }
            }
            
            if (types == nil){
                Button(action: createType){
                    Text("Dodaj rodzaje")
                }
            }
            
            TextField("Marka: ", text: $marka)
            TextField("Model: ", text: $model)
            TextField("Cena: ", text: $cena)
            TextField("Opis", text: $opis)
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
    
    private func createType(){
        addType(name: "MTB")
    }
    
    private func addType(name: String){
        let newType = Type(context: viewContext)
        newType.type = name
        
        do{
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func addBike(){
        let newBike = Bike(context: viewContext)
        newBike.marka = marka
        newBike.model = model
        newBike.cena = Int32(cena)!
        newBike.opis = opis
        newBike.type = selectedType
        
        do{
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        marka = ""
        model = ""
        cena = ""
        opis = ""
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
