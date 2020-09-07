//
//  FeedDetailViewModel.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

final class FeedDetailViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var commentsList: [CommentViewModel]
    
    //MARK: - Singleton
    
    static let shared: FeedDetailViewModel = FeedDetailViewModel()
    
    init() {
        commentsList = []
    }
}

extension FeedDetailViewModel {
    
    //MARK: - Public Implementations
    
    func getComments(newsId: String) {
        self.commentsList.removeAll()
        NetworkManager.shared.getComments(newsId: newsId, completion: { (Response) in
            
            for res in Response {
                for commentData in res.data.children {
                    if !commentData.data.isEmpty() {
                        let commentViewModel = CommentViewModel(comment: commentData.data)
                        self.commentsList.append(commentViewModel)
                    }
                }
            }
                            
        }) { (Failure) in
            print(Failure.description)
        }
    }
}
