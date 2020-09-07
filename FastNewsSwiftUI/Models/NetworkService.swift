//
//  NetworkService.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()
typealias ClosureType<T> = (_ result: T) -> ()
typealias Failure = ((_ error: String) -> ())

final class NetworkService<EndPoint: EndPointType>: NetworkRoutable {
    private var task: URLSessionTask?
    
    
    
    func request(_ target: EndPoint, completion: @escaping NetworkServiceCompletion) {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        let session = URLSession(configuration: configuration)
        
        do {
            let request = try self.buildRequest(from: target)
            print("Request URL: \(request.url?.absoluteString ?? "")")
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        }catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
    fileprivate func buildRequest(from target: EndPoint) throws -> URLRequest {
        
        var request = URLRequest(url: target.baseURL.appendingPathComponent(target.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 20.0)
        
        request.httpMethod = target.httpMethod.rawValue
        
        do {
            switch target.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
            case .requestParameters(let bodyEncoding, let parameters):                
                try self.configureParameters(bodyEncoding: bodyEncoding, parameters: parameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyEncoding: ParameterEncoding,
                                         parameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    parameters: parameters)
        } catch {
            throw error
        }
    }
}

extension NetworkService {
    func request<T: Decodable>(_ target: EndPoint,
                               model: T.Type,
                               path: String? = nil,
                               completion: @escaping ClosureType<T>,
                               failure: @escaping Failure){
        
        return request(target, completion: { data,response,error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    let result = self.handleNetworkResponse(response)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            failure(NetworkResponse.noData.rawValue)
                            return
                        }
                        do {
                           let apiResponse = try JSONDecoder().decode(model.self, from: responseData)
                           completion(apiResponse)
                        } catch {
                            failure(NetworkResponse.unableToDecode.rawValue)
                        }
                    case .failure(let networkFailureError):
                        failure(networkFailureError)
                    }
                } else {
                    failure(NetworkResponse.noData.rawValue)
                }
            }
        })
    }
}

