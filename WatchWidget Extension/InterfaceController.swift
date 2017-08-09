//
//  InterfaceController.swift
//  WatchWidget Extension
//
//  Created by Borja Rodriguez Sánchez on 8/8/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var accountTable: WKInterfaceTable!

    let accountNames = ["HrPLGNSt" , "ACCOUNT", "ACCNO"]
    
      override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func changeList() {
        loadTableData()
    }
    
    private func loadTableData(){
        accountTable.setNumberOfRows(accountNames.count, withRowType: "AccountRowController")
        for i in 0 ..< accountNames.count {
            if let row = accountTable.rowController(at: i) as? AccountRowController {
                row.accountName.setText(accountNames[i])
            }
        }
        
    }

}
