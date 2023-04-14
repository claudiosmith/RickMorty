//
//  CharacterDetailController.swift
//  RickMorty
//
//  Created by Claudio Smith on 24/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CharacterDetailControllerProtocol: AnyObject {
    func backToCharacterCoordinator()
}

final class CharacterDetailController: BaseController {
    
    var viewModel: CharacterViewModel?
    var viewdata: CharacterViewData?
    lazy var characterView = CharacterDetailView()
    weak var delegate: CharacterDetailControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage(with: viewdata)
        createBackButton(action: #selector(backAction))
        loadDetailView()
    }
    
    private func setImage(with data: CharacterViewData?) {
        
        viewModel?.fetchImage(data) { [weak self] result in
            switch result {
            case .success(let image):
                self?.viewdata?.image = image
            case .failure(let error):
                print("error: ", error.localizedDescription)
            }
        }
    }

    private func loadDetailView() {
        characterView = CharacterDetailView(viewdata: viewdata)
        addDetailView()
    }
    
    @objc func backAction() {
        delegate?.backToCharacterCoordinator()
    }
    
    private func addDetailView() {
        view.addSubview(characterView)
        
        characterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            characterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Numbers.zeroCGFloat)
        ])
    }
    
}
