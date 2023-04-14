//
//  CharacterCell.swift
//  RickMorty
//
//  Created by Claudio Smith on 18/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

final class CharacterCell: BaseCollectionViewCell {

    lazy var rickyImage: UIImageView = UIImageView()
    lazy var favButton: UIButton = UIButton()
    
    var viewModel: CharacterViewModel?
    var character: CharacterViewData? {
        didSet {
            bindData(data: character)
        }
    }
    
    override func prepareForReuse() {
        rickyImage.image = nil
    }
    
    override func bindData<T>(data: T) {
        guard let data = data as? CharacterViewData else { return }
        
        setupFavButton(with: data)
        setImage(with: data)
    }
    
    @objc func favAction() {
        viewModel?.updateFavourite(viewdata: character)
    }
    
    private func setupFavButton(with data: CharacterViewData) {
        favButton.setTitle(data.favButtonTitle, for: .normal)
        favButton.titleLabel?.font = UIFont.systemFont(ofSize: CharacterVal.favoriteSize)
        favButton.addTarget(self, action: #selector(favAction), for: .touchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.errorMessageCorrupted)
    }
}

extension CharacterCell {
    
    private func setImage(with data: CharacterViewData) {
        
        viewModel?.fetchImage(data) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.rickyImage.image = image
                }
            case .failure(let error):
                print("error: ", error.localizedDescription)
            }
        }
    }
    
}
