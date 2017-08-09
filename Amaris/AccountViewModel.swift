//
//  AccountViewModel.swift
//  Amaris
//
//  Created by Borja Rodriguez Sánchez on 8/8/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class AccountViewModel {

    var api = Api()
    var list1 = [Account]()
    var list2 = [Account]()
    
    private var account = Account()
   
    
    //Load all JSON info, create both lists and asign them to my local variables, where will be used by our view, in this case de ViewController.
    func loadData(){
        api.loadJson()
        list1 = api.list1
        list2 = api.list2
    }
    
}
