# BYCustomTextField

BYCustomTextField is a customizable text input component developed using Swift and UIKit. In addition to the standard UITextField component, it offers a more flexible and customizable experience.

<a><img src="https://github.com/bayramyelec/BYCustomTextField/blob/a4814acc934273f20c5ce9602f7da85e6eeaf4dc/Gif/BYTextField.gif" width="200" /></a>
<a><img src="https://github.com/bayramyelec/BYCustomTextField/blob/a4814acc934273f20c5ce9602f7da85e6eeaf4dc/Gif/BYSecurityTextField.gif" width="200" /></a>
<a><img src="https://github.com/bayramyelec/BYCustomTextField/blob/a4814acc934273f20c5ce9602f7da85e6eeaf4dc/Gif/BYUnderlineTextField.gif" width="200" /></a>
<a><img src="https://github.com/bayramyelec/BYCustomTextField/blob/a4814acc934273f20c5ce9602f7da85e6eeaf4dc/Gif/BYUnderlineSecurityTextField.gif" width="200" /></a>

## Installation 

### Swift Package Manager (SPM)

1- Open your project in Xcode.

2- Click File > Add Packages...

3- Enter the following URL and click the Add Package button:

```bash 
    https://github.com/bayramyelec/BYCustomTextField
```

<img width="800" alt="Ekran Resmi 2025-02-21 13 55 11" src="https://github.com/user-attachments/assets/ef2e9a58-c0c2-4fdd-9556-88c5a08c2884" />
<img width="800" alt="Ekran Resmi 2025-02-21 13 55 25" src="https://github.com/user-attachments/assets/396c0e6e-a576-40b5-80e1-41857ebb620f" />


# Usage

### BYTextField

<a><img src="https://github.com/bayramyelec/BYCustomTextField/blob/a4814acc934273f20c5ce9602f7da85e6eeaf4dc/Gif/BYTextField.gif" width="200" /></a>

```swift
    let emailTextField = BYTextField(placeholder: "E-mail", alertMessage: "Lütfen geçerli bir e-mail adresi girin.", validMessage: "Geçerli e-mail adresi.", characters: ["@", "."])
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(emailTextField)
    NSLayoutConstraint.activate([
        emailTextField.widthAnchor.constraint(equalToConstant: 350)
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
   ])
```

### BYTextFieldSwiftUI

```swift
    import BYCustomTextFieldSwiftUI
            .
            .
    @State var text: String = ""
            .
            .
    BYTextFieldSwiftUI(text: $text, placeholder: "E-mail", alertText: "Lütfen geçerli bir email girin.", validText: "Geçerli email.", characters: ["@","."], backColor: Color.gray.opacity(0.2), textColor: Color.black)
```

---

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `placeholder`      | `string` | **Textfield Placeholder.**. |
| `alertMessage`      | `string` | **Warning message for text field.**. |
| `validMessage`      | `string` | **The text that appears when you enter correct text.**. |
| `backColor`      | `UIColor?` | **Background color of text field.**. |
| `textColor`      | `UIColor?` | **text color of the text field.**. |
| `characters`      | `[String]` | **Required symbols for warning message.**. |


### BYSecurityTextField

<a><img src="https://github.com/bayramyelec/BYCustomTextField/blob/a4814acc934273f20c5ce9602f7da85e6eeaf4dc/Gif/BYSecurityTextField.gif" width="200" /></a>

```swift
    let passwordTextField = BYSecurityTextField(placeHolder: "Password", alertMessage: "Şifreniz en az 6  haneli olmalı.", validMessage: "Geçerli şifre.", minCharacterCount: 6)
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(passwordTextField)
    NSLayoutConstraint.activate([
        passwordTextField.widthAnchor.constraint(equalToConstant: 350)
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
   ])
```

### BYSecurityTextFieldSwiftUI

```swift
    import BYCustomTextFieldSwiftUI
            .
            .
    @State var text: String = ""
            .
            .
    BYSecurityTextFieldSwiftUI(text: $text, placeholder: "Password", alertText: "Şifreniz en az 5 haneli olmak zorunda.", validText: "Geçerli şifre.", characterCount: 5, backColor: Color.gray.opacity(0.2), textColor: Color.black)
```

---

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `placeholder`      | `string` | **Textfield Placeholder.**. |
| `alertMessage`      | `string` | **Warning message for text field.**. |
| `validMessage`      | `string` | **The text that appears when you enter correct text.**. |
| `backColor`      | `UIColor?` | **Background color of text field.**. |
| `textColor`      | `UIColor?` | **text color of the text field.**. |
| `minCharacterCount`      | `Int?` | **Minimum number of characters.**. |

