//
//  ModelProtocol.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
//

import Foundation

protocol GroupsProtocol{
    var groupNames: [String] { get  }
    var groupCount: Int { get }
    func addGroup(groupName: String)
    func getGroupName(index: Int) -> String?
    func deleteGroupAt(index: Int)
}
