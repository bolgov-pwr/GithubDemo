//
//  APIClient.swift
//  GitHubDemo
//
//  Created by admin on 2/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class GitAPIClient: APIClientProtocol {	
	
	private let baseURL = URL(string: "https://api.github.com/")!
	
	func send(apiRequest: APIRequest, completion: @escaping ([[AnyHashable : Any]])->Void) {
		
		let request = apiRequest.request(with: baseURL)
		let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
			do {
				let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
				let response = GitSearchReposResponse(json: json, limit: apiRequest.parameters["limit"]!)
				
				do {
					let hashable = try response.response()
					completion(hashable)
				} catch let error {
					print(error.localizedDescription)
				}
				
			} catch let error {
				print(error.localizedDescription)
			}
		}
		task.resume()
	}
}
