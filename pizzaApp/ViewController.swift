//
//  ViewController.swift
//  pizzaApp
//
//  Created by Mac on 29.11.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Elements
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza-shop")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Телефон"
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        label.font = UIFont(name: "Arial", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberTextFiled: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ваш номер"
        textField.textColor = .black
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let stroke: UIView = {
        let stroke = UIView()
        stroke.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        stroke.translatesAutoresizingMaskIntoConstraints = false
        return stroke
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        label.font = UIFont(name: "Arial", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let stroke2: UIView = {
        let stroke = UIView()
        stroke.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        stroke.translatesAutoresizingMaskIntoConstraints = false
        return stroke
    }()
    
    let signButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSizeMake(0, 1.0);
        button.layer.shadowOpacity = 2.0;
        button.layer.shadowRadius = 5.0;
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        addTap()
    }

    // MARK: - Methods
    
    func setupView() {
       
        view.addSubview(imageView)
        view.addSubview(emailLabel)
        view.addSubview(numberTextFiled)
        view.addSubview(stroke)
        view.addSubview(passwordLabel)
        view.addSubview(passTextField)
        view.addSubview(stroke2)
        view.addSubview(signButton)
        
    }
    
    func addTap() { // закрытие клавиатуры по тапу
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(true)
    }
    
    @objc func tapButton() {
        guard numberTextFiled.hasText && passTextField.hasText else { return alert(title: "Заполните номер и пароль", message: "", style: .alert) }
        
        let foodVC = FoodViewController()
        navigationController?.pushViewController(foodVC, animated: true)
    }

    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    func setConstraints() { // расположение объектов
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            emailLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 150),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            numberTextFiled.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            numberTextFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberTextFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stroke.topAnchor.constraint(equalTo: numberTextFiled.bottomAnchor, constant: 10),
            stroke.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stroke.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stroke.heightAnchor.constraint(equalToConstant: 2),
            
            passwordLabel.topAnchor.constraint(equalTo: stroke.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            passTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stroke2.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 10),
            stroke2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stroke2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stroke2.heightAnchor.constraint(equalToConstant: 2),
            
            signButton.topAnchor.constraint(equalTo: stroke2.bottomAnchor, constant: 100),
            signButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

