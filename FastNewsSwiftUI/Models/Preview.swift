//
//  Preview.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct Preview: Codable {
    
    //MARK: - Properties
    
    var images: [NewsImage]?
    
    private enum CodingKeys: String, CodingKey {
        case images
    }
}
