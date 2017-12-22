//
//  JSONClasses.swift
//  CrypCurrency
//
//  Created by Quang Tran on 12/19/17.
//  Copyright © 2017 Quang Tran. All rights reserved.
//

import Foundation

/****************************************************/
/*              Coin Base JSON Class                */
/****************************************************/
struct Data : Codable{
    var base : String!
    var currency : String!
    var amount : String!
    init(){
        base = ""
        currency = ""
        amount = ""
    }
}
class CoinBase : Codable {
    var data : Data!
    init(){
        data = Data()
    }
}

/****************************************************/
/*              Bittrex JSON Class                  */
/****************************************************/

struct Result : Codable {
    var Bid : Double!
    var Ask : Double!
    var Last : Double!
    init (){
        Bid = 0.0
        Ask = 0.0
        Last = 0.0
    }
}
class Bittrex : Codable {
    var success : Bool!
    var message : String!
    var result : Result!
    init(){
        success = true
        message = ""
        result = Result()
    }
}
