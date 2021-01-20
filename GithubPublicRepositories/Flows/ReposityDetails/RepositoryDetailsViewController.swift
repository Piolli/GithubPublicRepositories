//
//  RepositoryDetailsViewController.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxRelay
import WebKit

class RepositoryDetailsViewController: UIViewController, RepositoryDetailsView, WKNavigationDelegate {
    
    private let viewModel: RepositoryDetailsViewModel
    
    private let disposeBag = DisposeBag()
    private let loadRepositoriesInput = PublishRelay<Void>()
    
    var output: RepositoryDetailsViewModelOutput {
        return viewModel
    }

    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    init(viewModel: RepositoryDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.didDisappear?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        webView.load(URLRequest(url: viewModel.url))
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonClicked(sender:)))
        navigationItem.rightBarButtonItem = refresh
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        navigationItem.title = webView.title
    }
    
    @objc func shareButtonClicked(sender: AnyObject){
        let message = "Share web site"
        if let link = NSURL(string: viewModel.url.path) {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}
