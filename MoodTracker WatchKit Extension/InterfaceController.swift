//
//  InterfaceController.swift
//  MoodTracker WatchKit Extension
//
//  Created by Deborah on 2/18/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var table: WKInterfaceTable!
    
    var moods = [String]()
    
    var tableCreated = false
    
    func refreshTable() {
        
        if tableCreated == false {
            
            var reversedMoods = moods.reversed()
        
        table.setNumberOfRows(reversedMoods.count, withRowType: "tableRowController")
        
        for (index, mood) in moods.enumerated(moods) {
            
            let row = table.rowController(at: index) as! tableRowController
            
            row.tableRowLabel.setText(mood)
        }
            
            tableCreated = true
        }
        
    }
    
    override func handleAction(withIdentifier identifier: String?, forRemoteNotification remoteNotification: [AnyHashable : Any]) {
        
        if let notificationIdentifier = identifier {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            let stringDate = dateFormatter.string(from: NSDate() as Date)
            
            var mood = stringDate + " - " + notificationIdentifier
            
            if UserDefaults.standard.object(forKey: "moods") != nil {
                
                moods = UserDefaults.standard.object(forKey: "moods") as! [String]
                
            }
            
            moods.append(mood)
            
            UserDefaults.standard.set(moods, forKey: "moods")
            
            print(moods)
            
            refreshTable()
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if UserDefaults.standard.object(forKey: "moods") != nil {
            
            moods = UserDefaults.standard.object(forKey: "moods") as! [String]
            
        } else {
            
            moods.append("No Moods Saved")
        }
        
        refreshTable()
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
