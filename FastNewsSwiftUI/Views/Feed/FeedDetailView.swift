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
    
    var body: some View {
        VStack {
            FeedContentView(model: hotNewsViewModel)
            List {
                CommentView()
            }
        }
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailView(hotNewsViewModel: HotNewsViewModel(hotNews: HotNews()))
    }
}
