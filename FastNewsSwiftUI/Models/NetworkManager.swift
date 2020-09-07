//
//  NetworkManager.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    let redditNewsProvider = NetworkService<RedditNewsEndPoint>()
    
    func getNews(afterValue: String, completion: @escaping ClosureType<Listing>, failure: @escaping Failure){
        redditNewsProvider.request(.getNews(limitKey: kLimitKey, limitValue: kLimitValue, afterKey: kAfterKey, afterValue: afterValue), model: Listing.self , completion: completion, failure: failure)
    }
    
    func getComments(newsId: String, completion: @escaping ClosureType<[CommentListing]>, failure: @escaping Failure) {
        redditNewsProvider.request(.getComments(newsId: newsId), model: [CommentListing].self, completion: completion, failure: failure)
    }
}
