//
//  ViewController.swift
//  Amaris
//
//  Created by Borja Rodriguez Sánchez on 7/8/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var segmentList: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    var accountListToDisplay = [Account]()
    var accountVM = AccountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentList.setTitle("List 1", forSegmentAt: 0)
        segmentList.setTitle("List 2", forSegmentAt: 1)
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //As i am using MVVM Pattern, i delegate all the working procceses to the AccountViewModel.
        //So in this "View" i have only to paint the info.
        accountVM.loadData()
        accountListToDisplay = accountVM.list1
        tableView.reloadData()
        
    }

    @IBAction func changeListDisplay(_ sender: Any) {
        switch segmentList.selectedSegmentIndex
        {
        case 0:
            accountListToDisplay = accountVM.list1
            tableView.reloadData()
        case 1:
            accountListToDisplay = accountVM.list2
            tableView.reloadData()

        default:
            break; 
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountListToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell" , forIndexPath: indexPath) as! UITableViewCell
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let accountName = cell.viewWithTag(1) as! UILabel
        accountName.text = accountListToDisplay[indexPath.row].accountName
        let iban = cell.viewWithTag(2) as! UILabel
        iban.text = accountListToDisplay[indexPath.row].iban
        let balance = cell.viewWithTag(3) as! UILabel
        balance.text = String(accountListToDisplay[indexPath.row].accountBalanceInCents)
        
        return cell
        
    }


}

