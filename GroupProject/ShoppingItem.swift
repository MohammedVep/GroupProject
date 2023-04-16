//
//  ShoppingItem.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
//

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
