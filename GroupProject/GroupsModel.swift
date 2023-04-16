//
//  Model.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
// ID: 101345468

// Ibrahim Elmi - 101241704
// Abdur Rahman Fahad - 101295960
//
//Mohammed Abdiwahab Hussein - 101308661


import Foundation

class GroupsModel : GroupsProtocol {
    // Makes group model shared
    static var shared = GroupsModel.init()
    private init(){}
    // Assigns groups to a groupmodel array
    var groups: [GroupModel] = []
    // Assigns Groupnames with a string array of names and for loop that appends group in group name
    var groupNames: [String] {
        var names: [String] = []
        for group in groups {
            names.append(group.groupName)
        }
        return names
    }
    
    // Returns groups
    var groupCount: Int {
        return groups.count
    }
    
    // Adds group
    func addGroup(groupName: String) {
        let newGroup = GroupModel(name: groupName)
        
        groups.append(newGroup)
    }
    
    // Add item and string to the group
    func add(item: String, groupName: String) {
        let existingGroup = get(groupName: groupName)
        if let existingGroup = existingGroup {
            existingGroup.items.append(item)
        } else {
            let newGroup = GroupModel(name: groupName)
            newGroup.items.append(item)
            groups.append(newGroup)
        }
    }
    // finds number of items inside a group
    func numberOfItemsIn(groupName: String) -> Int {
        if let group = get(groupName: groupName) {
            return group.items.count
        } else {
            return 0
        }
    }
    // returns items in the each group
    func getItemsFor(groupName: String) -> [String] {
        if let group = get(groupName: groupName) {
            return group.items
        } else {
            return []
        }
    }
    // returns item from specific group
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
    
    // returns group
    func get(groupName: String) -> GroupModel? {
        var existingGroup: GroupModel?
        for thisGroup in groups {
            if thisGroup.groupName == groupName {
                existingGroup = thisGroup
            }
        }
        return existingGroup
    }
    // returns group by number
    func get(groupNumber: Int) -> GroupModel? {
        if groupNumber < 0 || groupNumber >= groups.count {
            return nil
        }
        let group = groups[groupNumber]
        return group
    }
    // Removes all groups
    func removeAll(){
        groups.removeAll()
    }
    // gets group name by number
    func getGroupName(index: Int) -> String?{
        if index < 0 || index >= groups.count {
            return nil
        }
        let group = groups[index]
        return group.groupName
    }
    // deletes group by number 
    func deleteGroupAt(index: Int) {
        if index < 0 || index >= groups.count {
            return
        }
        groups.remove(at: index)
    }
}
