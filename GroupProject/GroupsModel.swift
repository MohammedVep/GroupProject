//
//  Model.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
//

import Foundation

class GroupsModel : GroupsProtocol {
    static var shared = GroupsModel.init()
    private init(){}
    var groups: [GroupModel] = []
    var groupNames: [String] {
        var names: [String] = []
        for group in groups {
            names.append(group.groupName)
        }
        return names
    }
    var groupCount: Int {
        return groups.count
    }
    func addGroup(groupName: String) {
        let newGroup = GroupModel(name: groupName)
        
        groups.append(newGroup)
    }
    
    func add(item: String, groupName: String) {
        var existingGroup = get(groupName: groupName)
        if let existingGroup = existingGroup {
            existingGroup.items.append(item)
        } else {
            let newGroup = GroupModel(name: groupName)
            newGroup.items.append(item)
            groups.append(newGroup)
        }
    }
    
    func numberOfItemsIn(groupName: String) -> Int {
        if let group = get(groupName: groupName) {
            return group.items.count
        } else {
            return 0
        }
    }
    
    func getItemsFor(groupName: String) -> [String] {
        if let group = get(groupName: groupName) {
            return group.items
        } else {
            return []
        }
    }
    func get(itemNumber: Int, groupName: String) -> String? {
        if let group = get(groupName: groupName) {
            if itemNumber < 0 || itemNumber >= group.items.count {
                return nil
            }
            let item = group.items[itemNumber]
            return item
        } else {
            return nil
        }
    }
    
    func get(groupName: String) -> GroupModel? {
        var existingGroup: GroupModel?
        for thisGroup in groups {
            if thisGroup.groupName == groupName {
                existingGroup = thisGroup
            }
        }
        return existingGroup
    }
    
    func get(groupNumber: Int) -> GroupModel? {
        if groupNumber < 0 || groupNumber >= groups.count {
            return nil
        }
        let group = groups[groupNumber]
        return group
    }
    
    func removeAll(){
        groups.removeAll()
    }
    func getGroupName(index: Int) -> String?{
        if index < 0 || index >= groups.count {
            return nil
        }
        let group = groups[index]
        return group.groupName
    }
    func deleteGroupAt(index: Int) {
        if index < 0 || index >= groups.count {
            return
        }
        groups.remove(at: index)
    }
}
