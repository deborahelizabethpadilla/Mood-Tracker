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
    
    var moods = [String]()
    
    override func handleAction(withIdentifier identifier: String?, forRemoteNotification remoteNotification: [AnyHashable : Any]) {
        
        if let notificationIdentifier = identifier {
            
            print(notificationIdentifier)
        }
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let stringDate = dateFormatter.string(from: NSDate() as Date)
        
        print(stringDate)
        
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
