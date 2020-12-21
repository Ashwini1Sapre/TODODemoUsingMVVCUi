//
//  StoreDataFile.swift
//  TODODemoUsingMVVCUi
//
//  Created by Knoxpo MacBook Pro on 21/12/20.
//

import Foundation
protocol StoreDataFileProtocol {
    func fetchTODOList(includingCompleted: Bool) -> [TODo]
    func addToDo(title: String)
    func toggleIsCompleted(for todo:TODo)
    
    
}
extension StoreDataFileProtocol{
    
    func fetchTODOList(includingCompleted: Bool = false) -> [TODo]
    {
        
        
        fetchTODOList(includingCompleted: includingCompleted)
    }
    
    
    
}
class StoreDataFile
{
   
    
    static let shared: StoreDataFileProtocol = StoreDataFile()
    
    private var todos = [TODo]()
    
    private init(){}
    
    
    
}


extension StoreDataFile : StoreDataFileProtocol
{
    func toggleIsCompleted(for todo: TODo) {
        if let index = todos.firstIndex(where: {$0.id == todo.id})
        {
            
            todos[index].iscompleted.toggle()
            
        }
    }
    
    func fetchTODOList(includingCompleted: Bool = false) -> [TODo] {
        includingCompleted ? todos : todos.filter{$0.iscompleted}
        
    }
    
    func addToDo(title todo: String) {
        let todo = TODo(title: todo)
        todos.insert(todo, at:0)
    }
    
    
   
    
    
}


















