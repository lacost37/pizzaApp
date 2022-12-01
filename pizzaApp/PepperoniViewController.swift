//
//  PepperoniViewController.swift
//  pizzaApp
//
//  Created by Mac on 29.11.2022.
//

import UIKit

class PepperoniViewController: UIViewController {
    // MARK: - Elements
    
    // фото
    var imageView = UIImageView()
    
    // MARK: - Labels
    let cheseLabel: UILabel = {
        let label = UILabel()
        label.text = "Сыр мацарела"
        label.font = UIFont(name: "Arial-BoldMT", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hamLabel: UILabel = {
        let label = UILabel()
        label.text = "Ветчина"
        label.font = UIFont(name: "Arial-BoldMT", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mashroomLabel: UILabel = {
        let label = UILabel()
        label.text = "Грибы"
        label.font = UIFont(name: "Arial-BoldMT", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let olivesLabel: UILabel = {
        let label = UILabel()
        label.text = "Маслины"
        label.font = UIFont(name: "Arial-BoldMT", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Switch
    let cheseSwitch: UISwitch = {
        let cheseSwitch = UISwitch()
        cheseSwitch.isOn = false
        cheseSwitch.translatesAutoresizingMaskIntoConstraints = false
        return cheseSwitch
    }()
    
    let hamSwitch: UISwitch = {
        let cheseSwitch = UISwitch()
        cheseSwitch.isOn = false
        cheseSwitch.translatesAutoresizingMaskIntoConstraints = false
        return cheseSwitch
    }()
    
    let mashroomSwitch: UISwitch = {
        let cheseSwitch = UISwitch()
        cheseSwitch.isOn = false
        cheseSwitch.translatesAutoresizingMaskIntoConstraints = false
        return cheseSwitch
    }()
    
    let olivesSwitch: UISwitch = {
        let cheseSwitch = UISwitch()
        cheseSwitch.isOn = false
        cheseSwitch.translatesAutoresizingMaskIntoConstraints = false
        return cheseSwitch
    }()
    
    let selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapSelectButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeBarButton))
        
        setupView()
        setConstraints()
        
        
    }
    
    // MARK: - Methods

    func setupView() {
        let pizzaVC = PizzaViewController()
        title = pizzaVC.pepperoniLabel.text
        imageView = pizzaVC.pepperoniPizza
        
        view.addSubview(imageView)
        view.addSubview(cheseLabel)
        view.addSubview(hamLabel)
        view.addSubview(mashroomLabel)
        view.addSubview(olivesLabel)
        view.addSubview(cheseSwitch)
        view.addSubview(hamSwitch)
        view.addSubview(mashroomSwitch)
        view.addSubview(olivesSwitch)
        view.addSubview(selectButton)
    }
   
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            cheseLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 45),
            cheseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            hamLabel.topAnchor.constraint(equalTo: cheseLabel.bottomAnchor, constant: 30),
            hamLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            mashroomLabel.topAnchor.constraint(equalTo: hamLabel.bottomAnchor, constant: 30),
            mashroomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            olivesLabel.topAnchor.constraint(equalTo: mashroomLabel.bottomAnchor, constant: 30),
            olivesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            cheseSwitch.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            cheseSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            hamSwitch.topAnchor.constraint(equalTo: cheseSwitch.bottomAnchor, constant: 20),
            hamSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            mashroomSwitch.topAnchor.constraint(equalTo: hamSwitch.bottomAnchor, constant: 20),
            mashroomSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            olivesSwitch.topAnchor.constraint(equalTo: mashroomSwitch.bottomAnchor, constant: 20),
            olivesSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            selectButton.topAnchor.constraint(equalTo: olivesLabel.bottomAnchor, constant: 80),
            selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            selectButton.heightAnchor.constraint(equalToConstant: 40)
        
        
        ])
    }
    
    @objc func tapSelectButton() {
        let paymentVC = PaymentViewController()
        paymentVC.valueString = "1.Пепперони"
        if cheseSwitch.isOn {
            paymentVC.cheeseString = "* Сыр мацарела"
        }
        if hamSwitch.isOn {
            paymentVC.hamString = "* Ветчина"
        }
        if mashroomSwitch.isOn {
            paymentVC.mashroomString = "* Грибы"
        }
        if olivesSwitch.isOn {
            paymentVC.olivesString = "* Оливки"
        }
        navigationController?.pushViewController(paymentVC, animated: true)
    }
    
    @objc func closeBarButton() {
        navigationController?.popViewController(animated: true)
    }


  

}
