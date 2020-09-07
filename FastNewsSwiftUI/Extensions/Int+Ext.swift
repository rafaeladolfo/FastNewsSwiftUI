//
//  Int+Ext.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 07/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

extension Int {
    
    //MARK: - Date Formatter
    
    var createdAt: String {
        
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        return date.elapsedInterval
    }
    
    var toString: String {
        return "\(self)"
    }
}
