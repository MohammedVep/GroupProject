//
//  ManageGroupsViewController.swift
//  GroupProject
//
//  Created by Mohammed Vepari on 2023-04-15.
//

import UIKit

class ManageGroupsViewController: UIViewController {
    var model : ModelProtocol = Model()
    
    
    @IBOutlet weak var groupNameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func AddGroupButton(_ sender: UIButton) {
    }
    
    @IBAction func DeleteGroupButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ManageGroupsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
  
  
extension  ManageGroupsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.groupCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") ?? UITableViewCell()
        let groups = model.groupNames
        cell.textLabel?.text = groups[indexPath.row]
        return cell
    }
}

