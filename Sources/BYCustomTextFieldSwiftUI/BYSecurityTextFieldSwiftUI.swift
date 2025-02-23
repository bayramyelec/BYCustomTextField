//
//  BYSecurityTextFieldSwiftUI.swift
//  BYTextField
//
//  Created by Bayram Yeleç on 21.02.2025.
//

import SwiftUI
import Combine

public struct BYSecurityTextFieldSwiftUI: View {
    
    @Binding var text: String
    let placeholder: String
    var alertText: String
    var validText: String
    let minCharacterCount: Int
    
    var backColor: Color
    var textColor: Color
    
    var leftIcon: String
    var leftIconColor: Color
    
    func isValid() -> Bool {
        return text.count >= minCharacterCount
    }
    
    @State private var isToggle: Bool = false
    
    @State private var displayValidText: String = ""
    
    public init(text: Binding<String>, placeholder: String, alertText: String = "", validText: String = "", characterCount: Int = 0, backColor: Color = Color.gray.opacity(0.2), textColor: Color = Color.black, leftIcon: String = "", leftIconColor: Color = .gray) {
        self._text = text
        self.placeholder = placeholder
        self.alertText = alertText
        self.validText = validText
        self.minCharacterCount = characterCount
        self.backColor = backColor
        self.textColor = textColor
        self.leftIcon = leftIcon
        self.leftIconColor = leftIconColor
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(backColor)
                    .frame(height: 60)
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isValid() || text.isEmpty ? Color.gray : Color.red, lineWidth: 2)
                    .frame(height: 60)
                    .animation(.easeInOut(duration: 0.2), value: isValid())
                    .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
                
                HStack {
                    
                    Image(systemName: leftIcon)
                        .foregroundStyle(leftIconColor)
                        .padding(.leading, 10)
                    
                    if isToggle {
                        TextField("", text: $text)
                            .padding(.leading, 5)
                            .font(.system(size: 15, weight: .bold))
                            .frame(height: 40)
                            .cornerRadius(10)
                            .offset(y: text.isEmpty ? 0 : 5)
                            .foregroundStyle(textColor)
                            .onReceive(Just(text)) { _ in
                                if !isValid() {
                                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                                    generator.impactOccurred()
                                }
                            }
                    } else {
                        SecureField("", text: $text)
                            .padding(.leading, 5)
                            .font(.system(size: 15, weight: .bold))
                            .frame(height: 40)
                            .cornerRadius(10)
                            .offset(y: text.isEmpty ? 0 : 5)
                            .foregroundStyle(textColor)
                            .onReceive(Just(text)) { _ in
                                if !isValid() {
                                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                                    generator.impactOccurred()
                                }
                            }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isToggle.toggle()
                    }) {
                        Image(systemName: isToggle ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(Color.gray)
                    }
                    
                    
                    Button(action: {
                        text = ""
                    }) {
                        if !text.isEmpty {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color.gray)
                                .opacity(text.isEmpty ? 0 : 1)
                        }
                    }
                    .padding(.trailing)
                }
                .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
                
                Text(placeholder)
                    .padding(.horizontal, leftIcon.isEmpty ? 25 : 40)
                    .font(.system(size: text.isEmpty ? 15 : 10, weight: .bold))
                    .foregroundColor(isValid() || text.isEmpty ? Color.gray : Color.red)
                    .offset(y: text.isEmpty ? 0 : -15)
                    .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
            }
            
            Text(displayValidText.isEmpty ? (isValid() ? "" : alertText) : displayValidText)
                .foregroundColor(isValid() ? Color.green : Color.red)
                .font(.system(size: 13, weight: .medium))
                .frame(height: 20)
                .padding(.top, 2)
                .opacity(text.isEmpty ? 0 : 1)
                .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
                .onChange(of: isValid()) { valid in
                    if valid {
                        displayValidText = validText
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            displayValidText = ""
                        }
                    }
                }
            
        }
    }
}

