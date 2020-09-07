//
//  FeedContentView.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import SwiftUI
import URLImage

struct FeedContentView: View {
    var model: HotNewsViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(model.author)
                Text(model.createdAt)
            }
            VStack {                
                Image(uiImage: model.image)
                    .frame(width: 320, height: 200, alignment: .center)
                    .background(Color.red)
                    .clipped()
                
                Text(model.title)
                    .fixedSize(horizontal: false, vertical: true)
            }
            HStack(alignment: .center, spacing: 20 ){
                Image(systemName: "square.and.arrow.up.fill")
                Image(systemName: "captions.bubble")
                Text(model.comments)
                Image(systemName: "arrow.up")
                Text(model.ups)
                Image(systemName: "arrow.down")
                Text(model.downs)
            }
        }
    }
}

struct FeedContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedContentView(model: HotNewsViewModel(hotNews: HotNews()))
    }
}
