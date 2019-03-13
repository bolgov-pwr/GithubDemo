//
//  ViewController.swift
//  GitHubDemo
//
//  Created by admin on 2/7/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData
import RxCocoa
import RxSwift

class SearchViewController: UIViewController {

	let viewModel = SearchViewModel()
	private let disposeBag = DisposeBag()
	
	private let searchController: UISearchController = {
		let searchController = UISearchController(searchResultsController: nil)
		searchController.searchBar.placeholder = "Search for repositories"
		return searchController
	}()

	@IBOutlet weak var tableView: UITableView!

	static func storyboardInstance() -> SearchViewController? {
		let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
		return storyboard.instantiateInitialViewController() as? SearchViewController
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setup()
	}

	private func setup() {
		setupSearchBar()
		configureReactiveBinding()
	}

	private func setupSearchBar() {
searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "search..."
		definesPresentationContext = true
		navigationItem.searchController = searchController
		navigationItem.title = "git finder"
		navigationItem.hidesSearchBarWhenScrolling = false
	}
	
	private func configureReactiveBinding() {
		NSManagedObjectContext.mr_default().rx
			.entities(fetchRequest: self.viewModel.fetchRequest)
			.bind(to: self.tableView.rx
			.items(cellIdentifier: SearchTableViewCell.id, cellType: SearchTableViewCell.self)) { (row, repo, cell) in
				cell.setup(with: repo)
			}
			.disposed(by: disposeBag)
		
		searchController.searchBar.rx.text.orEmpty.asObservable()
			.debounce(1, scheduler: MainScheduler.instance)
			.filter { !$0.isEmpty}
			.map {
				print("send")
				self.viewModel.subscribeToRepos(with: $0) }
			.subscribe(onNext: nil, onError: nil, onCompleted: nil)
			.disposed(by: disposeBag)
	}
}
