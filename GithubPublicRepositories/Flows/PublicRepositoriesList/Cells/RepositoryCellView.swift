//
//  RepositoryCellView.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import UIKit

class RepositoryCellView: UITableViewCell {
    
    static let identifier = String(describing: RepositoryCellView.self)
    
    var viewModel: RepositoryCellViewModel! {
        didSet {
            bindViewModel()
        }
    }

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var ownedLoginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindViewModel() {
        idLabel.text = viewModel.id
        ownedLoginLabel.text = viewModel.ownerLogin
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
    }
    
}
