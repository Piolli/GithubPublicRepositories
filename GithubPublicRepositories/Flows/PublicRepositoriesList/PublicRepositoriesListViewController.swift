//
//  PublicRepositoriesListViewController.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxRelay

class PublicRepositoriesListViewController: UIViewController, PublicRepositoriesListView {
    
    private let viewModel: PublicRepositoriesListViewModel
    
    private let tableView = UITableView()
    private let disposeBag = DisposeBag()
    private let loadRepositoriesInput = PublishRelay<Void>()
    private let refreshControl = UIRefreshControl()
    //move to viewModel
    private var isLoadingData = false
    
    var output: PublicRepositoriesListViewModelOutput {
        return viewModel
    }
    
    var input: PublicRepositoriesListViewModel.Input {
        return .init(loadRepositories: loadRepositoriesInput.asObservable())
    }
    
    init(viewModel: PublicRepositoriesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setUpTableView()
        setUpPullToRefresh()
    }
    
    func bindViewModel() {
        let output = viewModel.transform(input: input)
        disposeBag.insert([
            output.cells.asObservable()
                .bind(to: tableView.rx.items(cellIdentifier: RepositoryCellView.identifier, cellType: RepositoryCellView.self)) { (row, element, cell) in
                cell.viewModel = element
            },
            output.didLoad.asObservable().subscribe(onNext: { [weak self] _ in
                self?.refreshControl.endRefreshing()
                self?.isLoadingData = false
            })
        ])
        
        loadRepositoriesInput.accept(())
    }
    
    func setUpTableView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        view.addSubview(tableView)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.refreshControl = refreshControl
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "RepositoryCellView", bundle: nil), forCellReuseIdentifier: RepositoryCellView.identifier)
    }
    
    func setUpPullToRefresh() {
        refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: loadRepositoriesInput)
            .disposed(by: disposeBag)
    }
    
}
extension PublicRepositoriesListViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (!isLoadingData) {
            if scrollView.contentOffset.y / scrollView.contentSize.height > 0.8 {
                isLoadingData = true
                self.loadRepositoriesInput.accept(())
            }
        }
    }
}
