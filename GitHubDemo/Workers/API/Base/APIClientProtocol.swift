//
//  APIWorker_mock.swift
//  GitHubDemo
//
//  Created by admin on 2/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import RxSwift

protocol APIClientProtocol : class {
	func send(apiRequest: APIRequest, completion: @escaping ([[AnyHashable:Any]])->Void)
}
