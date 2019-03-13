//
//  APIResponse.swift
//  GitHubDemo
//
//  Created by admin on 2/19/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

enum ResponseError: Error {
	case invalidParameters
	case cannotParseJson
}

protocol APIResponse {
	var json: [String:Any] { get }
	var parameters: [String:String] { get }
	
	func response()throws -> [[AnyHashable:Any]]
}
