//
//  Home.swift
//  AplicacionNotas
//
//  Created by user on 17/03/24.
//
import SwiftUI

struct Home: View {
    @StateObject var model = ViewModel()
    @FetchRequest(entity: Notas.entity(), sortDescriptors: [NSSortDescriptor(key: "fecha", ascending: true)]) var results : FetchedResults<Notas>
    // trae las entidades datos del coredata
    @Environment (\.managedObjectContext) var context  // traemos el contexto pa el boton
    
    var body: some View {
        NavigationView {
            List {
                // Contenido de la lista
                ForEach (results){item in
                    VStack (alignment:.leading){
                        Text(item.nota ?? "Sin notass").font(.title)
                        Text (item.fecha ?? Date (), style: .date)
                    }.contextMenu(ContextMenu(menuItems: {
                        Button (action: {
                            print ("editar")
                            model.sendData(item: item)
                        }){
                            Label(title: {Text ("editar")}, icon: {Image(systemName: "pencil")})
                        }
                        
                        
                        Button (action: {
                            print ("eliminar")
                            model.deleteData(item: item, context: context)
                        }){
                            Label(title: {Text ("eliminar")}, icon: {Image(systemName: "trash")})
                        }
                            Text ("menu 3")
                        
                        
                    }))
                }
            }
            .navigationBarTitle("Notitas")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        model.show.toggle() // abre la modal
                                    }) {
                                        Text("+").foregroundColor(.red)
                                    }
                                    .sheet(isPresented: $model.show) {
                                        addView(model: model)
                                    }
            )
        }
        Text("Hello, World!")
    }
}



