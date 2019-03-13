//
//  SearchViewModel.swift
//  GitHubDemo
//
//  Created by admin on 2/7/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import CoreData
import RxCocoa
import RxSwift

class SearchViewModel {

	private var service: APIClientProtocol
	private var storage: StorageProtocol
	
	var fetchRequest: NSFetchRequest<GitRepo> {
		return self.storage.fetch()
	}
	
	init(service: APIClientProtocol = GitAPIClient(), storage: StorageProtocol = GitStorage()) {
		self.service = service
		self.storage = storage
	}
	
	func subscribeToRepos(with text: String) {
		
		let request = GitSearchReposRequest.init(question: text, count: 30)
		service.send(apiRequest: request) { results in
			self.storage.importInContext(data: results)
		}
	}
}
