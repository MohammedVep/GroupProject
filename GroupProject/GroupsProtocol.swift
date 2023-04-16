//
//  ModelProtocol.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
// ID: 101345468

// Ibrahim Elmi - 101241704
// Abdur Rahman Fahad - 101295960
//
//Mohammed Abdiwahab Hussein - 101308661

import Foundation

// Creates a group protocol which stores group names into lists
protocol GroupsProtocol{
    var groupNames: [String] { get  }
    var groupCount: Int { get }
    func addGroup(groupName: String)
    func getGroupName(index: Int) -> String?
    func deleteGroupAt(index: Int)
}
