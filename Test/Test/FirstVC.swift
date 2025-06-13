//
//  FirstVC.swift
//  Test
//
//  Created by Jonathan Tavarez on 6/13/25.
//

import UIKit
import SnapKit

class FirstVC: UIViewController {
    
    private lazy var firstButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Press Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(switchVC), for: .touchUpInside)
        return button
        
    }()
    
    
   
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let firstView = FirstView()
        view.addSubview(firstView)
        
        firstView.snp.makeConstraints { make in
            make.edges.equalToSuperview()  // or use specific size if needed
        }
        
        
        view.addSubview(firstButton)
        
        firstButton.snp.makeConstraints{ make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        
        // Do any additional setup after loading the view.
    }
    
    @objc func switchVC() {
        let newVC = SecondVC()
        self.present(newVC, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
