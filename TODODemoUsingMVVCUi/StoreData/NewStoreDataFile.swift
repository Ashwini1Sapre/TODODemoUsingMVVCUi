//
//  NewStoreDataFile.swift
//  TODODemoUsingMVVCUi
//
//  Created by Knoxpo MacBook Pro on 21/12/20.
//

import Foundation
import SwiftUI
class NewStoreDataFile
{
    
 // @Published var newTodos = ""
    // var name: String?
  var newTodos = ""
    @State private var allTodos: [TODo] = []
 
    
    
  //  loadTodos()
// allTodos.append(Todo(todo: self.newTodos))
//   var username: String
  
      
     //let minval =  loadTodos()
  
      
      
   func deleteTodo(at offsets: IndexSet) {
      loadTodos()
      self.allTodos.remove(atOffsets: offsets)
    // saveTodos()
   }
   func saveTodos() {
       UserDefaults.standard.set(try? PropertyListEncoder().encode(self.allTodos), forKey: "todosKey")
     }

      func loadTodos() {
       if let todosData = UserDefaults.standard.value(forKey: "todosKey") as? Data {
         if let todosList = try? PropertyListDecoder().decode(Array<TODo>.self, from: todosData) {
           self.allTodos = todosList
            
            
            print(self.allTodos)
         }
       }
     }
    
    
    
    
}

