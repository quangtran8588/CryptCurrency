//
//  ViewController.swift
//  CrypCurrency
//
//  Created by Quang Tran on 12/18/17.
//  Copyright © 2017 Quang Tran. All rights reserved.
//

import UIKit
import CoreFoundation

struct Object {
    var market : String!
    var coinbase = [CoinBase]()
    var bittrex = [Bittrex]()
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var showAll: UIButton!
    @IBOutlet weak var showEUR: UIButton!
    @IBOutlet weak var showUSD: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var headerSelection : UITableViewHeaderFooterView!
    var hiddenSection = [false, false]
    var mode : String = "Night"
    
    //  Boolean varibles to filter
    var isShowedUSD = true
    var isShowedEUR = true
    
    //  Objects Array to save JSON data from multiple exchange markets
    var objectsArray = [Object]()
    var object = Object()
    
    //  Coin Base links to download Data
    var BTCUSD = "https://api.coinbase.com/v2/prices/BTC-USD/spot"
    var BTCEUR = "https://api.coinbase.com/v2/prices/BTC-EUR/spot"
    var ETHUSD = "https://api.coinbase.com/v2/prices/ETH-USD/spot"
    var ETHEUR = "https://api.coinbase.com/v2/prices/ETH-EUR/spot"
    var LTCUSD = "https://api.coinbase.com/v2/prices/LTC-USD/spot"
    var LTCEUR = "https://api.coinbase.com/v2/prices/LTC-EUR/spot"
    
    var BTCUSD_buy = "https://api.coinbase.com/v2/prices/BTC-USD/buy"
    var BTCEUR_buy = "https://api.coinbase.com/v2/prices/BTC-EUR/buy"
    var ETHUSD_buy = "https://api.coinbase.com/v2/prices/ETH-USD/buy"
    var ETHEUR_buy = "https://api.coinbase.com/v2/prices/ETH-EUR/buy"
    var LTCUSD_buy = "https://api.coinbase.com/v2/prices/LTC-USD/buy"
    var LTCEUR_buy = "https://api.coinbase.com/v2/prices/LTC-EUR/buy"
    
    var BTCUSD_sell = "https://api.coinbase.com/v2/prices/BTC-USD/sell"
    var BTCEUR_sell = "https://api.coinbase.com/v2/prices/BTC-EUR/sell"
    var ETHUSD_sell = "https://api.coinbase.com/v2/prices/ETH-USD/sell"
    var ETHEUR_sell = "https://api.coinbase.com/v2/prices/ETH-EUR/sell"
    var LTCUSD_sell = "https://api.coinbase.com/v2/prices/LTC-USD/sell"
    var LTCEUR_sell = "https://api.coinbase.com/v2/prices/LTC-EUR/sell"
    
    //  Bittrex links to download data
    var Bittrex_BTCUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-BTC"
    var Bittrex_ETHUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-ETH"
    var Bittrex_XRPUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-XRP"
    var Bittrex_BCCUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-BCC"
    var Bittrex_LTCUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-LTC"
    var Bittrex_NEOUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-NEO"
    var Bittrex_ETCUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-ETC"
    var Bittrex_BTGUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-BTG"
    var Bittrex_ZECUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-ZEC"
    var Bittrex_OMGUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-OMG"
    var Bittrex_DASHUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-DASH"
    var Bittrex_XMRUSD = "https://bittrex.com/api/v1.1/public/getticker?market=USDT-XMR"
    
