//
//  NetworkTests.swift
//  GitHubDemoTests
//
//  Created by admin on 2/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import XCTest
@testable import GitHubDemo

class NetworkTests: XCTestCase {

	func testDidAPIWorkerWasCalled() {
		let worker = APIWorkerMock()
		worker.searchRepositories(q: "q", count: 3) { (_, _) in }
		XCTAssert(worker.isGetWasCalled)
	}
	func testSortType() {
		let sort = SearchRepositoriesSort.stars
		let viewModel = SearchViewModelMock()
		viewModel.sort = sort
		viewModel.getSearchResult { (_) in }
		XCTAssertEqual(sort, viewModel.api.sortParam)
	}
	func testOrderType() {
		let order = SearchOrder.desc
		let viewModel = SearchViewModelMock()
		viewModel.order = order
		viewModel.getSearchResult { (_) in }
		XCTAssertEqual(order, viewModel.api.orderParam)
	}
	func testMaxCountType() {
		let count = 30
		let viewModel = SearchViewModelMock()
		viewModel.maxSearchResultCount = count
		viewModel.getSearchResult { (_) in }
		XCTAssertEqual(count, viewModel.api.maxCount)
	}
}
