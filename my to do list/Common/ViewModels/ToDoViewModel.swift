//
//  ToDoViewModel.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import Foundation

struct ToDoViewModel {
    var todoModel: ToDoModel
    
    init(todoModel: ToDoModel) {
        self.todoModel = todoModel
    }
    
    var id: String {
        return todoModel.id
    }
    
    var titleString: String {
        return todoModel.title
    }
    
    var detailsString: String {
        return todoModel.details
    }
}
