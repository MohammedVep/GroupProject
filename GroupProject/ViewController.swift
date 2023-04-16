//
//  ViewController.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-02-17.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var shoppingView: UITableView!
    @IBOutlet weak var PriceA: UITextField!
    @IBOutlet weak var PriceB: UITextField!
    @IBOutlet weak var PriceC: UITextField!
    @IBOutlet weak var subTotalField: UILabel!

    @IBOutlet weak var taxField: UILabel!

    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var ItemA: UITextField!
    @IBOutlet weak var ItemB: UITextField!
    @IBOutlet weak var ItemC: UITextField!

    
    
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
        taxField.text = formatter.string(from: NSNumber(value: tax))
        subTotalField.text = formatter.string(from: NSNumber(value: subtotal))
        totalField.text = formatter.string(from: NSNumber(value: total))
        
    }
    
    @IBAction func Clear(_ sender: Any) {
        PriceA.text = String("-")
        PriceB.text = String("-")
        PriceC.text = String("-")
        ItemA.text = String("-")
        ItemB.text = String("-")
        ItemC.text = String("-")
        totalField.text = String("-")
        subTotalField.text = String("-")
        taxField.text = String("-")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        shoppingView.delegate = self
        shoppingView.dataSource = self
    }


}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension  ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") ?? UITableViewCell()
        return cell
    }
}