    var Bittrex_Currencies = ["BTC/USD","ETH/USD","XRP/USD","BCC/USD","LTC/USD","NEO/USD","ETC/USD","BTG/USD","ZEC/USD","OMG/USD","DASH/USD","XMR/USD",]
    var copied_Currencies = ["BTC/USD","ETH/USD","XRP/USD","BCC/USD","LTC/USD","NEO/USD","ETC/USD","BTG/USD","ZEC/USD","OMG/USD","DASH/USD","XMR/USD",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundModeColor()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global(qos: .userInitiated).sync {
            self.CoinbaseData()
            self.BittrexData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

/**********************************************************************************************/
/*              Pulling Data from market exchange APIs                                        */
/*    - https://api.coinbase.com/                                                             */
/*    - https://bittrex.com/                                                                  */
/*      To be continued.......                                                                */
/**********************************************************************************************/
    //  Download currency pairs price data from Coin Base
    func CoinbaseData(){
        object.market = "Coin Base";

        getCoinBaseData(urlLink: BTCUSD, currencyType: "USD")
        getCoinBaseData(urlLink: BTCUSD_buy, currencyType: "USD")
        getCoinBaseData(urlLink: BTCUSD_sell, currencyType: "USD")

        getCoinBaseData(urlLink: ETHUSD, currencyType: "USD")
        getCoinBaseData(urlLink: ETHUSD_buy, currencyType: "USD")
        getCoinBaseData(urlLink: ETHUSD_sell, currencyType: "USD")

        getCoinBaseData(urlLink: LTCUSD, currencyType: "USD")
        getCoinBaseData(urlLink: LTCUSD_buy, currencyType: "USD")
        getCoinBaseData(urlLink: LTCUSD_sell, currencyType: "USD")

        getCoinBaseData(urlLink: BTCEUR, currencyType: "EUR")
        getCoinBaseData(urlLink: BTCEUR_buy, currencyType: "EUR")
        getCoinBaseData(urlLink: BTCEUR_sell, currencyType: "EUR")

        getCoinBaseData(urlLink: ETHEUR, currencyType: "EUR")
        getCoinBaseData(urlLink: ETHEUR_buy, currencyType: "EUR")
        getCoinBaseData(urlLink: ETHEUR_sell, currencyType: "EUR")

        getCoinBaseData(urlLink: LTCEUR, currencyType: "EUR")
        getCoinBaseData(urlLink: LTCEUR_buy, currencyType: "EUR")
        getCoinBaseData(urlLink: LTCEUR_sell, currencyType: "EUR")
        
        objectsArray.append(object)
        object.market = ""; object.coinbase.removeAll()
    }
    //  Get JSON data from CoinBase
    func getCoinBaseData(urlLink : String, currencyType : String){
        let request = URLRequest(url: NSURL(string: urlLink)! as URL)
        do {
            // Perform the request
            var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
            let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)
            let jsonDecoder = JSONDecoder()
            if (currencyType == "USD"){
                let jsonData = try jsonDecoder.decode(CoinBase.self, from: data)
                print("Data: \(jsonData.data!)")
                self.object.coinbase.append(jsonData)
            }
            else if (currencyType == "EUR"){
                let jsonData = try jsonDecoder.decode(CoinBase.self, from: data)
                print("Data: \(jsonData.data!)")
                self.object.coinbase.append(jsonData)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            print(error)
        }
    }
    
    //  Download currency pairs price data from Bittrex
    func BittrexData(){
        object.market = "Bittrex"
        
        getBittrexData(urlLink: Bittrex_BTCUSD)
        getBittrexData(urlLink: Bittrex_ETHUSD)
        getBittrexData(urlLink: Bittrex_XRPUSD)
        getBittrexData(urlLink: Bittrex_BCCUSD)
        getBittrexData(urlLink: Bittrex_LTCUSD)
        getBittrexData(urlLink: Bittrex_NEOUSD)
        getBittrexData(urlLink: Bittrex_ETCUSD)
        getBittrexData(urlLink: Bittrex_BTGUSD)
        getBittrexData(urlLink: Bittrex_ZECUSD)
        getBittrexData(urlLink: Bittrex_OMGUSD)
        getBittrexData(urlLink: Bittrex_DASHUSD)
        getBittrexData(urlLink: Bittrex_XMRUSD)
        
        objectsArray.append(object)
        object.market = ""; object.bittrex.removeAll()
    }
    //  Get JSON data from Bittrex
    func getBittrexData(urlLink: String) {
        let request = URLRequest(url: NSURL(string: urlLink)! as URL)
        do{
            var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
            let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)
            let jsonDecoder = JSONDecoder()
            let jsonData = try jsonDecoder.decode(Bittrex.self, from: data)
            print("Data: \(jsonData.result!)")
            jsonData.message = Bittrex_Currencies[0]
            self.object.bittrex.append(jsonData)
            Bittrex_Currencies.remove(at: 0)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            print(error)
        }
    }
    
    func refresh(){
        objectsArray.removeAll()
        Bittrex_Currencies = copied_Currencies
        CoinbaseData()
        BittrexData()
    }
    
    @IBAction func test(_ sender: Any) {
        refresh()
    }

/**********************************************************************************************/
/*              Set Up Table View to be displayed                                             */
/*    - Number of section in table view                                                       */
/*    - Number of row for each section                                                        */
/*    - Header section's title:  height, text, tap gesture to expanded/collapsed section      */
/*    - Information to be displayed on each cell row of each section                          */
/**********************************************************************************************/
    
    //  Function to return number of section in Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    //  Function to set up header's height in section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //  Function to display Header's title and configure tap gesture recognizer
    //  User tap/touch on specific header's title, then section will be expanded/collapsed
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerSelection = UITableViewHeaderFooterView()
        headerSelection.textLabel?.text = objectsArray[section].market
        headerTableViewModeColor()
        headerSelection.tag = section
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerTapHandling))
        tapRecognizer.delegate = self
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        headerSelection.addGestureRecognizer(tapRecognizer)
        return headerSelection
    }
    @objc func headerTapHandling(tap: UIGestureRecognizer){
        let section = tap.view!.tag
        self.hiddenSection[section] = !self.hiddenSection[section]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //  Function to configure number of row for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numbOfRow = 0
        if (objectsArray[section].market == "Coin Base" && hiddenSection[0]) {
            numbOfRow = objectsArray[section].coinbase.count / 3
        }
        else if (objectsArray[section].market == "Bittrex" && hiddenSection[1]) {
            numbOfRow = objectsArray[section].bittrex.count
        }
        return numbOfRow
    }
    
    //  Function to implement information to be displayed on each cell row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let typeLbl = cell?.viewWithTag(1) as! UILabel
        let currentPriceLbl = cell?.viewWithTag(2) as! UILabel
        let updownImage = cell?.viewWithTag(3) as! UIImageView
        let percentLbl = cell?.viewWithTag(4) as! UILabel
        let bidLbl = cell?.viewWithTag(5) as! UILabel
        let bidPriceLbl = cell?.viewWithTag(6) as! UILabel
        let askLbl = cell?.viewWithTag(7) as! UILabel
        let askPriceLbl = cell?.viewWithTag(8) as! UILabel
        
        if (objectsArray[indexPath.section].market == "Coin Base" && hiddenSection[0]){
            if (isShowedUSD && indexPath.row < (objectsArray[indexPath.section].coinbase.count / 2)){
                typeLbl.text = objectsArray[indexPath.section].coinbase[3 * indexPath.row].data.base + "/" + objectsArray[indexPath.section].coinbase[3 * indexPath.row].data.currency
                currentPriceLbl.text = objectsArray[indexPath.section].coinbase[3 * indexPath.row].data.amount
                bidPriceLbl.text = objectsArray[indexPath.section].coinbase[3 * indexPath.row + 1].data.amount
                askPriceLbl.text = objectsArray[indexPath.section].coinbase[3 * indexPath.row + 2].data.amount
            }
            else if (isShowedEUR){
                var modifyIndex = (objectsArray[indexPath.section].coinbase.count / 2)
                typeLbl.text = objectsArray[indexPath.section].coinbase[3 * indexPath.row - modifyIndex].data.base + "/" + objectsArray[indexPath.section].coinbase[3 * indexPath.row - modifyIndex].data.currency
                currentPriceLbl.text = objectsArray[indexPath.section].coinbase[3 * indexPath.row - modifyIndex].data.amount
                bidPriceLbl.text = objectsArray[indexPath.section].coinbase[3 * indexPath.row - modifyIndex + 1].data.amount
                askPriceLbl.text = objectsArray[indexPath.section].coinbase[3 * indexPath.row - modifyIndex + 2].data.amount
            }
        }
        else if (objectsArray[indexPath.section].market == "Bittrex" && hiddenSection[1]){
            typeLbl.text = objectsArray[indexPath.section].bittrex[indexPath.row].message
            currentPriceLbl.text = String(format: "%.3f", objectsArray[indexPath.section].bittrex[indexPath.row].result.Last)
            bidPriceLbl.text = String(format: "%.3f", objectsArray[indexPath.section].bittrex[indexPath.row].result.Bid)
            askPriceLbl.text = String(format: "%.3f", objectsArray[indexPath.section].bittrex[indexPath.row].result.Ask)
        }
        
        tableViewCellModeColor(typeLbl: typeLbl, currentPriceLbl: currentPriceLbl, bidLbl: bidLbl, askLbl: askLbl, askPriceLbl: askPriceLbl, bidPriceLbl: bidPriceLbl, cell: cell!)
        
        return cell!
    }
    
    func backgroundModeColor(){
        if (mode == "Day"){
            self.tableView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
            self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        }
        else if (mode == "Night"){
            self.tableView.backgroundColor = UIColor(red: 204/255, green: 209/255, blue: 255/255, alpha: 0.1)
            self.view.backgroundColor = UIColor(red: 204/255, green: 209/255, blue: 255/255, alpha: 0.1)
        }
        designButtons()
    }
    
