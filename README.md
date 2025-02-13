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

# LICENSE

---

[MIT](https://github.com/bayramyelec/BYCustomTextField/blob/65f4a2e3aca709b2ef96086152488ee37d310de1/LICENSE)
