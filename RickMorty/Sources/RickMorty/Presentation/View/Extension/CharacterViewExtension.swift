//
//  CharacterViewExtension.swift
//  RickMorty
//
//  Created by Claudio Smith on 23/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension CharacterView {

    func bindingCharacter() {
        
        viewModel.observerCharacterList.observeOn(MainScheduler.instance)
            .subscribe (onNext: { [weak self] characters in
                self?.character = characters
        }).disposed(by: disposeBag)
        
        viewModel.observerCharacter.observeOn(MainScheduler.instance).asObservable()
            .bind(to: self.collectionView.rx.items(cellIdentifier: CharacterCell().getClassId(),
                                                        cellType: CharacterCell.self)) {
                                                        [weak self] index, model, cell in
            cell.viewModel = self?.viewModel
            cell.character = model
        }.disposed(by: disposeBag)
    }
    
    func selectedItem() {
        collectionView.rx.modelSelected(CharacterViewData.self).subscribe(onNext: { [weak self] (model) in
                guard let self = self else { return }
                self.delegate.navigateToCharacterDetails(self.viewModel, viewdata: model)
            }).disposed(by: disposeBag)
    }
}

extension CharacterView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width / Numbers.half) * CharacterVal.reduceWidth
        let height = width

        return  CGSize(width: width , height: height )
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
    
        if offsetY > contentHeight - scrollView.frame.size.height {
            self.viewModel.loadInfinityScroll()
            
        }
    }
}
