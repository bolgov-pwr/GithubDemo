//
//  StorageProtocol.swift
//  GitHubDemo
//
//  Created by admin on 2/28/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import MagicalRecord

protocol StorageProtocol {
	
	func importInContext(data: [[AnyHashable:Any]])
	func fetch<T: NSManagedObject>() -> NSFetchRequest<T>
}

extension StorageProtocol {
	
	func fetch<T>() -> NSFetchRequest<T> where T : NSManagedObject {
		
		let request = T.fetchRequest() as! NSFetchRequest<T>
		request.sortDescriptors = [NSSortDescriptor(key: "stars", ascending: false)]
		return request
	}
}
