//
//  Api.swift
//  Amaris
//
//  Created by Borja Rodriguez Sánchez on 7/8/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class Api: NSObject {
    var list1 = [Account]()
    var list2 = [Account]()
    var json = [String : Any]()

    
    ///As the object given does not come from an API, and is not a real JSON, i had not used any Framework to parse that JSON as i normally use, such as SwiftyJson, Alamofire, o even image caché like Haneke. So in this fuction the only thing is done, format the object given, so i can treat it as a Dictionary.

    func loadJson(){
        json = [
            "accounts" : [
                [
                    "accountBalanceInCents" : 985000,
                    "accountCurrency" : "EUR",
                    "accountId" : 74875769,
                    "accountName" : "HrPLGNStellingTD",
                    "accountNumber" : 748757694,
                    "accountType" : "PAYMENT",
                    "alias" : "",
                    "isVisible" : true,
                    "iban" : "NL23INGB0748757694"
                ],
                [
                    "accountBalanceInCents" : 1000000,
                    "accountCurrency" : "EUR",
                    "accountId" : 700000027559,
                    "accountName" : "ACCOUNTNAME2",
                    "accountNumber" : 748757732,
                    "accountType" : "PAYMENT",
                    "alias": "",
                    "isVisible" : false,
                    "iban" : "NL88INGB0748757732"
                ],
                [
                    "accountBalanceInCents" : 15000,
                    "accountCurrency" : "EUR",
                    "accountId" : 700000027559,
                    "accountName" : "ACCNOºBINT",
                    "accountNumber" : 17727066,
                    "accountType" : "SAVING",
                    "alias" : "UfffdLSAVINGSdiacrits",
                    "iban" : "NL23534523525",
                    "isVisible" : true,
                    "linkedAccountId" : 748757694,
                    "productName" : "Oranje Spaarrekening",
                    "productType" : 1000,
                    "savingsTargetReached" : 1,
                    "targetAmountInCents" : 2000,
                    ]
            ],
            "failedAccountTypes" : "CREDITCARDS",
            "returnCode" : "OK"
        ]
        
        
        if let arr = json["accounts"] as? [[String: Any]] {
            for file in arr {
                let accountBalanceInCents = file["accountBalanceInCents"] as? Int
                let accountCurrency = file["accountCurrency"] as? String
                let accountId = file["accountId"] as? Int
                let accountName = file["accountName"] as? String
                let accountNumber = file["accountNumber"] as? Int
                let accountType = file["accountType"] as? String
                var linkedAccountId = Int()
                var productName = String()
                var productType = Int()
                var savingsTargetReached = Int()
                var targetAmountInCents = Int()
                
                    if accountType == "SAVING"{
                           linkedAccountId = (file["linkedAccountId"] as? Int)!
                           productName = (file["productName"] as? String)!
                           productType = (file["productType"] as? Int)!
                           savingsTargetReached = (file["savingsTargetReached"] as? Int)!
                           targetAmountInCents = (file["targetAmountInCents"] as? Int)!
                    }else{
                         linkedAccountId = 0
                         productName = ""
                         productType = 0
                         savingsTargetReached = 0
                         targetAmountInCents = 0
                        
                    }
                let alias = file["alias"] as? String
                let isVisible = file["isVisible"] as? Bool
                let iban = file["iban"] as? String
                
                let account = Account(accountBalanceInCents: accountBalanceInCents!, accountCurrency: accountCurrency!, accountId: accountId!, accountName: accountName!, accountNumber: accountNumber!, accountType: accountType!, alias: alias!, isVisible: isVisible!, iban: iban!, linkedAccountId: linkedAccountId, productName: productName, productType: productType, savingsTargetReached: savingsTargetReached, targetAmountInCents: targetAmountInCents)
                
                if accountType == "SAVING"{
                    list2.append(account)
                }else{
                    list1.append(account)
                }

            }

        }

        
    }
    

}
