//
//  GitSearchReposResponse.swift
//  GitHubDemo
//
//  Created by admin on 2/19/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class GitSearchReposResponse: APIResponse {
	
	var parameters = [String: String]()
	var json: [String : Any]
	
	init(json: [String:Any], limit: String) {
		self.json = json
		parameters["limit"] = limit
	}
	
	func response() throws -> [[AnyHashable : Any]] {
		
		guard let strLimit = parameters["limit"] else {
			throw ResponseError.invalidParameters
		}
		guard let limit = Int(strLimit) else {
			throw ResponseError.invalidParameters
		}
		
		guard let items = json["items"] as? [[AnyHashable:Any]] else { return [[AnyHashable:Any]]() }
		
		var result = [[AnyHashable:Any]]()
		
		for (index,item) in items.enumerated() {
			if index > limit { break }
			result.append(item)
		}
		
		return result
	}
}
