//
//  GroupModelTest.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-16.
//

import XCTest

final class GroupsModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let model = GroupsModel.shared
        model.removeAll()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddingGroup() throws {
        let model = GroupsModel.shared
        XCTAssert(model.groupCount == 0)
        model.addGroup(groupName: "apple")
        XCTAssert(model.groupCount == 1)
        let groupName = model.getGroupName(index: 0)
        XCTAssert(groupName == "apple")
    }
    func testAddingItems() throws {
        let model = GroupsModel.shared
        // If group does not exist, add new one
        XCTAssert(model.groupCount == 0)
        model.add(item: "banana", groupName: "fruit")
        XCTAssert(model.groupCount == 1)
        // if group does exist, should add item to existing group
        model.add(item: "apple", groupName: "fruit")
        XCTAssert(model.groupCount == 1)
        // it should show correct number of items in the group
        XCTAssert(model.numberOfItemsIn(groupName: "vegtable") == 0)
        XCTAssert(model.numberOfItemsIn(groupName: "fruit") == 2)
    }
    
    func testGettingItems() throws {
        let model = GroupsModel.shared
        model.add(item: "banana", groupName: "fruit")
        model.add(item: "apple", groupName: "fruit")
        let items = model.getItemsFor(groupName: "fruit")
        XCTAssert(items == ["banana", "apple"])
        let items2 = model.getItemsFor(groupName: "vegetable")
        XCTAssert(items2 == [])
        
    }
    
    func testGetSpecificItem() throws {
        // Should be able to fetch specific item from a group
        let model = GroupsModel.shared
        model.add(item: "banana", groupName: "fruit")
        model.add(item: "apple", groupName: "fruit")
        let item = model.get(itemNumber: 0, groupName: "fruit")
        XCTAssert(item == "banana")
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
