
<a><img src="https://github.com/user-attachments/assets/a1e56d5f-e4d0-4681-97d1-2fd3aae99d70" /></a>


# BYCustomTextField UIKit - SwiftUI

BYCustomTextField is a customizable text input component developed using Swift and UIKit. In addition to the standard UITextField component, it offers a more flexible and customizable experience.

<a><img src="https://github.com/user-attachments/assets/625ed57b-5ee8-40cc-9da8-d9c919e246fe" width="200" /></a>
<a><img src="https://github.com/user-attachments/assets/c6613800-7793-4612-bc18-610bb0925949" width="200" /></a>
<a><img src="https://github.com/user-attachments/assets/32642be9-bc83-42a8-ac0d-3851be413f91" width="200" /></a>
<a><img src="https://github.com/user-attachments/assets/031aff7a-5f42-48fb-a429-d0cde4352491" width="200" /></a>

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

<a><img src="https://github.com/user-attachments/assets/625ed57b-5ee8-40cc-9da8-d9c919e246fe" width="200" /></a>

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
    BYTextFieldSwiftUI(text: $text, placeholder: "E-mail", alertText: "Lütfen geçerli bir e-mail girin.", validText: "Geçerli email.", characters: ["@", "."], textColor: Color.black, leftIcon: "person.fill", leftIconColor: Color.gray)
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
| `leftIcon`      | `String` | **left icon systemName..**. |
| `leftIconColor`      | `Color` | **left icon color.**. |


### BYSecurityTextField

<a><img src="https://github.com/user-attachments/assets/c6613800-7793-4612-bc18-610bb0925949" width="200" /></a>

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
    BYSecurityTextFieldSwiftUI(text: $text1, placeholder: "Password", alertText: "Şifreniz en az 5 haneli olmalıdır.", validText: "Geçerli şifre.", characterCount: 5, textColor: Color.black, leftIcon: "lock.fill", leftIconColor: Color.gray)
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
| `leftIcon`      | `String` | **left icon systemName..**. |
| `leftIconColor`      | `Color` | **left icon color.**. |

### BYUnderlineTextField

<a><img src="https://github.com/user-attachments/assets/32642be9-bc83-42a8-ac0d-3851be413f91" width="200" /></a>

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
    BYUnderlineTextFieldSwiftUI(text: $text2, placeholder: "E-mail", alertText: "Lütfen geçerli bir e-mail girin.", validText: "Geçerli email.", characters: ["@", "."], textColor: Color.black, underLineColor: Color.gray, leftIcon: "person.fill")
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `placeholder`      | `string` | **Textfield Placeholder.**. |
| `alertMessage`      | `string` | **Warning message for text field.**. |
| `validMessage`      | `string` | **The text that appears when you enter correct text.**. |
| `underlineColor`      | `UIColor` | **Underline color of text field.**. |
| `backColor`      | `UIColor?` | **Background color of text field.**. |
| `textColor`      | `UIColor?` | **Text color of the text field.**. |
| `characters`      | `[String]` | **Required symbols for warning message.**. |
| `leftIcon`      | `String` | **left icon systemName..**. |
| `leftIconColor`      | `Color` | **left icon color.**. |

### BYUnderlineSecurityTextField

<a><img src="https://github.com/user-attachments/assets/031aff7a-5f42-48fb-a429-d0cde4352491" width="200" /></a>

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
    BYUnderlineSecurityTextFieldSwiftUI(text: $text3, placeholder: "Password", alertText: "Şifreniz en az 5 haneli olmalıdır.", validText: "Geçerli şifre.", minCharacterCount: 5, textColor: Color.black, underLineColor: Color.gray, leftIcon: "lock.fill")
```

---

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `placeholder`      | `string` | **Textfield Placeholder.**. |
| `alertMessage`      | `string` | **Warning message for text field.**. |
| `validMessage`      | `string` | **The text that appears when you enter correct text.**. |
| `underlineColor`      | `UIColor` | **Underline color of text field.**. |
| `backColor`      | `UIColor?` | **Background color of text field.**. |
| `textColor`      | `UIColor?` | **Text color of the text field.**. |
| `minCharacterCount`      | `Int?` | **Minimum number of characters.**. |
| `leftIcon`      | `String` | **left icon systemName..**. |
| `leftIconColor`      | `Color` | **left icon color.**. |

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
