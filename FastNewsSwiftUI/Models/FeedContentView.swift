//
//  FeedContentView.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import SwiftUI

struct FeedContentView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Author")
                Text("1 Hour")
            }
            Image("test").frame(width: 320, height: 200, alignment: .center).background(Color.red)
            Text("Preview of the hot news described here.")
                .fixedSize(horizontal: false, vertical: true)
            HStack(alignment: .center, spacing: 20 ){
                Image(systemName: "square.and.arrow.up.fill")
                Image(systemName: "captions.bubble")
                Text("4")
                Image(systemName: "arrow.up")
                Text("20")
                Image(systemName: "arrow.down")
                Text("1")
            }
        }
    }
}

struct FeedContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedContentView()
    }
}
