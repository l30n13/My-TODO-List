//
//  HomeViewModel.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import Foundation

class HomeViewModel {
    var todoListViewModel: [ToDoModel]?
    let noDataFound = "No TODO List found.\nPlease add first."
    
    func fetchToDoData(completion: @escaping (Bool) -> Void) {
//                loadTestData()
        if Managers.defaultStorage.hasData(forKey: .TODO_DATA) {
            if let todoList = Managers.defaultStorage.getData(forKey: .TODO_DATA, model: ToDoModel.self), todoList.count > 0 {
                todoListViewModel = todoList
                completion(true)
            } else {
                completion(false)
            }
        } else {
            completion(false)
        }
    }
    
    func deleteToDoData() {
        let data = try? JSONEncoder().encode(todoListViewModel)
        Managers.defaultStorage.setData(forKey: .TODO_DATA, data)
    }
    
    private func loadTestData() {
        var viewModel: [ToDoModel] = []
        for i in 0...10 {
            let model = ToDoModel(title: "Title - \(i)", details: "With details - \(i)")
            viewModel.append(model)
        }
        
        let data = try? JSONEncoder().encode(viewModel)
        Managers.defaultStorage.setData(forKey: .TODO_DATA, data)
    }
}
