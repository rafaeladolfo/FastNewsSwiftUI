//
//  CommentViewModel.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 07/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct CommentViewModel: Identifiable {
    
    //MARK: - Properties
    
    var id = UUID()
    var author: String
    var createdAt: String
    var body: String
    var ups: String
    var downs: String
    
    init(comment: Comment) {        
        author = comment.author ?? ""
        createdAt = comment.created?.createdAt ?? ""
        body = comment.body ?? ""
        ups = comment.ups?.toString ?? ""
        downs = comment.downs?.toString ?? ""
    }
}
