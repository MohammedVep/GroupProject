//
//  ViewController.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
// ID: 101345468

// Ibrahim Elmi - 101241704
// Abdur Rahman Fahad - 101295960
//
//Mohammed Abdiwahab Hussein - 101308661

import UIKit

class ViewController: UIViewController {
    
    // Variables for Price text field
    @IBOutlet weak var PriceA: UITextField!
    @IBOutlet weak var PriceB: UITextField!
    @IBOutlet weak var PriceC: UITextField!
    @IBOutlet weak var PriceD: UITextField!
    @IBOutlet weak var PriceE: UITextField!
    @IBOutlet weak var PriceF: UITextField!
    //Variable for subTotal Field
    @IBOutlet weak var subTotalField: UILabel!
    //Variable for tax Field
    @IBOutlet weak var taxField: UILabel!
    // Variable for total fields
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    
    //Variables for Items field
    @IBOutlet weak var ItemA: UITextField!
    @IBOutlet weak var ItemB: UITextField!
    @IBOutlet weak var ItemC: UITextField!
    @IBOutlet weak var ItemD: UITextField!
    @IBOutlet weak var ItemE: UITextField!
    @IBOutlet weak var ItemF: UITextField!
    
    //This function is designed to calculated price of items from A to F
    @IBAction func Calculate(_ sender: Any) {
        guard
            let itemA = Double(PriceA.text ?? ""),
            let itemB = Double(PriceB.text ?? ""),
            let itemC = Double(PriceC.text ?? ""),
            let itemD =
                Double(PriceD.text ??
                ""),
            let itemE =
                Double(PriceE.text
                ?? ""),
            let itemF =
                Double(PriceF.text
                ?? "")
            
        else { return }
        
        // This calculates subtotal of items
        let subtotal = itemA + itemB + itemC + itemD + itemE + itemF
        // This calculates the Ontario HST of the items
        let tax = subtotal * 0.13
        // This calculates the total cost of the items
        let total = subtotal + tax
        // This is the formatter for the items
        let formatter = NumberFormatter()
        // This allows number style to be decimal
        formatter.numberStyle = .decimal
        // This convert tax, subtotal and total cost to format string from number
        taxField.text = formatter.string(from: NSNumber(value: tax))
        subTotalField.text = formatter.string(from: NSNumber(value: subtotal))
        totalField.text = formatter.string(from: NSNumber(value: total))
        
    }
    
    // This function clears all items information and assigns values to -
    @IBAction func Clear(_ sender: Any) {
        // Assigns price string to -
        PriceA.text = String("-")
        // Assigns items string to -
        ItemA.text = String("-")
        // Assigns price string to -
        PriceB.text = String("-")
        // Assigns items string to -
        ItemB.text = String("-")
        // Assigns price string to -
        PriceC.text = String("-")
        // Assigns items string to -
        ItemC.text = String("-")
        // Assigns price string to -
        PriceD.text = String("-")
        // Assigns items string to -
        ItemD.text = String("-")
        // Assigns price string to -
        PriceE.text = String("-")
        // Assigns items string to -
        ItemE.text = String("-")
        // Assigns price string to -
        PriceF.text = String("-")
        // Assigns items string to -
        ItemF.text = String("-")
        // Assigns total string to -
        totalField.text = String("-")
        // Assigns subtotal string to -
        subTotalField.text = String("-")
        // Assigns tax string to -
        taxField.text = String("-")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }


}
