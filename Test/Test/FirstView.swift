//
//  FirstView.swift
//  Test
//
//  Created by Jonathan Tavarez on 6/13/25.
//

import UIKit

class FirstView: UIView {
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.backgroundColor = .white
        return label
    }()
    
    //This is the normal way to initialize/customize buttons - different at duolingo
    
  
    
    
    
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        addSubview(firstLabel)
    
        
        firstLabel.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            
        }
        
        
        
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    
    */
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
