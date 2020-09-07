//
//  CommentView.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Author")
                Text("10 hours")
            }
            .font(.caption)
            Text("A very positive and full of words comment for that good news.")
                .fixedSize(horizontal: false, vertical: true)
            HStack {
                Spacer()                
//                Text("999+").foregroundColor(Color.blue)
                //                Image(systemName: "arrow.up")
                //                Text("999+").foregroundColor(Color.red)
                //                Image(source: arrowDown)
            }
            .font(.caption)
            .padding()
        }
        .padding()
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
