//
//  Source.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct Source: Codable {
    var url: String?
    
    private enum CodingKeys: String, CodingKey {
        case url
    }
}
