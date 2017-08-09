//
//  Account.swift
//  Amaris
//
//  Created by Borja Rodriguez Sánchez on 7/8/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class Account: NSObject {
    
    var accountBalanceInCents : Int
    var accountCurrency : String
    var accountId : Int
    var accountName : String
    var accountNumber : Int
    var accountType : String
    var alias : String
    var isVisible : Bool
    var iban : String
    var linkedAccountId : Int
    var productName : String
    var productType : Int
    var savingsTargetReached : Int
    var targetAmountInCents : Int
    
    
    init(accountBalanceInCents : Int, accountCurrency : String,accountId: Int,accountName: String,accountNumber: Int,accountType: String,alias: String,isVisible: Bool, iban:String, linkedAccountId:Int,  productName:String, productType:Int,savingsTargetReached:Int,targetAmountInCents:Int) {
        self.accountBalanceInCents = accountBalanceInCents
        self.accountCurrency = accountCurrency
        self.accountId = accountId
        self.accountName = accountName
        self.accountNumber = accountNumber
        self.accountType = accountType
        self.alias = alias
        self.isVisible = isVisible
        self.iban = iban
        self.linkedAccountId = linkedAccountId
        self.productName = productName
        self.productType = productType
        self.savingsTargetReached = savingsTargetReached
        self.targetAmountInCents = targetAmountInCents
        
    }
    
    
    /// Init to create an empty account
    override init() {
        self.accountBalanceInCents = 0
        self.accountCurrency = ""
        self.accountId = 0
        self.accountName = ""
        self.accountNumber = 0
        self.accountType = ""
        self.alias = ""
        self.isVisible = false
        self.iban = ""
        self.linkedAccountId = 0
        self.productName = ""
        self.productType = 0
        self.savingsTargetReached = 0
        self.targetAmountInCents = 0

    }
}
