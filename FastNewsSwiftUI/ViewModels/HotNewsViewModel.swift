//
//  HotNewsViewModel.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 07/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation
import UIKit

struct HotNewsViewModel: Identifiable {
    
    //MARK: - Properties
    
    var uid = UUID()
    var id: String
    var author: String
    var createdAt: String
    var title: String
    var comments: String
    var score: String
    var url: String
    var image: UIImage
    var ups: String
    var downs: String
    
    init(hotNews: HotNews) {
        id = hotNews.id ?? ""
        author = hotNews.author ?? ""
        createdAt = hotNews.created?.createdAt ?? ""
        title = hotNews.title ?? ""
        comments = hotNews.numComments?.toString ?? ""
        score = hotNews.score?.toString ?? ""
        url = hotNews.url ?? ""
        ups = hotNews.ups?.toString ?? ""
        downs = hotNews.downs?.toString ?? ""
        image = UIImage()
        
        // preview url
        let previewUrl = hotNews.preview?.images?.first?.source?.url?.htmlDecoded ?? ""
        guard let url = URL(string: previewUrl) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        image = UIImage(data: data) ?? UIImage()
    }
}
