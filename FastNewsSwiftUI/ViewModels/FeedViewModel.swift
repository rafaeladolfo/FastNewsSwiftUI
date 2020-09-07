//
//  FeedViewModel.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

protocol FeedViewProtocol {
    var hotNewsList: [HotNews] { get }
    var isLoading: Bool { get }
    var after: String { get }
    
    func getHotNews()
}

final class FeedViewModel: ObservableObject {
    @Published var hotNewsList: [HotNews]
    @Published var isLoading = false
    var after = ""
    
    static let shared: FeedViewModel = FeedViewModel()
    
    init() {
        hotNewsList = []   
    }
}

extension FeedViewModel {
    
    func getHotNews() {
        NetworkManager.shared.getNews(afterValue: self.after , completion: { (Response) in
            
            self.after = Response.data.after!
            for hotNews in Response.data.children {
                self.hotNewsList.append(hotNews.data)
            }
        }) { (Failure) in
            print(Failure.description)
        }
    }
}
