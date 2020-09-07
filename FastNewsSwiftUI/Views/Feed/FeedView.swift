//
//  FeedView.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.hotNewsList) { news in
                    HStack {
                        NavigationLink(destination: FeedDetailView(hotNewsViewModel: news)) {
                            Spacer()
                            
                            FeedContentView(model: news)
                            Spacer()
                        }
                    }
                }
            }
            .navigationBarTitle("Fast News")
        }
        .onAppear(){
            self.viewModel.getHotNews()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
