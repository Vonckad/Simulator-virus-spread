//
//  StartViewController.swift
//  Simulator virus spread
//
//  Created by Vlad Ralovich on 07.05.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    private lazy var groupSizeTextField = TitleTextField(title: "Количество людей в моделируемой группе")
    private lazy var infectionFactorTextField = TitleTextField(title: "Количество людей, которое может быть заражено одним человеком при контакте")
    private lazy var recalculationPeriodTextField = TitleTextField(title: "Период пересчёта количества заражённых людей")
    
    private lazy var starButton: UIButton = {
       let button = UIButton()
        button.setTitle("Запустить моделирование", for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.7)
        button.layer.cornerRadius = 20.0
        button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        return button
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        setupUI()
    }
    
    //MARK: - Private
    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc
    private func startButtonAction() {
        print("startButtonAction")
    }

    private func setupUI() {
        //??
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = .black
        label.text = "Симулятор распространения вируса"
        self.navigationItem.titleView = label
        
        view.addSubview(groupSizeTextField)
        view.addSubview(infectionFactorTextField)
        view.addSubview(recalculationPeriodTextField)
        view.addSubview(starButton)
        
        groupSizeTextField.translatesAutoresizingMaskIntoConstraints = false
        infectionFactorTextField.translatesAutoresizingMaskIntoConstraints = false
        recalculationPeriodTextField.translatesAutoresizingMaskIntoConstraints = false
        starButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            groupSizeTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            groupSizeTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            groupSizeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            
            infectionFactorTextField.topAnchor.constraint(equalTo: groupSizeTextField.bottomAnchor, constant: 20.0),
            infectionFactorTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            infectionFactorTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            
            recalculationPeriodTextField.topAnchor.constraint(equalTo: infectionFactorTextField.bottomAnchor, constant: 20.0),
            recalculationPeriodTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            recalculationPeriodTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            
            starButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
            
            starButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            starButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            starButton.heightAnchor.constraint(equalToConstant: 56.0),
            
        ])
    }
}
