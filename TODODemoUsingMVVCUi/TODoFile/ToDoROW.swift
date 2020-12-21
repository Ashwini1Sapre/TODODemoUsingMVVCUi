//
//  ToDoROW.swift
//  TODODemoUsingMVVCUi
//
//  Created by Knoxpo MacBook Pro on 21/12/20.
//


import SwiftUI

struct ToDoROW: View {
    
    var todo: TODo
    
    
    var body: some View
    {
        HStack{
            
            Image(systemName: todo.iscompleted ? "chekmark.square.fill" : "square")
            
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(todo.iscompleted ? .blue : .black)
            
            
            Text(todo.title)
                .bold()
                Spacer()
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
}
