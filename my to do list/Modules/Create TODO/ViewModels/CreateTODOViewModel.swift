//
//  CreateTODOViewModel.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import Foundation

class CreateTODOViewModel {
    func addIntoTODOList(title: String, details: String, completion: @escaping(Bool) -> Void) {
        let totoModel = ToDoModel(title: title, details: details)
        
        if Managers.defaultStorage.hasData(forKey: .TODO_DATA) {
            if var todoList = Managers.defaultStorage.getData(forKey: .TODO_DATA, model: ToDoModel.self) {
                todoList.append(totoModel)
                Managers.defaultStorage.setData(forKey: .TODO_DATA, try? JSONEncoder().encode(todoList))
                completion(true)
            } else {
                completion(false)
            }
        } else {
            Managers.defaultStorage.setData(forKey: .TODO_DATA, try? JSONEncoder().encode([totoModel]))
            completion(true)
        }
    }
}
