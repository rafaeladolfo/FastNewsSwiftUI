//
//  HotNews.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct HotNews: Codable, Identifiable {
        
    var id: String?
    var title: String?
    var preview: Preview?
    var url: String?
    var created: Int?
    var ups: Int?
    var downs: Int?
    var score: Int?
    var authorFullname: String?
    var numComments: Int?
    var imageUrl: String?
    var author: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, preview, url, created, ups, downs, score, author
        case authorFullname = "author_fullname"
        case numComments = "num_comments"
    }
}
