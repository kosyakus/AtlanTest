//
//  Router.swift
//  AtlanTeamTestTask
//
//  Created by Admin on 06.10.17.
//  Copyright © 2017 NS. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    private var besePath: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    case getResource(category: String)
    
    private var method: HTTPMethod {
        switch self {
        case .getResource:
            return .get
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case let .getResource(category):
            return ["category": category]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try besePath.asURL()
        let urlRequest = URLRequest(url: url)
        
        return try URLEncoding.default.encode(urlRequest, with: parameters)
        
    }
}
