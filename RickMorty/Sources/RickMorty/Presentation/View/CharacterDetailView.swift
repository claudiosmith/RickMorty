//
//  CharacterDetailView.swift
//  RickMorty
//
//  Created by Claudio Smith on 24/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

class CharacterDetailView: UIView {

    var viewdata: CharacterViewData!
    
    convenience init(viewdata: CharacterViewData) {
        self.init()
        self.viewdata = viewdata
        self.rickyImage.image = viewdata.image
        
        bindData(data: viewdata)
        initSubView()
    }
    
    func bindData<T>(data: T) {
        guard let data = data as? CharacterViewData else { return }
        
        nameLabel.text = data.name
        setupStatusSpecie(data: data)
        
        originTitleLabel.text = DetailVal.originTitleLabelText
        originLabel.text = data.origin
        locationTitleLabel.text = DetailVal.locationTitleLabelText
        locationLabel.text = data.location
    }
    
    private func initSubView() {
        
        let bounds = UIScreen.main.bounds
        self.bounds = bounds
        self.frame = bounds
        self.backgroundColor = .black
       
        setupUI()
    }
    
    private func setupStatusSpecie(data: CharacterViewData) {
        let status = data.status?.rawValue ?? Constants.emptyString
        statusLabel.text = "\(status) - \(data.species)"
    }
    
    private func setupBallColor() {
        ballColor.backgroundColor = viewdata.status?.color
        ballColor.layer.masksToBounds = true
        ballColor.layer.cornerRadius = DetailVal.ballRadius / Numbers.half
    }
    
    func setupBoxView() {
        boxView.backgroundColor = #colorLiteral(red: 0.1247354497, green: 0.1272352592, blue: 0.1400317101, alpha: 1)
        boxView.layer.masksToBounds = true
        boxView.layer.cornerRadius = DetailVal.boxviewCorner
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBallColor()
    }

    lazy var boxView = UIView()
    lazy var ballColor = UIView()
    let rickyImage: UIImageView = { let f = UIImageView()
        f.contentMode = .scaleAspectFit
        return f }()
    
    let nameLabel: UILabel = { let f = UILabel()
        f.textColor = .white
        f.font = UIFont.boldSystemFont(ofSize: 20)
        return f }()
    
    let statusLabel: UILabel = { let f = UILabel()
        f.textColor = .white
        return f }()
    
    let originTitleLabel: UILabel = { let f = UILabel()
        f.textColor = .gray
        return f }()
    
    let originLabel: UILabel = { let f = UILabel()
        f.textColor = .white
        return f }()
    
    let locationTitleLabel: UILabel = { let f = UILabel()
        f.textColor = .gray
        return f }()
    
    let locationLabel: UILabel = { let f = UILabel()
        f.textColor = .white
        return f }()
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubView()
    }

}


