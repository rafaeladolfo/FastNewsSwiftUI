//
//  CommentListingData.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 07/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct CommentListingData: Codable {
    
    //MARK: - Properties
    
    let children: [CommentData]
    let after: String?
    let before: String?
}
