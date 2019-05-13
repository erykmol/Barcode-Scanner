//
//  HistoryTableViewController.swift
//  Scanner
//
//  Created by Eryk Mól on 14.04.19.
//  Copyright © 2019 Eryk Mól. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    var userDefaultsData : [Any] = []
    var selectedCell = HistoryCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        let history = UserDefaults.standard.array(forKey: "history") as! [Any]
        userDefaultsData = history
        
        self.tableView.register(HistoryCell.self, forCellReuseIdentifier: "historyCell")
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        //self.tableView.rowHeight = 100;
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userDefaultsData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as! HistoryCell
        //cell.translatesAutoresizingMaskIntoConstraints = false
        
        cell.backgroundColor = UIColor(white: 0.315, alpha: 1.0)
        cell.layoutSubviews()
        
        let firstItem = userDefaultsData[indexPath.row] as! Dictionary<String, AnyObject>;
        let name = firstItem["name"] as! String
        let scan = firstItem["scan"] as! String
        let imageData = firstItem["image"] as! Data;
        let image = UIImage(data: imageData);

        cell.cellImageView.image = image
        cell.nameLabel.text = name
        cell.codeLabel.text = scan
        
        
         //Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCell = tableView.cellForRow(at: indexPath) as! HistoryCell
        performSegue(withIdentifier: "DetailsViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DetailsController = segue.destination as! DetailsViewController
        DetailsController.stringScan = self.selectedCell.codeLabel.text!.components(separatedBy: " ")[2]
    }

//    override func viewWillAppear(_ animated : Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated : Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }

}
