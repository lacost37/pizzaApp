//
//  FoodViewController.swift
//  pizzaApp
//
//  Created by Mac on 29.11.2022.
//

import UIKit

class FoodViewController: UIViewController {

    // MARK: - Elements
    
    let pizzaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Пицца", for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.addTarget(self, action: #selector(tapButtonPizza(button:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let sushiButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Суши", for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.addTarget(self, action: #selector(tapButtonSushi(button:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Food"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem()
       
        
        setupView()
        setConstraints()
        
    }
    
    // MARK: - Methods
    
    func setupView() {
        view.addSubview(pizzaButton)
        view.addSubview(sushiButton)
    }
    
    @objc func tapButtonSushi(button: UIButton) {
        if button.layer.borderColor == UIColor.black.cgColor {
            button.layer.borderColor = UIColor.red.cgColor
        } else {
            button.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @objc func tapButtonPizza(button: UIButton) {
        
        let pizzaVC = PizzaViewController()
        navigationController?.pushViewController(pizzaVC, animated: true)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            pizzaButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pizzaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pizzaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pizzaButton.heightAnchor.constraint(equalToConstant: 150),
            
            sushiButton.topAnchor.constraint(equalTo: pizzaButton.bottomAnchor, constant: 30),
            sushiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sushiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sushiButton.heightAnchor.constraint(equalToConstant: 150)
        
        ])
    }
    
}



