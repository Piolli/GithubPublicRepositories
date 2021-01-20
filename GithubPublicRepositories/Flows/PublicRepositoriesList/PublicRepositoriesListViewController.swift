//
//  PublicRepositoriesListViewController.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import UIKit

class PublicRepositoriesListViewController: UIViewController, PublicRepositoriesListView {
    
    let viewModel: PublicRepositoriesListViewModel
    
    init(viewModel: PublicRepositoriesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var output: PublicRepositoriesListViewModelOutput {
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
