//
//  Storage.swift
//  GitHubDemo
//
//  Created by admin on 2/27/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import MagicalRecord

class GitStorage: StorageProtocol {
	
	func importInContext(data: [[AnyHashable : Any]]) {
		
		MagicalRecord.save({ (context) in
			GitRepo.mr_truncateAll(in: context)
			GitRepo.mr_import(from: data, in: context)
		})
	}
}
