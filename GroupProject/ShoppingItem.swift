//
//  ShoppingItem.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
// ID: 101345468

// Ibrahim Elmi - 101241704
// Abdur Rahman Fahad - 101295960
//
//Mohammed Abdiwahab Hussein - 101308661

import Foundation

class ShoppingItem {
    var item: String = ""
    var price: Float = 0.0
    var id: Int = 0
    
    init(id:Int, item:String, price:Float)
    {
        self.id = id
        self.item = item
        self.price = price
    }
}
