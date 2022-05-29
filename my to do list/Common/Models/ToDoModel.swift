//
//  ToDoModel.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import Foundation

struct ToDoModel: Codable {
    var id: String = UUID().uuidString
    var title: String
    var details: String
}
