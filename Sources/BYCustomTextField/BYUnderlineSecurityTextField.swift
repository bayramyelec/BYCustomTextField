//
//  BYUnderlineSecurityTextField.swift
//  CustomTextField
//
//  Created by Bayram Yeleç on 12.02.2025.
//

import UIKit

public class BYUnderlineSecurityTextField: UIView, UITextFieldDelegate {
    
    public weak var delegate: UITextFieldDelegate?
    
    // MARK: VARIABLES
    
    public var text: String? {
        return textField.text
    }
    
    private var placeholder: String?
    private var alertMessage: String?
    private var validMessage: String?
    
    public var underlineColor : UIColor? {
        didSet {
            underLine.backgroundColor = underlineColor
            leftIcon.tintColor = underlineColor
        }
    }
    
    // MARK: COMPONENTS
    
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
        textField.isSecureTextEntry = true
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
    
    private var securityIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = .gray
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
    
    // MARK: ICON WIDTH
    
    private var cleanIconWidthConstraint: NSLayoutConstraint!
    private var leftIconWidthConstraint: NSLayoutConstraint!
    
    private var isSecure: Bool = true
    
    // MARK: IS VALID
    
    private var minCharacterCount: Int
    
    private func isValidFunc() -> Bool {
        guard let text = textField.text else { return false }
        return  text.count >= minCharacterCount
    }
    
    private var leftIconString: String = ""
    
    // MARK: INIT
    
    public init(placeholder: String, alertMessage: String = "", validMessage: String = "", underlineColor: UIColor = .systemGray, minCharacterCount: Int = 0, textColor: UIColor = .black , leftIcon: String = "") {
        self.placeholder = placeholder
        self.alertMessage = alertMessage
        self.validMessage = validMessage
        self.underlineColor = underlineColor
        self.minCharacterCount = minCharacterCount
        self.textField.textColor = textColor
        self.leftIconString = leftIcon
        self.leftIcon.image = UIImage(systemName: self.leftIconString)
        self.leftIcon.tintColor = underlineColor
        super.init(frame: .zero)
        setupUI()
        configure()
        placeholderLabel.text = placeholder
        alertLabel.text = ""
        underLine.backgroundColor = underlineColor
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSizeMake(UIView.noIntrinsicMetric, 70)
    }
    
    // MARK: FUNCS
    
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
        
        backView.addSubview(securityIcon)
        securityIcon.addTarget(self, action: #selector(securityIconTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            securityIcon.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            securityIcon.rightAnchor.constraint(equalTo: cleanIcon.leftAnchor, constant: -10),
            securityIcon.widthAnchor.constraint(equalToConstant: 30),
            securityIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        backView.addSubview(leftIcon)
        leftIconWidthConstraint = leftIcon.widthAnchor.constraint(equalToConstant: self.leftIconString.isEmpty ? 0 : 20)
        NSLayoutConstraint.activate([
            leftIcon.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -14),
            leftIcon.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 10),
            leftIconWidthConstraint
        ])
        
        backView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            textField.leftAnchor.constraint(equalTo: leftIcon.rightAnchor, constant: 10),
            textField.rightAnchor.constraint(equalTo: securityIcon.leftAnchor, constant: -10)
        ])
        
        backView.addSubview(placeholderLabel)
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            placeholderLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            placeholderLabel.leftAnchor.constraint(equalTo: leftIcon.rightAnchor, constant: 10),
            placeholderLabel.rightAnchor.constraint(equalTo: securityIcon.leftAnchor, constant: -10)
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
            setAnimation(
                cleanIconAlpha: 1,
                cleanIconWidth: 20,
                placeholderAlpha: 0
            )
            setupContains()
            if minCharacterCount == 0 {
                self.alertLabel.alpha = 0
            }
        } else {
            setAnimation(
                txtFieldTransform: .identity,
                cleanIconAlpha: 0,
                alertLabelText: "",
                backViewBorderColor: UIColor.systemGray,
                placeHolderTextColor: .systemGray,
                cleanIconWidth: 1,
                placeholderAlpha: 1,
                underlineColor: self.underlineColor,
                leftIconColor: self.underlineColor
            )
        }
    }
    
    
    private func setupContains(){
        if isValidFunc() {
            setAnimation(
                alertLabelText: self.validMessage,
                alertLabelTextColor: .systemGreen,
                underlineColor: self.underlineColor,
                leftIconColor: self.underlineColor
            )
        } else {
            
            // hata için titreşim
            
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            setAnimation(
                alertLabelText: self.alertMessage,
                alertLabelTextColor: .systemRed,
                underlineColor: .systemRed,
                leftIconColor: .systemRed
            )
        }
        
    }
    
    @objc private func cleanIconTapped(){
        if let text = textField.text, !text.isEmpty {
            textField.text = ""
            self.alertLabel.text = ""
        }
        textFieldDidChange()
    }
    
    @objc private func securityIconTapped(){
        isSecure.toggle()
        if isSecure {
            self.textField.isSecureTextEntry = true
            self.securityIcon.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            self.textField.isSecureTextEntry = false
            self.securityIcon.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    // MARK: ANIMATION FUNC
    
    private func setAnimation(transform: CGAffineTransform? = nil, txtFieldTransform: CGAffineTransform? = nil, cleanIconAlpha: CGFloat? = nil, alertLabelText: String? = nil, alertLabelTextColor: UIColor? = nil, infoIconAlpha: CGFloat? = nil, backViewBorderColor: UIColor? = nil, placeHolderTextColor: UIColor? = nil, infoIconColor: UIColor? = nil, cleanIconWidth: CGFloat? = nil, infoIconWidth: CGFloat? = nil, placeholderAlpha: CGFloat? = nil, underlineColor: UIColor? = nil, leftIconColor: UIColor? = nil) {
        
        UIView.animate(withDuration: 0.2 ) {
            if let transform = transform {
                self.placeholderLabel.transform = transform
            }
            if let txtFieldTransform = txtFieldTransform {
                self.textField.transform = txtFieldTransform
            }
            if let cleanIconAlpha = cleanIconAlpha {
                self.cleanIcon.alpha = cleanIconAlpha
            }
            if let alertLabelText = alertLabelText {
                self.alertLabel.text = alertLabelText
            }
            if let alertLabelTextColor = alertLabelTextColor {
                self.alertLabel.textColor = alertLabelTextColor
            }
            if let backViewBorderColor = backViewBorderColor {
                self.backView.layer.borderColor = backViewBorderColor.cgColor
            }
            if let placeHolderTextColor = placeHolderTextColor {
                self.placeholderLabel.textColor = placeHolderTextColor
            }
            if let cleanIconWidth = cleanIconWidth {
                self.cleanIconWidthConstraint.constant = cleanIconWidth
            }
            if let placeholderAlpha = placeholderAlpha {
                self.placeholderLabel.alpha = placeholderAlpha
            }
            if let underlineColor = underlineColor {
                self.underLine.backgroundColor = underlineColor
            }
            if let leftIconColor = leftIconColor {
                self.leftIcon.tintColor = leftIconColor
            }
            self.layoutIfNeeded()
        }
    }
    
    
}

extension BYUnderlineSecurityTextField {
    
    // MARK: - UITextFieldDelegate Methods
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldEndEditing?(textField) ?? true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing?(textField)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(textField) ?? true
    }
}
