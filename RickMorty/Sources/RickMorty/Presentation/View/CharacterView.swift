//
//  CharacterView.swift
//  RickMorty
//
//  Created by Claudio Smith on 16/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterView: UIView {

    var viewModel: CharacterViewModel!
    var segmentedControl: SegmentedControl!
    var widthConstraint: NSLayoutConstraint!
    var leftConstraint: NSLayoutConstraint!
    var collectionView: UICollectionView!
    
    lazy var lineview = UIView()
    weak var delegate: CharacterControllerProtocol!
    lazy var character = [CharacterViewData]()
    lazy var indicatorView = UIActivityIndicatorView()
   
    let disposeBag = DisposeBag()
    
    convenience init(delegate: CharacterControllerProtocol, viewModel: CharacterViewModel) {
        self.init()
        self.viewModel = viewModel
        self.delegate = delegate
        initSubView()
    }
    
    private func initSubView() {
        let bounds = UIScreen.main.bounds
        self.bounds = bounds
        self.frame = bounds
        self.backgroundColor = .black
       
        guard viewModel != nil else { return }

        setupLineView()
        setupSegmentedControl()
        setupCollection()
        setLayoutDelegate()
        setupUI()
        bindingCharacterView()
    }
    
    private func setupSegmentedControl() {
        self.segmentedControl = SegmentedControl(items: [CharacterVal.firstSegment,
                                                         CharacterVal.secondSegment])
        segmentedControl.setup(viewModel: viewModel)
    }
    
    private func setupLineView() {
        self.lineview.backgroundColor = .white
    }

    func setupCollection() {
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: collectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.register(CharacterCell.self)
        
        collectionView.backgroundColor = .black
    }
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Numbers.zeroCGFloat
        layout.minimumInteritemSpacing = Numbers.oneCGFloat
        
        return layout
    }
    
    private func bindingCharacterView() {
        bindingCharacter()
        selectedItem()
        bindingLine()
    }
    
    private func bindingLine() {
        viewModel.observerLine.observeOn(MainScheduler.instance)
            .subscribe (onNext: { [weak self] segment in
                guard let segment = segment else { return }
                self?.animate(with: segment)
        }).disposed(by: disposeBag)
    }
    
    private func animate(with segment: SegmentedChar?) {
        let x = UIScreen.main.bounds.width / Numbers.half + CharacterVal.lineExtraLeading
        leftConstraint.constant = segment == .favorites ? x : CharacterVal.lineLeading
        
        UIView.animate(withDuration: CharacterVal.duration) {
            self.layoutIfNeeded()
        }
    }
    
    func setLayoutDelegate() {
        collectionView.delegate = self
        collectionView.rx.delegate.setForwardToDelegate(self, retainDelegate: false)
    }
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubView()
    }
}
