//
//  TitleTextField.swift
//  Simulator virus spread
//
//  Created by Vlad Ralovich on 07.05.2023.
//

import UIKit

class TitleTextField: UIView {
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 12.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        textField.delegate = delegate
        textField.keyboardType = keyboardType
        return textField
    }()
    
    var delegate: UITextFieldDelegate?
    var text: String? {
        return textField.text
    }
    private var keyboardType: UIKeyboardType
    
    init(title: String, keyboardType: UIKeyboardType = .numberPad, text: String? = nil, delegate: UITextFieldDelegate? = nil) {
        self.keyboardType = keyboardType
        super.init(frame: .zero)
        self.delegate = delegate
        self.titleLabel.text = title.uppercased()
        self.textField.text = text
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(textField)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4.0),
            textField.heightAnchor.constraint(equalToConstant: 56.0),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
