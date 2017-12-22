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
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var showAll: UIButton!
    @IBOutlet weak var showEUR: UIButton!
    @IBOutlet weak var showUSD: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
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
    
    //  Coin Base variables to store JSON data
    var coinBase_USD = [CoinBase]();     var coinBaseBuy_USD = [CoinBase]();      var coinBaseSell_USD = [CoinBase]();
    var coinBase_EUR = [CoinBase]();     var coinBaseBuy_EUR = [CoinBase]();      var coinBaseSell_EUR = [CoinBase]()
    
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
    
    var isShowedUSD = true
    var isShowedEUR = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        designButtons()
        tableView.delegate = self
        tableView.dataSource = self
        
        CoinbaseData()
        BittrexData()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
//            self.tableView.reloadData()
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func CoinbaseData(){
        object.market = "Coin Base";
//        DispatchQueue.main.async {
//            self.getCoinBaseData(urlLink: self.BTCUSD, currencyType: "USD")
//            self.getCoinBaseData(urlLink: self.BTCUSD_buy, currencyType: "USD")
//            self.getCoinBaseData(urlLink: self.BTCUSD_sell, currencyType: "USD")
//
//            self.getCoinBaseData(urlLink: self.ETHUSD, currencyType: "USD")
//            self.getCoinBaseData(urlLink: self.ETHUSD_buy, currencyType: "USD")
//            self.getCoinBaseData(urlLink: self.ETHUSD_sell, currencyType: "USD")
//
//            self.getCoinBaseData(urlLink: self.LTCUSD, currencyType: "USD")
//            self.getCoinBaseData(urlLink: self.LTCUSD_buy, currencyType: "USD")
//            self.getCoinBaseData(urlLink: self.LTCUSD_sell, currencyType: "USD")
//
//            self.getCoinBaseData(urlLink: self.BTCEUR, currencyType: "EUR")
//            self.getCoinBaseData(urlLink: self.BTCEUR_buy, currencyType: "EUR")
//            self.getCoinBaseData(urlLink: self.BTCEUR_sell, currencyType: "EUR")
//
//            self.getCoinBaseData(urlLink: self.ETHEUR, currencyType: "EUR")
//            self.getCoinBaseData(urlLink: self.ETHEUR_buy, currencyType: "EUR")
//            self.getCoinBaseData(urlLink: self.ETHEUR_sell, currencyType: "EUR")
//
//            self.getCoinBaseData(urlLink: self.LTCEUR, currencyType: "EUR")
//            self.getCoinBaseData(urlLink: self.LTCEUR_buy, currencyType: "EUR")
//            self.getCoinBaseData(urlLink: self.LTCEUR_sell, currencyType: "EUR")
//
//        }
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
    //  Download JSON data from CoinBase
    func getCoinBaseData(urlLink : String, currencyType : String){
        let request = URLRequest(url: NSURL(string: urlLink)! as URL)
        do {
            // Perform the request
            var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
            let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)
            let jsonDecoder = JSONDecoder()
            if (currencyType == "USD"){
                let jsonData = try jsonDecoder.decode(CoinBase.self, from: data)
                self.object.coinbase.append(jsonData)
            }
            else if (currencyType == "EUR"){
                let jsonData = try jsonDecoder.decode(CoinBase.self, from: data)
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
    
    func BittrexData(){
        object.market = "Bittrex"
//        DispatchQueue.main.async {
//            self.getBittrexData(urlLink: self.Bittrex_BTCUSD)
//            self.getBittrexData(urlLink: self.Bittrex_ETHUSD)
//            self.getBittrexData(urlLink: self.Bittrex_XRPUSD)
//            self.getBittrexData(urlLink: self.Bittrex_BCCUSD)
//            self.getBittrexData(urlLink: self.Bittrex_LTCUSD)
//            self.getBittrexData(urlLink: self.Bittrex_NEOUSD)
//            self.getBittrexData(urlLink: self.Bittrex_ETCUSD)
//            self.getBittrexData(urlLink: self.Bittrex_BTGUSD)
//            self.getBittrexData(urlLink: self.Bittrex_ZECUSD)
//            self.getBittrexData(urlLink: self.Bittrex_OMGUSD)
//            self.getBittrexData(urlLink: self.Bittrex_DASHUSD)
//            self.getBittrexData(urlLink: self.Bittrex_XMRUSD)
//        }
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
    //  Download JSON data from Bittrex
    func getBittrexData(urlLink: String) {
        let request = URLRequest(url: NSURL(string: urlLink)! as URL)
        do{
            var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
            let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)
            let jsonDecoder = JSONDecoder()
            let jsonData = try jsonDecoder.decode(Bittrex.self, from: data)
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
//        let url = URL(string: urlLink)
//        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            do{
//                let jsonDecoder = JSONDecoder()
//                let jsonData = try jsonDecoder.decode(Bittrex.self, from: data!)
//                jsonData.message = self.Bittrex_Currencies[0]
//                self.object.bittrex.append(jsonData)
//                self.Bittrex_Currencies.remove(at: 0)
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//            catch{
//                print(error)
//            }
//        }
//        task.resume()
    }
    
    @IBAction func test(_ sender: Any) {
        objectsArray.removeAll()
        Bittrex_Currencies = copied_Currencies
        CoinbaseData()
        BittrexData()
    }
    
    
    //  Set up Table View to be displayed
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (isShowedUSD && !isShowedEUR) { return coinBase_USD.count}
//        else if (!isShowedUSD && isShowedEUR) { return coinBase_EUR.count}
//        return coinBase_USD.count + coinBase_EUR.count
        var numbOfRow = 1
        if (objectsArray[section].market == "Coin Base") { numbOfRow = objectsArray[section].coinbase.count / 3}
        else if (objectsArray[section].market == "Bittrex") { numbOfRow = objectsArray[section].bittrex.count}
        return numbOfRow
    }
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
        
//        self.tableView.backgroundColor = UIColor(red: 204/255, green: 209/255, blue: 255/255, alpha: 0.1)
//        cell?.backgroundColor = UIColor(red: 204/255, green: 209/255, blue: 255/255, alpha: 0.02)
//        self.view.backgroundColor = UIColor(red: 204/255, green: 209/255, blue: 255/255, alpha: 0.1)
        
        typeLbl.textColor = UIColor.blue
        currentPriceLbl.textColor = UIColor.blue
        bidLbl.textColor = UIColor.blue
        askLbl.textColor = UIColor.blue
        bidPriceLbl.textColor = UIColor.blue
        askPriceLbl.textColor = UIColor.blue
//        typeLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
//        currentPriceLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
//        bidLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
//        askLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
//        bidPriceLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
//        askPriceLbl.textColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
        
//        modifiedButton(button: showAll, mode: "Night")
//        modifiedButton(button: showEUR, mode: "Night")
//        modifiedButton(button: showUSD, mode: "Night")
        if (objectsArray[indexPath.section].market == "Coin Base"){
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
        else if (objectsArray[indexPath.section].market == "Bittrex"){
            typeLbl.text = objectsArray[indexPath.section].bittrex[indexPath.row].message
            currentPriceLbl.text = String(format: "%.3f", objectsArray[indexPath.section].bittrex[indexPath.row].result.Last)
            bidPriceLbl.text = String(format: "%.3f", objectsArray[indexPath.section].bittrex[indexPath.row].result.Bid)
            askPriceLbl.text = String(format: "%.3f", objectsArray[indexPath.section].bittrex[indexPath.row].result.Ask)
        }
//        if (isShowedUSD && coinBase_USD.count != 0 && indexPath.row < coinBase_USD.count){
//            typeLbl.text = coinBase_USD[indexPath.row].data.base + "/" + coinBase_USD[indexPath.row].data.currency
//            currentPriceLbl.text = coinBase_USD[indexPath.row].data.amount
//            bidPriceLbl.text = coinBaseBuy_USD[indexPath.row].data.amount
//            askPriceLbl.text = coinBaseSell_USD[indexPath.row].data.amount
//        }
//        else if (isShowedEUR && coinBase_EUR.count != 0){
//            typeLbl.text = coinBase_EUR[indexPath.row - coinBase_USD.count].data.base + "/" + coinBase_EUR[indexPath.row - coinBase_USD.count].data.currency
//            currentPriceLbl.text = coinBase_EUR[indexPath.row - coinBase_USD.count].data.amount
//            bidPriceLbl.text = coinBaseBuy_EUR[indexPath.row - coinBase_USD.count].data.amount
//            askPriceLbl.text = coinBaseBuy_EUR[indexPath.row - coinBase_USD.count].data.amount
//        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].market
    }
   
    
    //  Design buttons "All", "USD", "EUR" shape, border, color
    func designButtons(){
        modifiedButton(button: showAll, mode: "Day")
        modifiedButton(button: showEUR, mode: "Day")
        modifiedButton(button: showUSD, mode: "Day")
    }
    func modifiedButton(button: UIButton, mode : String){
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

