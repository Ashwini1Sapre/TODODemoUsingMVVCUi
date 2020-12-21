//
//  ShowNewTodoView.swift
//  TODODemoUsingMVVCUi
//
//  Created by Knoxpo MacBook Pro on 21/12/20.
//

import SwiftUI

struct ShowNewTodoView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: NewTodoviewModel

  //  @ObservedObject private var keyboard = KeyboardResponder()
    
    @State private var title = ""
    
    private var isAddButtonDisabled: Bool { // 1
        title.isEmpty
    }
    
    private var addButtonColor: Color { // 2
        isAddButtonDisabled ? .gray : .blue
    }
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Enter Name", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)

                Button(action: {
                    if !self.isAddButtonDisabled { // 3
                        self.viewModel.addNewTodo(title: self.title)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add")
                        .foregroundColor(.black) // 4
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(addButtonColor) // 5
                .disabled(isAddButtonDisabled) // 5
            }
        }
        .padding()
       // .padding(.bottom, keyboard.currentHeight)
       // .animation(.easeOut(duration: keyboard.duration))
    }
}


struct AddNewTodo_Previews: PreviewProvider {
    static var previews: some View {
        //AddNewTodo
       // ContentView()
        ShowNewTodoView(viewModel: NewTodoviewModel())
    }
}
