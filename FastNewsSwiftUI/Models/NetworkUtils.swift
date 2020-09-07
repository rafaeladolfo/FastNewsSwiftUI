//
//  NetworkUtils.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

protocol NetworkUtilsProtocol {
    func setApiNetwork()
    func getApiUrl(port: String, defaultPath: String, apiVersion: String?, for networkEnvironment: NetworkEnvironment) -> String
}

final class NetworkUtils {
    init() {
        setApiNetwork()
    }
}

extension NetworkUtils : NetworkUtilsProtocol {
    
    func setApiNetwork(){
        ProductionApiUrl = "https://www.reddit.com:"
        TestApiUrl = "https://www.reddit.com:"
        DevelopmentApiUrl = "https://www.reddit.com:"
    }
    
    /**
     Build the API url for target endpoint.
     
     - Parameter port: The api port
     - Parameter defaultPath: The api base url
     - Parameter apiVersion: The api version(optional)
     - Parameter networkEnvironment: The target NetworkEnvironment(internal enum)
     - Returns: A string that represents the full api url for the endpoint
     */
    func getApiUrl(port: String, defaultPath: String, apiVersion: String?, for networkEnvironment: NetworkEnvironment) -> String {
        var version = ""
        
        if apiVersion != nil {
            version = apiVersion! + "/"
        }
        
        switch networkEnvironment {
        case .production:
            return ProductionApiUrl + port + "/" + version
        case .test:
            return TestApiUrl + port + "/" + defaultPath + "/" +  version
        case .development:
            return DevelopmentApiUrl + port + "/" + defaultPath + "/" +  version
        }
    }
}
