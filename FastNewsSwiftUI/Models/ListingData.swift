//
//  ListingData.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct ListingData: Codable {
    let children: [HotNewsData]
    let after: String?
    let before: String?
}
