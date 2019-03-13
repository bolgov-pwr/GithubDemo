//
//  MockAPIClient.swift
//  GitHubDemo
//
//  Created by admin on 2/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import RxSwift

class MockAPIClient: APIClientProtocol {
	
	var result: GitRepo?
	
	func send(apiRequest: APIRequest, completion: @escaping ([[AnyHashable : Any]]) -> Void) {
		
	}
}
