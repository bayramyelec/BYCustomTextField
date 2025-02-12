//
//  BYUnderlineTextField.swift
//  CustomTextField
//
//  Created by Bayram Yeleç on 12.02.2025.
//

import UIKit

public class BYUnderlineTextField: UIView {
    
    private var placeHolderText: String?
    private var alertMessage: String?
    private var validMessage: String?
    
    public var backColor : UIColor? {
        didSet {
            backView.backgroundColor = backColor
        }
    }
    
    public var textColor : UIColor? {
        didSet {
            textField.textColor = textColor
        }
    }
    
    public var underlineColor : UIColor? {
        didSet {
            underLine.backgroundColor = underlineColor
            leftIcon.tintColor = underlineColor
        }
    }
    
    private var underLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var leftIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16, weight: .bold)
        return textField
    }()
    
    private var placeholderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private var infoIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .gray
        button.alpha = 0
        button.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        return button
    }()
    
    private var cleanIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .gray
        button.alpha = 0
        return button
    }()
    
    private var alertLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    private var cleanIconWidthConstraint: NSLayoutConstraint!
    private var infoIconWidthConstraint: NSLayoutConstraint!
    
    public init(leftIcon: UIImage, placeholder: String, alertMessage: String, validMessage: String, underlineColor: UIColor) {
        self.placeHolderText = placeholder
        self.alertMessage = alertMessage
        self.validMessage = validMessage
        self.underlineColor = underlineColor
        self.leftIcon.image = leftIcon
        super.init(frame: .zero)
        setupUI()
        configure()
        placeholderLabel.text = placeHolderText
        alertLabel.text = ""
        underLine.backgroundColor = underlineColor
        self.leftIcon.tintColor = underlineColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSizeMake(UIView.noIntrinsicMetric, 70)
    }
    
    private func setupUI() {
        addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
        
        addSubview(underLine)
        NSLayoutConstraint.activate([
            underLine.topAnchor.constraint(equalTo: backView.bottomAnchor),
            underLine.leftAnchor.constraint(equalTo: self.leftAnchor),
            underLine.rightAnchor.constraint(equalTo: self.rightAnchor),
            underLine.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        addSubview(alertLabel)
        NSLayoutConstraint.activate([
            alertLabel.topAnchor.constraint(equalTo: underLine.bottomAnchor, constant: 5),
            alertLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            alertLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            alertLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        backView.addSubview(cleanIcon)
        cleanIcon.addTarget(self, action: #selector(cleanIconTapped), for: .touchUpInside)
        cleanIconWidthConstraint = cleanIcon.widthAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            cleanIcon.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            cleanIcon.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10),
            cleanIconWidthConstraint,
            cleanIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        backView.addSubview(infoIcon)
        infoIconWidthConstraint = infoIcon.widthAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            infoIcon.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            infoIcon.rightAnchor.constraint(equalTo: cleanIcon.leftAnchor, constant: -10),
            infoIconWidthConstraint,
            infoIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        backView.addSubview(leftIcon)
        NSLayoutConstraint.activate([
            leftIcon.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -14),
            leftIcon.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 10),
            leftIcon.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        backView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            textField.leftAnchor.constraint(equalTo: leftIcon.rightAnchor, constant: 10),
            textField.rightAnchor.constraint(equalTo: infoIcon.leftAnchor, constant: -10)
        ])
        
        backView.addSubview(placeholderLabel)
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            placeholderLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            placeholderLabel.leftAnchor.constraint(equalTo: leftIcon.rightAnchor, constant: 10),
            placeholderLabel.rightAnchor.constraint(equalTo: infoIcon.leftAnchor, constant: -10)
        ])
        
    }
    
    private func configure() {
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange() {
        textFieldChange()
        
    }
    
    private func textFieldChange(){
        if let text = textField.text, !text.isEmpty {
            UIView.animate(withDuration: 0.1) {
                self.placeholderLabel.alpha = 0
            }
            UIView.animate(withDuration: 0.2) {
                self.cleanIconWidthConstraint.constant = 20
                self.cleanIcon.alpha = 1
                self.layoutIfNeeded()
            }
            setupContains()
        } else {
            UIView.animate(withDuration: 0.2) {
                self.placeholderLabel.alpha = 1
                self.alertLabel.text = ""
                self.cleanIcon.alpha = 0
                self.infoIcon.alpha = 0
                self.cleanIconWidthConstraint.constant = 1
                self.infoIconWidthConstraint.constant = 1
                self.layoutIfNeeded()
                self.backView.layer.borderColor = UIColor.systemGray.cgColor
                self.placeholderLabel.textColor = .systemGray
                self.infoIcon.tintColor = .systemGray
                self.leftIcon.tintColor = self.underlineColor
                self.underLine.backgroundColor = self.underlineColor
            }
        }
    }
    
    
    private func setupContains(){
        if let text = self.textField.text, !text.contains("@") || !text.contains(".") {
            UIView.animate(withDuration: 0.2) {
                self.infoIconWidthConstraint.constant = 20
                self.infoIcon.alpha = 1
                self.layoutIfNeeded()
                self.backView.layer.borderColor = UIColor.systemRed.cgColor
                self.infoIcon.tintColor = .systemRed
                self.alertLabel.textColor = .systemRed
                self.alertLabel.text = self.alertMessage
                self.leftIcon.tintColor = .systemRed
                self.underLine.backgroundColor = .systemRed
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.infoIcon.tintColor = .systemGray
                self.infoIcon.alpha = 0
                self.infoIconWidthConstraint.constant = 1
                self.layoutIfNeeded()
                self.alertLabel.textColor = .systemGreen
                self.alertLabel.text = self.validMessage
                self.leftIcon.tintColor = self.underlineColor
                self.underLine.backgroundColor = self.underlineColor
            }
        }
        
    }
    
    @objc private func cleanIconTapped(){
        if let text = textField.text, !text.isEmpty {
            textField.text = ""
            self.alertLabel.text = ""
        }
        textFieldDidChange()
    }
    
}
