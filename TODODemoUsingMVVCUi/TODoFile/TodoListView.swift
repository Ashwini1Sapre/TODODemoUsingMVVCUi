//
//  TodoListView.swift
//  TODODemoUsingMVVCUi
//
//  Created by Knoxpo MacBook Pro on 21/12/20.
//


import SwiftUI

struct TodoListView: View {
   
  //  @Binding var buttonClick: Bool
    @ObservedObject var viewModel = TodoListViewModel()
   
    @State private var isShowingAddNew = false
    @State private var selectedFruit: String?
    
    private var addNewButton: some View {
        Button(action: {
            self.isShowingAddNew.toggle()
        }) {
            Image(systemName: "plus")
        }
    }
    
    private var showCompletedButton: some View {
        Button(action: {
            self.viewModel.showCompleted.toggle()
        }) {
            Image(systemName: self.viewModel.showCompleted ? "checkmark.circle.fill" : "checkmark.circle")
        }
    }
    
    var body: some View {
        NavigationView {
            
            
            
           
            List(viewModel.todos) { todo in
                Button(action: {
                    self.viewModel.toggleIsCompleted(for: todo)
                }) {
                    ToDoROW(todo: todo)
                }
            }
            .listRowBackground(Color.red)
            .navigationBarTitle(Text("New Todo List"))
            .navigationBarItems(leading: showCompletedButton, trailing: addNewButton)
            
        }
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            self.viewModel.fetchTodos()
        }) {
            ShowNewTodoView(viewModel: NewTodoviewModel())
        }
        .onAppear {
            self.viewModel.fetchTodos()
            
            UITableViewCell.appearance().backgroundColor = UIColor.red
        }
    }
    
    
   
}








struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        let view = TodoListView()
   
        return view
    }
}


