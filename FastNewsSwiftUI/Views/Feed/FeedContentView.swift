//
//  FeedContentView.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import SwiftUI

struct FeedContentView: View {
    var model: HotNewsViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(model.author)
                Text(model.createdAt)
            }
            .padding(.leading, 15)
            VStack {
                HStack {
                    Spacer()
                    Image(uiImage: model.image)                        
                        .frame(width: 320, height: 200, alignment: .center)
                        .background(Color.gray)
                        .clipped()
                    Spacer()
                }
                Text(model.title)
                    .fixedSize(horizontal: false, vertical: true)
            }
            HStack(alignment: .center, spacing: 20 ){
                Spacer()
                Button(action: share){
                    Image(systemName: "square.and.arrow.up.fill")
                }
                Image(systemName: "captions.bubble")
                Text(model.comments)
                Image(systemName: "arrow.up")
                Text(model.ups)
                Image(systemName: "arrow.down")
                Text(model.downs)
            }
            .padding()
        }
    }
    
    func share() {
        let url = URL(string: model.url)
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
    }
}

struct FeedContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedContentView(model: HotNewsViewModel(hotNews: HotNews()))
    }
}
