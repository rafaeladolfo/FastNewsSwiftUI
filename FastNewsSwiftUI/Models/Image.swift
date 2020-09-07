//
//  Image.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct NewsImage: Codable {
    
    //MARK: - Properties
    
    var source: Source?
    
    private enum CodingKeys: String, CodingKey {
        case source
    }
}
