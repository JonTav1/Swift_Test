//
//  TextViewVC.swift
//  Test
//
//  Created by Jonathan Tavarez on 6/13/25.
//

import UIKit

class TextViewVC: UIViewController {
    
    private enum Constants {
        static let textBorderWidth: CGFloat = 2
        static let textBorderCornerRadius: CGFloat = 12
    }
    
    private lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "this is the second label"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.backgroundColor = .white
        return label
    }()
    
    private lazy var submitButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Press Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(submitText), for: .touchUpInside)
        return button
        
    }()
    
    let textView = UITextView()
    
    let borderView = UIView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        borderView.layer.borderWidth = Constants.textBorderWidth
        borderView.layer.cornerRadius = Constants.textBorderCornerRadius
        borderView.layer.borderColor = UIColor.gray.cgColor
        
        borderView.addSubview(textView)
        
        

        textView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8) // Padding inside border
        }
        
        let stackView = UIStackView(arrangedSubviews: [
            thirdLabel,
            borderView,
            submitButton
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        borderView.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        

    }
    
    @objc private func submitText() {
        
        if let text = textView.text {
            fetchData(thing: text)
        }
        textView.text = ""
    }

    func fetchData(thing: String){
        guard !thing.isEmpty else{
            return
        }
        
        guard
            let url = URL(string : "https://catfact.ninja/fact")
        else{
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          
                if let error = error {
                    return
                }

        
                guard let data = data else {
                    return
                }

            
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                       
                        if let fact = json["fact"] as? String {
                            DispatchQueue.main.async {
                                                self.thirdLabel.text = "Here's a cat fact: \(fact)"
                            }
                        }
                    }
                } catch {
                    return
                }
            }
        
        task.resume()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
