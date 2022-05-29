//
//  HomeViewModel.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import Foundation

class HomeViewModel {
    var todoListViewModel: [ToDoViewModel]?
    let noDataFound = "No TODO List found.\nPlease add first."
    
    func fetchToDoData(completion: @escaping (Bool) -> Void) {
        if Managers.defaultStorage.hasData(forKey: .TODO_DATA) {
            if let todoList = Managers.defaultStorage.getData(forKey: .TODO_DATA, model: ToDoModel.self), todoList.count > 0 {
                todoListViewModel = todoList.map(ToDoViewModel.init)
                completion(true)
            } else {
                completion(false)
            }
        } else {
            completion(false)
        }
    }
}
