//
//  EndPointType.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

protocol EndPointType {
    var apiPort: String { get }
    var apiDefaultPath: String { get }
    var apiVersion: String? { get }
    var environmentUrl: String { get }
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}
