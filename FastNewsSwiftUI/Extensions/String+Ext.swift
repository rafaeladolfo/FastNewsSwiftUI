//
//  String+Ext.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 07/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

extension String {
    var htmlDecoded: String {
        let decoded = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil).string
        
        return decoded ?? self
    }
}
