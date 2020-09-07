//
//  NetworkRoutable.swift
//  FastNewsSwiftUI
//
//  Created by Rafael Adolfo on 06/09/20.
//  Copyright © 2020 Rafael Adolfo. All rights reserved.
//

import Foundation

typealias NetworkServiceCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRoutable {
    associatedtype EndPoint: EndPointType
    func request(_ target: EndPoint, completion: @escaping NetworkServiceCompletion)
    func cancel()
}
