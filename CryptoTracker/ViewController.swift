//
//  ViewController.swift
//  CryptoTracker
//
//  Created by Lukas Michaels on 12/6/17.
//  Copyright © 2017 Lukas Michaels. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///
        priceLabel.text = "..."

        Alamofire.request("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC&tsyms=USD").responseJSON { response in
            print(response)
    
            if let bitcoinJSON = response.result.value {
                let bitcoinObject:Dictionary = bitcoinJSON as! Dictionary<String, Any>
                
                // Parse through information
                let rawObject:Dictionary = bitcoinObject["RAW"] as! Dictionary<String, Any>
                let usdObject:Dictionary = rawObject["BTC"] as! Dictionary<String, Any>
                let rateObject:Dictionary = usdObject["USD"] as! Dictionary<String, Any>
                
                // Current price
                let rate:Float = rateObject["PRICE"] as! Float
                
                
                // Changing UI
                self.priceLabel.text = "S\(rate)"
            }
            
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

