//
//  PizzaViewController.swift
//  pizzaApp
//
//  Created by Mac on 29.11.2022.
//

import UIKit

class PizzaViewController: UIViewController {

    // MARK: - Elements
    
    let margaritaPizza: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // стрелка назад
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.backward")
        return imageView
    }()
    
    let margaritaLabel: UILabel = {
        let label = UILabel()
        label.text = "Маргарита"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Arial", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let margaritaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 25)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapMargaritaButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pepperoniPizza: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza-2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pepperoniLabel: UILabel = {
        let label = UILabel()
        label.text = "Пепперони"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Arial", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pepperoniButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 25)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapPepperoniButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Pizza"
        
        // стрелка назад
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(tapBarButton))
        
        
        setupView()
        setConstraints()
    }
    
    // MARK: - Methods

    func setupView() {
        view.addSubview(margaritaPizza)
        view.addSubview(margaritaLabel)
        view.addSubview(margaritaButton)
        view.addSubview(pepperoniPizza)
        view.addSubview(pepperoniLabel)
        view.addSubview(pepperoniButton)
    }
    
    @objc func tapMargaritaButton() {
        
        let margaritaVC = MargaritaViewController()
        navigationController?.pushViewController(margaritaVC, animated: true)
    }
    
    @objc func tapPepperoniButton() {
        let pepperoniVC = PepperoniViewController()
        navigationController?.pushViewController(pepperoniVC, animated: true)
        
    }
    
    @objc func tapBarButton() {
        var currencyControlArray = navigationController?.viewControllers
        currencyControlArray?.removeLast()
        
        if let newController = currencyControlArray {
            navigationController?.viewControllers = newController
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            margaritaPizza.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            margaritaPizza.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            margaritaPizza.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            margaritaPizza.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            
            margaritaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            margaritaLabel.leadingAnchor.constraint(equalTo: margaritaPizza.trailingAnchor, constant: 20),
        
            margaritaButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 85),
            margaritaButton.leadingAnchor.constraint(equalTo: margaritaLabel.trailingAnchor, constant: 40),
            margaritaButton.widthAnchor.constraint(equalToConstant: 40),
            
            pepperoniPizza.topAnchor.constraint(equalTo: margaritaPizza.bottomAnchor, constant: 30),
            pepperoniPizza.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pepperoniPizza.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            pepperoniPizza.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            
            pepperoniLabel.topAnchor.constraint(equalTo: margaritaLabel.bottomAnchor, constant: 127),
            pepperoniLabel.leadingAnchor.constraint(equalTo: pepperoniPizza.trailingAnchor, constant: 20),
            
            pepperoniButton.topAnchor.constraint(equalTo: margaritaButton.bottomAnchor, constant: 115),
            pepperoniButton.leadingAnchor.constraint(equalTo: pepperoniLabel.trailingAnchor, constant: 40),
            pepperoniButton.widthAnchor.constraint(equalToConstant: 40)
            
            
        ])
    }

}
