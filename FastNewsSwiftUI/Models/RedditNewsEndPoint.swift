//
//  RedditNewsEndPoint.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

//MARK: API paths alias
enum RedditNewsEndPoint {
    case getNews(limitKey: String, limitValue: Int, afterKey: String, afterValue: String)
    case getComments(newsId: String)
}

//MARK: API endpoints paths
enum RedditNewsEndPointPath {
    static let getNews = "r/ios/hot/.json"
    static let getComments = "r/ios/comments/@.json"
}

extension RedditNewsEndPoint : EndPointType {
    var apiPort: String {
        switch AppNetworkEnvironment {
        case .development:
            return "4522"
        case .test:
            return "4522"
        case .production:
            return "443"
        }
    }
    
    var apiDefaultPath: String {
        return ""
    }
    
    var apiVersion: String? {
        return nil
    }
    
    var task: HTTPTask {
        switch self {
        case .getNews(limitKey: let limitKey, limitValue: let limitValue, afterKey: let afterKey, afterValue: let afterValue):
            let urlParameters: [String: Any] = [
                limitKey: limitValue,
                afterKey: afterValue
            ]
            return .requestParameters(bodyEncoding: .urlEncoding, parameters: urlParameters)
        case .getComments:
            return .requestParameters(bodyEncoding: .urlEncoding, parameters: nil)
        }
    }
    
    var environmentUrl: String {
        return NetworkUtils().getApiUrl(port: apiPort, defaultPath: apiDefaultPath, apiVersion: apiVersion, for: AppNetworkEnvironment)
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getNews:
            return RedditNewsEndPointPath.getNews
        case .getComments(let newsId):
            return RedditNewsEndPointPath.getComments.replacingOccurrences(of: "@", with: newsId)
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getNews:
            return .get
        case .getComments:
            return .get
        }
    }
}
