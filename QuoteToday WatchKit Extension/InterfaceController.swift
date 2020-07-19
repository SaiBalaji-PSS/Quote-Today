//
//  InterfaceController.swift
//  QuoteToday WatchKit Extension
//
//  Created by Sai Balaji on 19/07/20.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    var quotes = Welcome()
    
    @IBOutlet weak var quotelbl: WKInterfaceLabel!
    
    @IBOutlet weak var quoteauthorlbl: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        
      
        
    }
    
    override func willActivate() {
        
      
        
        
        NetworkService.sharedobj.getQuotes { (w) in
            self.quotes = w
            
            if let randomquote = self.quotes.randomElement()
            {
                self.quotelbl.setText("\(randomquote.text)")
                self.quoteauthorlbl.setText("By \(randomquote.author!)")
            }
            
        }
        
    }
    
    override func didDeactivate() {
       
    }

}
