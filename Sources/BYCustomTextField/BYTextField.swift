//
//  CustomTextField.swift
//  CustomTextField
//
//  Created by Bayram Yeleç on 11.02.2025.
//

import UIKit

public class BYTextField: UIView, UITextFieldDelegate {
    
    public weak var delegate: UITextFieldDelegate?
    
    // MARK: VARIABLES
    
    public var text: String? {
        return textField.text
    }
    
    private var placeHolderText: String?
    private var alertMessage: String?
    private var validMessage: String?
    
    // MARK: COMPONENT
    
    private var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray.cgColor
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
        button.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        button.tintColor = .gray
        button.alpha = 0
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
    
    private var leftIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: ICON VIEW WIDTH
    
    private var cleanIconWidthConstraint: NSLayoutConstraint!
    private var infoIconWidthConstraint: NSLayoutConstraint!
    private var leftIconWidthConstraint: NSLayoutConstraint!
    
    
    // MARK: IS VALID
    
    private var characters: [String] = []
    
    private func isValidFunc() -> Bool {
        guard let text = textField.text else { return false }
        if characters.isEmpty {
            return true
        }
        return characters.allSatisfy { text.contains($0) }
    }
    
    private var leftIconString: String = ""
    
    // MARK: INIT
    
    public init(placeholder: String, alertMessage: String = "", validMessage: String = "", characters: [String] = [], backColor: UIColor = .systemGray.withAlphaComponent(0.2), textColor: UIColor = .black , leftIcon: String = "", leftIconColor: UIColor = .systemGray) {
        self.placeHolderText = placeholder
        self.alertMessage = alertMessage
        self.validMessage = validMessage
        self.characters = characters
        self.backView.backgroundColor = backColor
        self.textField.textColor = textColor
        self.leftIconString = leftIcon
        self.leftIcon.image = UIImage(systemName: self.leftIconString)
        self.leftIcon.tintColor = leftIconColor
        super.init(frame: .zero)
        setupUI()
        configure()
        placeholderLabel.text = placeHolderText
        alertLabel.text = ""
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSizeMake(UIView.noIntrinsicMetric, 70)
    }
    
    // MARK: FUNCTIONS
    
    private func setupUI() {
        addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
        
        addSubview(alertLabel)
        NSLayoutConstraint.activate([
            alertLabel.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 5),
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
        leftIconWidthConstraint = leftIcon.widthAnchor.constraint(equalToConstant: self.leftIconString.isEmpty ? 0 : 20)
        NSLayoutConstraint.activate([
            leftIcon.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 10),
            leftIcon.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            leftIcon.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            leftIconWidthConstraint,
        ])
        
        backView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            textField.leftAnchor.constraint(equalTo: leftIcon.rightAnchor, constant: 10),
            textField.rightAnchor.constraint(equalTo: infoIcon.leftAnchor, constant: -10)
        ])
        
        backView.addSubview(placeholderLabel)
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            placeholderLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
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
            setAnimation(
                transform: CGAffineTransform(translationX: -55, y: -20).concatenating(CGAffineTransform(scaleX: 0.7, y: 0.7)),
                txtFieldTransform: CGAffineTransform(translationX: 0, y: 5),
                cleanIconAlpha: 1,
                cleanIconWidth: 20
            )
            setupContains()
            if characters.isEmpty {
                self.alertLabel.alpha = 0
            }
        } else {
            setAnimation(
                transform: CGAffineTransform.identity,
                txtFieldTransform: CGAffineTransform.identity,
                cleanIconAlpha: 0,
                alertLabelText: "",
                infoIconAlpha: 0,
                backViewBorderColor: UIColor.systemGray,
                placeHolderTextColor: UIColor.systemGray,
                infoIconColor: UIColor.systemGray,
                cleanIconWidth: 1,
                infoIconWidth: 1
            )
        }
    }
    
    
    private func setupContains(){
        if isValidFunc() {
            setAnimation(
                alertLabelText: self.validMessage,
                alertLabelTextColor: .systemGreen,
                infoIconAlpha: 0,
                backViewBorderColor: UIColor.systemGray,
                placeHolderTextColor: .systemGray,
                infoIconColor: .systemGray
            )
            
        } else {
            
            // hata için titreşim
            
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            setAnimation(
                alertLabelText: self.alertMessage,
                alertLabelTextColor: .systemRed,
                infoIconAlpha: 1,
                backViewBorderColor: UIColor.systemRed,
                placeHolderTextColor: .systemRed,
                infoIconColor: .systemRed,
                cleanIconWidth: 20,
                infoIconWidth: 20
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
    
    // MARK: ANIMATION FUNC
    
    private func setAnimation(transform: CGAffineTransform? = nil, txtFieldTransform: CGAffineTransform? = nil, cleanIconAlpha: CGFloat? = nil, alertLabelText: String? = nil, alertLabelTextColor: UIColor? = nil, infoIconAlpha: CGFloat? = nil, backViewBorderColor: UIColor? = nil, placeHolderTextColor: UIColor? = nil, infoIconColor: UIColor? = nil, cleanIconWidth: CGFloat? = nil, infoIconWidth: CGFloat? = nil) {
        
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
            if let infoIconAlpha = infoIconAlpha {
                self.infoIcon.alpha = infoIconAlpha
            }
            if let backViewBorderColor = backViewBorderColor {
                self.backView.layer.borderColor = backViewBorderColor.cgColor
            }
            if let placeHolderTextColor = placeHolderTextColor {
                self.placeholderLabel.textColor = placeHolderTextColor
            }
            if let infoIconColor = infoIconColor {
                self.infoIcon.tintColor = infoIconColor
            }
            if let cleanIconWidth = cleanIconWidth {
                self.cleanIconWidthConstraint.constant = cleanIconWidth
            }
            if let infoIconWidth = infoIconWidth {
                self.infoIconWidthConstraint.constant = infoIconWidth
            }
            self.layoutIfNeeded()
        }
    }
    
}


extension BYTextField {
    
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
