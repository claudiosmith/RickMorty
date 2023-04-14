//
//  SegmentedControl.swift
//  RickMorty
//
//  Created by Claudio Smith on 23/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

typealias Segmented = (UISegmentedControl) -> Void

enum SegmentedChar: Int {
    case all, favorites
}

final class SegmentedControl: BaseSegmentedControl {
    var viewModel: CharacterViewModel?
    
    func setup(viewModel: CharacterViewModel?) {
       
        self.viewModel = viewModel
        selectedSegmentIndex = viewModel?.isFavoriteTabSelected ?? false ? Numbers.oneInt : Numbers.zeroInt
        addTarget(self, action: #selector(segmentedValueChanged(sender:)), for: .valueChanged)
        
        removeBorders()
    }
    
    @objc func segmentedValueChanged(sender: UISegmentedControl) {

        guard let selected: SegmentedChar = SegmentedChar(rawValue: sender.selectedSegmentIndex)
        else { return }
        
        viewModel?.tabSelected(with: selected)
    }

    override init(items: [Any]?) {
        super.init(items: items)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
