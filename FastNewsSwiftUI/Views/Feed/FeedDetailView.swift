//
//  FeedDetailView.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import SwiftUI

struct FeedDetailView: View {
    let hotNewsViewModel: HotNewsViewModel
    @ObservedObject var feedDetailViewModel = FeedDetailViewModel.shared
    
    var body: some View {
        VStack {
            FeedContentView(model: hotNewsViewModel)
                List {
                    ForEach(feedDetailViewModel.commentsList) { comment in
                        CommentView(model: comment)
                }
            }
        }
        .onAppear(){
             self.feedDetailViewModel.getComments(newsId: self.hotNewsViewModel.id)
        }
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailView(hotNewsViewModel: HotNewsViewModel(hotNews: HotNews()))
    }
}