/**********************************************************************************************/
/*              Set up UI Mode Color (Day/Night Mode)                                         */
/*    - buttons, background, cells, headers, texts                                            */
/**********************************************************************************************/
    func tableViewCellModeColor(typeLbl : UILabel, currentPriceLbl : UILabel, bidLbl : UILabel, askLbl : UILabel, askPriceLbl : UILabel, bidPriceLbl : UILabel, cell : UITableViewCell) {
        if (mode == "Day"){
            cell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.02)
            typeLbl.textColor = UIColor.blue
            currentPriceLbl.textColor = UIColor.blue
            bidLbl.textColor = UIColor.blue
            askLbl.textColor = UIColor.blue
            bidPriceLbl.textColor = UIColor.blue
            askPriceLbl.textColor = UIColor.blue
        }
        else if (mode == "Night"){
            cell.backgroundColor = UIColor(red: 204/255, green: 209/255, blue: 255/255, alpha: 0.02)
            typeLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
            currentPriceLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
            bidLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
            askLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
            bidPriceLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
            askPriceLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    func headerTableViewModeColor(){
        headerSelection.layer.borderWidth = 1
        if (mode == "Day"){
            headerSelection.contentView.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0)
            headerSelection.layer.borderColor = UIColor.black.cgColor
            headerSelection.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            headerSelection.textLabel?.textColor = UIColor.black
        }
        else if (mode == "Night"){
            headerSelection.contentView.backgroundColor = UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1.0)
            headerSelection.layer.borderColor = UIColor.lightGray.cgColor
            headerSelection.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            headerSelection.textLabel?.textColor = UIColor.black
        }
    }

    //  Design buttons "All", "USD", "EUR" shape, border, color
    func designButtons(){
        modifiedButton(button: showAll)
        modifiedButton(button: showEUR)
        modifiedButton(button: showUSD)
    }
    func modifiedButton(button: UIButton){
        if (mode == "Day"){
            button.layer.borderColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0).cgColor
            button.titleLabel?.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
        }
        else if (mode == "Night"){
            button.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
            button.titleLabel?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

