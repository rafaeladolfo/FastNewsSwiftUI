//
//  Comment.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct Comment: Codable {
    var created: Int?
    var ups: Int?
    var downs: Int?
    var body: String?
    var authorFullname: String?
    
    private enum CodingKeys: String, CodingKey {
        case created, ups, downs, body
        case authorFullname = "author_fullname"
    }
    
    //MARK: - Public Methods
    func isEmpty() -> Bool {
        guard let _ = created, let _ = ups, let _ = downs, let _ = body, let _ = authorFullname else {
            return true
        }
        
        return false
    }
}
