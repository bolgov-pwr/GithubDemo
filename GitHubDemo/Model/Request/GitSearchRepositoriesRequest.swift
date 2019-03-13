//
//  GitSearchRepositoriesRequest.swift
//  GitHubDemo
//
//  Created by admin on 2/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class GitSearchReposRequest: APIRequest {
	
	enum SearchOrder: String {
		case asc
		case desc
	}
	
	enum SearchRepositoriesSort: String {
		case stars
		case forks
		case updated
	}
	
	var method = RequestType.GET
	var path = "search/repositories"
	var parameters = [String: String]()
	
	init(question: String, order: SearchOrder = .desc, sort: SearchRepositoriesSort = .stars, count: Int) {
		parameters["q"] = question
		parameters["order"] = order.rawValue
		parameters["sort"] = sort.rawValue
		parameters["limit"] = String(count)
	}
}
