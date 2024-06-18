//
//  ViewModel.swift
//  AplicacionNotas
//
//  Created by user on 17/03/24.
//

import Foundation
import CoreData
import SwiftUI
import Combine

class ViewModel : ObservableObject {
    @Published var nota = ""
    @Published var fecha = Date ()
    @Published var show = false
    @Published var updateItem :Notas!
    
    //Coredata
    func saveData (context: NSManagedObjectContext){
        let newNota = Notas(context: context)
        newNota.nota = nota
        newNota.fecha = fecha
        
        do {
            try  context.save()
                print ("guardo")
        } catch let error as NSError {
            print ("no guardo", error.localizedDescription)
        }
        
    }
    func deleteData (item: Notas,context: NSManagedObjectContext){
        context.delete(item)
        do {
            try  context.save()
                print ("elimino")
        } catch let error as NSError {
            print ("no elimino", error.localizedDescription)
        }
    }
    
    
    func sendData (item: Notas){
        updateItem = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    func editData (context:NSManagedObjectContext ){
        updateItem.fecha = fecha
        updateItem.nota = nota
        do {
            try  context.save()
                print ("edito")
        } catch let error as NSError {
            print ("no edito", error.localizedDescription)
        }
    }
}
