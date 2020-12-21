//
//  NewTodoviewModel.swift
//  TODODemoUsingMVVCUi
//
//  Created by Knoxpo MacBook Pro on 21/12/20.
//

import Foundation
import Combine

protocol NewTodoViewModelProtocol {
    func addNewTodo(title: String)
}

final class NewTodoviewModel: ObservableObject {
    var dataManager: StoreDataFileProtocol
    
    init(dataManager: StoreDataFileProtocol = StoreDataFile.shared) {
        self.dataManager = dataManager
    }
}

// MARK: - NewTodoViewModelProtocol
extension NewTodoviewModel: NewTodoViewModelProtocol {
    func addNewTodo(title: String) {
        dataManager.addToDo(title: title)
    }
}

