//
//  NetworkConstants.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
   case get = "GET"
   case post = "POST"
   case put = "PUT"
   case patch = "PATCH"
   case delete = "DELETE"
}

public enum HTTPTask {
   case request
   case requestParameters(bodyEncoding: ParameterEncoding, parameters: Parameters?)
}

public enum Result<String>{
   case success
   case failure(String)
}

enum NetworkEnvironment {
    case development
    case test
    case production
}

public let kLimitKey = "limit"
public let kLimitValue = 5
public let kAfterKey = "after"
