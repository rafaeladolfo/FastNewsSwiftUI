//
//  CommentView.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    let model: CommentViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(model.author)
                Text(model.createdAt)
            }
            .font(.caption)
            Text(model.body)
                .fixedSize(horizontal: false, vertical: true)
            HStack {
                Spacer()                
                Text(model.ups)
                    .foregroundColor(Color.blue)
                Image(systemName: "arrow.up")
                    .foregroundColor(Color.blue)
                Text(model.downs)
                    .foregroundColor(Color.red)
                Image(systemName: "arrow.down")
                    .foregroundColor(Color.red)
            }
            .font(.caption)
            .padding()
        }
        .padding()
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(model: CommentViewModel(comment: Comment()))
    }
}
