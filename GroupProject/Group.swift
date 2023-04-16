//
//  Model.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
//

import Foundation

class Group : GroupProtocol {
    var groups: [String] = ["apple", "banana", "cherry"]
    var groupNames: [String] {
        return groups
    }
    var groupCount: Int {
        return groups.count
    }
    
    
}
