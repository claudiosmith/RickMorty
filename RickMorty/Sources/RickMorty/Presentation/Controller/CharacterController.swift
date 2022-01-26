//
//  CharacterController.swift
//  RickMorty
//
//  Created by Claudio Smith on 16/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterController: BaseController {
    
    var delegate: CharacterControllerProtocol?
    lazy var viewModel = CharacterViewModel()
    lazy var characterView = CharacterView()
    lazy var indicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.create()
        indicatorView.start()
        loadCharacterView()
    }

    private func loadCharacterView() {
        characterView = CharacterView(delegate: delegate, viewModel: viewModel)
        addCharacterView()
        bindingError()
    }
    
    private func addCharacterView() {
        view.addSubview(characterView)
        
        characterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            characterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Numbers.zeroCGFloat)
        ])
    }
    
    func bindingError() {
        
        viewModel.onError = { [weak self] (error) in
            guard let self = self, let error = error,
            let failureDescription = error.failureDescription else { return }
            print("network error: ", failureDescription)
            
            DispatchQueue.main.async {
                self.indicatorView.stop()
                self.alert(message: failureDescription, title: Bundle.main.appName, completion: {_ in })
            }
        }
    }
    
}
