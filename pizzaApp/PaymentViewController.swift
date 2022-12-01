//
//  PaymentViewController.swift
//  pizzaApp
//
//  Created by Mac on 30.11.2022.
//

import UIKit

class PaymentViewController: UIViewController {

    var valueString = ""
    var cheeseString = ""
    var hamString = ""
    var mashroomString = ""
    var olivesString = ""
    
    // MARK: - Elements
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ:"
        label.font = UIFont(name: "Arial", size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var orderValue: UILabel = {
        var label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cheeseValue: UILabel = {
        var label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var hamValue: UILabel = {
        var label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var mashroomValue: UILabel = {
        var label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var olivesValue: UILabel = {
        var label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cardLabel: UILabel = {
        var label = UILabel()
        label.text = "Оплата картой"
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cashLabel: UILabel = {
        var label = UILabel()
        label.text = "Наличными"
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cardSwitch: UISwitch = {
        let cheseSwitch = UISwitch()
        cheseSwitch.isOn = false
        cheseSwitch.addTarget(self, action: #selector(checkCardSwitch(target:)), for: .valueChanged)
        cheseSwitch.translatesAutoresizingMaskIntoConstraints = false
        return cheseSwitch
    }()
    
    let cashSwitch: UISwitch = {
        let cheseSwitch = UISwitch()
        cheseSwitch.isOn = true
        cheseSwitch.addTarget(self, action: #selector(checkCashSwitch(target:)), for: .valueChanged)
        cheseSwitch.translatesAutoresizingMaskIntoConstraints = false
        return cheseSwitch
    }()
    
    let payButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "apple1"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.tintColor = .white
        button.imageEdgeInsets.left = .pi
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapPayButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    // MARK: - Methods
    

    
    func setupView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        title = "Оплата"
        
        orderValue.text = valueString
        cheeseValue.text = cheeseString
        hamValue.text = hamString
        mashroomValue.text = mashroomString
        olivesValue.text = olivesString
        
        view.addSubview(orderLabel)
        view.addSubview(orderValue)
        view.addSubview(cheeseValue)
        view.addSubview(hamValue)
        view.addSubview(mashroomValue)
        view.addSubview(olivesValue)
        view.addSubview(cardLabel)
        view.addSubview(cashLabel)
        view.addSubview(cashSwitch)
        view.addSubview(cardSwitch)
        view.addSubview(payButton)
    }
    
    @objc func tapPayButton() {
        let alertController = UIAlertController(title: "Заказ оплачен!", message: "Ваш заказ доставят в течении 15 минут! \nПриятного аппетита.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            var currencyControlArray = self.navigationController?.viewControllers
            currencyControlArray?.removeLast()
            currencyControlArray?.removeLast()
            currencyControlArray?.removeLast()
            
            if let newController = currencyControlArray {
                self.navigationController?.viewControllers = newController
            }
        }
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    @objc func checkCardSwitch(target: UISwitch) {
        if target.isOn {
            cashSwitch.isOn = false
        } else {
            cashSwitch.isOn = true
        }
    }
    
    @objc func checkCashSwitch(target: UISwitch) {
        if target.isOn {
            cardSwitch.isOn = false
        } else {
            cardSwitch.isOn = true
        }
    }
   
    func setConstraints() {
        NSLayoutConstraint.activate([
        
            orderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            orderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            orderValue.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 20),
            orderValue.leadingAnchor.constraint(equalTo: orderLabel.leadingAnchor, constant: 20),
            
            cheeseValue.topAnchor.constraint(equalTo: orderValue.bottomAnchor, constant: 20),
            cheeseValue.leadingAnchor.constraint(equalTo: orderLabel.leadingAnchor, constant: 20),
            
            hamValue.topAnchor.constraint(equalTo: cheeseValue.bottomAnchor, constant: 20),
            hamValue.leadingAnchor.constraint(equalTo: orderLabel.leadingAnchor, constant: 20),
            
            mashroomValue.topAnchor.constraint(equalTo: hamValue.bottomAnchor, constant: 20),
            mashroomValue.leadingAnchor.constraint(equalTo: orderLabel.leadingAnchor, constant: 20),
            
            olivesValue.topAnchor.constraint(equalTo: mashroomValue.bottomAnchor, constant: 20),
            olivesValue.leadingAnchor.constraint(equalTo: orderLabel.leadingAnchor, constant: 20),
            
            cardLabel.topAnchor.constraint(equalTo: olivesValue.bottomAnchor, constant: 335),
            cardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            
            cashLabel.topAnchor.constraint(equalTo: cardLabel.bottomAnchor, constant: 25),
            cashLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            
            cardSwitch.topAnchor.constraint(equalTo: olivesValue.bottomAnchor, constant: 330),
            cardSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            cashSwitch.topAnchor.constraint(equalTo: cardSwitch.bottomAnchor, constant: 20),
            cashSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
 
            payButton.topAnchor.constraint(equalTo: cashSwitch.bottomAnchor, constant: 40),
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
}
