//
//  FeedView.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    NavigationLink(destination: FeedDetailView()) {
                        Spacer()
                        FeedContentView()
                        Spacer()
                    }
                    
                }
            }
            .navigationBarTitle("Fast News")
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
