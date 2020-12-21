//
//  TodoListViewModel.swift
//  TODODemoUsingMVVCUi
//
//  Created by Knoxpo MacBook Pro on 21/12/20.
//

import Foundation
import Combine

protocol TodoListViewModelProtocol {
    var todos: [TODo] { get }
    var showCompleted: Bool { get set }
    func fetchTodos()
//    func addTodo(title: String)
    func toggleIsCompleted(for todo: TODo)
}

final class TodoListViewModel: ObservableObject {
    @Published var todos = [TODo]()
    @Published var showCompleted = false {
        didSet {
            fetchTodos()
        }
    }
    
    var dataManager: StoreDataFileProtocol
    
    init(dataManager: StoreDataFileProtocol = StoreDataFile.shared) {
        self.dataManager = dataManager
        fetchTodos()
    }
}

// MARK: - TodoListViewModelProtocol
extension TodoListViewModel: TodoListViewModelProtocol {
    func fetchTodos() {
        todos = dataManager.fetchTODOList(includingCompleted: showCompleted)
    }
    
    func toggleIsCompleted(for todo: TODo) {
        dataManager.toggleIsCompleted(for: todo)
        fetchTodos()
    }
}


