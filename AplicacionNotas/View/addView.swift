//
//  addView.swift
//  AplicacionNotas
//
//  Created by user on 17/03/24.
//

import SwiftUI

struct addView: View {
    @ObservedObject var model : ViewModel
    @Environment (\.managedObjectContext) var context //mandamos a llamar el contexto
    var body: some View {
        VStack {
            Text (model.updateItem != nil ? "editar nota" : "Agregar Nota")
                .font(.largeTitle).bold()
            Spacer ()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccionar fecha", selection: $model.fecha)
            Spacer ()
            Button(action: {
                model.show.toggle() // cierra la modal
                
                if model.updateItem != nil{
                    model.editData (context: context)
                }else{
                    model.saveData(context: context) // con el envirotmenment se envia al observed object para guardar
                }}){
                    Label(title: {Text("Guardar").foregroundColor(.white)}, icon: {Image(systemName: "plus").foregroundColor(.white)})
                }.padding()
                .frame (width: UIScreen.main.bounds.width-30)  //estira todo el boton
                .background(Color.blue)
                .cornerRadius(8)
            
        }.padding()
    }
}


