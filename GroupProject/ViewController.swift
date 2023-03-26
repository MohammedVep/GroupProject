//
//  ViewController.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-02-17.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var PriceA: UITextField!
    @IBOutlet weak var PriceB: UITextField!
    @IBOutlet weak var PriceC: UITextField!
    @IBOutlet weak var SubTotal: UILabel!
    @IBOutlet weak var Tax: UILabel!
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var ItemA: UITextField!
    @IBOutlet weak var ItemB: UITextField!
    @IBOutlet weak var ItemC: UITextField!
    
    
    @IBAction func DeleteGroup(_ sender: Any) {
        categoryName.text = String("-")
    }
    
    @IBAction func Calculate(_ sender: Any) {
        guard
            let itemA = Double(PriceA.text ?? ""),
            let itemB = Double(PriceB.text ?? ""),
            let itemC = Double(PriceC.text ?? "")
        else { return }
        
        let subtotal = itemA + itemB + itemC
        let tax = subtotal * 0.13
        let total = subtotal + tax
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        Tax.text = formatter.string(from: NSNumber(value: tax))
        SubTotal.text = formatter.string(from: NSNumber(value: subtotal))
        Total.text = formatter.string(from: NSNumber(value: total))
        
    }
    
    @IBAction func Clear(_ sender: Any) {
        PriceA.text = String("-")
        PriceB.text = String("-")
        PriceC.text = String("-")
        ItemA.text = String("-")
        ItemB.text = String("-")
        ItemC.text = String("-")
        Total.text = String("-")
        SubTotal.text = String("-")
        Tax.text = String("-")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

