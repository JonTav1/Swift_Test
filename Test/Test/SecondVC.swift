//
//  SecondVC.swift
//  Test
//
//  Created by Jonathan Tavarez on 6/13/25.
//

import UIKit

class SecondVC: UIViewController {

    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "this is the second label"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.backgroundColor = .white
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(secondLabel)
        
        secondLabel.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }

        // Do any additional setup after loading the view.
    }
    
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