### BYUnderlineTextField

<a><img src="https://github.com/bayramyelec/BYCustomTextField/blob/a4814acc934273f20c5ce9602f7da85e6eeaf4dc/Gif/BYUnderlineTextField.gif" width="200" /></a>

```swift
    let emailUnderlineTextField = BYUnderlineTextField(leftIcon: UIImage(systemName: "person.fill") ?? UIImage(), placeholder: "E-mail", alertMessage: "Lütfen geçerli bir e-mail adresi girin.", validMessage: "Geçerli e-mail adresi.", underlineColor: .black, characters: ["@", "."])
    emailUnderlineTextField.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(emailUnderlineTextField)
    NSLayoutConstraint.activate([
        emailUnderlineTextField.widthAnchor.constraint(equalToConstant: 350)
        emailUnderlineTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        emailUnderlineTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
   ])
```

### BYUnderlineTextFieldSwiftUI

```swift
    import BYCustomTextFieldSwiftUI
            .
            .
    @State var text: String = ""
            .
            .
    BYUnderlineTextFieldSwiftUI(text: $text, placeholder: "E-mail", alertText: "Lütfen geçerli bir email girin.", validText: "Geçerli email.", characters: ["@","."], backColor: Color.gray.opacity(0.0), textColor: Color.black, underLineColor: Color.gray, leftIcon: "person.fill")
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `leftIcon`      | `UIImage` | **Textfield left icon.**. |
| `placeholder`      | `string` | **Textfield Placeholder.**. |
| `alertMessage`      | `string` | **Warning message for text field.**. |
| `validMessage`      | `string` | **The text that appears when you enter correct text.**. |
| `underlineColor`      | `UIColor` | **Underline color of text field.**. |
| `backColor`      | `UIColor?` | **Background color of text field.**. |
| `textColor`      | `UIColor?` | **Text color of the text field.**. |
| `characters`      | `[String]` | **Required symbols for warning message.**. |

### BYUnderlineSecurityTextField

<a><img src="https://github.com/bayramyelec/BYCustomTextField/blob/a4814acc934273f20c5ce9602f7da85e6eeaf4dc/Gif/BYUnderlineSecurityTextField.gif" width="200" /></a>

```swift
    let passwordUnderlineTextField = BYUnderlineSecurityTextField(leftIcon: UIImage(systemName: "key.horizontal.fill") ?? UIImage(), placeholder: "Password", alertMessage: "Şifreniz en az 6  haneli olmalı.", validMessage: "Geçerli şifre.", underlineColor: .black, minCharacterCount: 6)
    passwordUnderlineTextField.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(passwordUnderlineTextField)
    NSLayoutConstraint.activate([
        passwordUnderlineTextField.widthAnchor.constraint(equalToConstant: 350)
        passwordUnderlineTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        passwordUnderlineTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
   ])
```

### BYUnderlineSecurityTextFieldSwiftUI

```swift
    import BYCustomTextFieldSwiftUI
            .
            .
    @State var text: String = ""
            .
            .
    BYUnderlineSecurityTextFieldSwiftUI(text: $text, placeholder: "Password", alertText: "Şifreniz en az 5 haneli olmak zorunda.", validText: "Geçerli şifre.", minCharacterCount: 5, backColor: Color.gray.opacity(0.0), textColor: Color.black, underLineColor: Color.gray, leftIcon: "lock.fill")
```

---

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `leftIcon`      | `UIImage` | **Textfield left icon.**. |
| `placeholder`      | `string` | **Textfield Placeholder.**. |
| `alertMessage`      | `string` | **Warning message for text field.**. |
| `validMessage`      | `string` | **The text that appears when you enter correct text.**. |
| `underlineColor`      | `UIColor` | **Underline color of text field.**. |
| `backColor`      | `UIColor?` | **Background color of text field.**. |
| `textColor`      | `UIColor?` | **Text color of the text field.**. |
| `minCharacterCount`      | `Int?` | **Minimum number of characters.**. |

# Delegate Methods

```swift
    class ViewController: UIViewController, UITextFieldDelegate {
    
    let customTextField = BYTextField(placeholder: "E-mail", alertMessage: "Lütfen geçerli bir e-mail adresi girin.", validMessage: "Geçerli e-mail adresi.", characters: ["@", "."])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customTextField)
        customTextField.delegate = self
        
        customTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customTextField.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Kullanıcı giriş yapmaya başladı")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Kullanıcı giriş yapmayı bitirdi")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

```

# LICENSE

---

[MIT](https://github.com/bayramyelec/BYCustomTextField/blob/65f4a2e3aca709b2ef96086152488ee37d310de1/LICENSE)
