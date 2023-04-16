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
    @IBOutlet weak var subTotalField: UILabel!
    
    @IBOutlet weak var taxField: UILabel!
    
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var ItemA: UITextField!
    
    @IBAction func didTapAddItem(_ sender: Any) {
        guard let itemName = ItemA.text else { return }
        let priceName = PriceA.text
        guard let indexPath = shoppingView.indexPathForSelectedRow else {
            return
        }
        let section = indexPath.section
        if let group = GroupsModel.shared.get(groupNumber: section) {
            let name = group.groupName
            GroupsModel.shared.add(item: itemName, groupName: name)
        }
//        model.GroupAt(index: section)
        shoppingView.reloadData()
    }
    //Add a button next to item name and price with title "add"
    //When this button is cliecked add an action
    //IBAction func didTapAddItem(_ sender: any){
        //fetch the model
    
    //Determine which group is currently selected by calling method on the table
    //(See ManageGroupsViewController.delete function for example
        //Call the function on the model to add an item (See tests for example)
    //Refresh table by calling table.reloadData()
        
    @IBAction func Calculate(_ sender: Any) {
        guard
            let itemA = Double(PriceA.text ?? "")
        else { return }
        
        let subtotal = itemA
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
        ItemA.text = String("-")
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
    func numberOfSections(in: UITableView) -> Int{
        let sections = GroupsModel.shared.groupCount
        return sections
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        let sectionName = GroupsModel.shared.getGroupName(index: section)
        return sectionName
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let group = GroupsModel.shared.get(groupNumber: section) {
            return group.items.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") ?? UITableViewCell()
        return cell
    }
}

