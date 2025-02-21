//
//  BYSecurityTextFieldSwiftUI.swift
//  BYTextField
//
//  Created by Bayram Yeleç on 21.02.2025.
//

import SwiftUI

public struct BYSecurityTextFieldSwiftUI: View {
    
    @Binding var text: String
    let placeholder: String
    var alertText: String
    var validText: String
    let minCharacterCount: Int
    
    var backColor: Color
    var textColor: Color
    
    func isValid() -> Bool {
        return text.count >= minCharacterCount
    }
    
    @State private var isToggle: Bool = false
    
    public init(text: Binding<String>, placeholder: String, alertText: String, validText: String, characterCount: Int, backColor: Color, textColor: Color) {
        self._text = text
        self.placeholder = placeholder
        self.alertText = alertText
        self.validText = validText
        self.minCharacterCount = characterCount
        self.backColor = backColor
        self.textColor = textColor
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
                    
                    if isToggle {
                        TextField("", text: $text)
                            .padding(.leading)
                            .font(.system(size: 15, weight: .bold))
                            .frame(height: 40)
                            .cornerRadius(10)
                            .offset(y: text.isEmpty ? 0 : 5)
                            .foregroundStyle(textColor)
                    } else {
                        SecureField("", text: $text)
                            .padding(.leading)
                            .font(.system(size: 15, weight: .bold))
                            .frame(height: 40)
                            .cornerRadius(10)
                            .offset(y: text.isEmpty ? 0 : 5)
                            .foregroundStyle(textColor)
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
                    .padding(.horizontal, 15)
                    .font(.system(size: text.isEmpty ? 15 : 10, weight: .bold))
                    .foregroundColor(isValid() || text.isEmpty ? Color.gray : Color.red)
                    .offset(y: text.isEmpty ? 0 : -15)
                    .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
            }
            
            Text(isValid() ? validText : alertText)
                .foregroundColor(isValid() ? Color.green : Color.red)
                .font(.system(size: 13, weight: .medium))
                .frame(height: 20)
                .padding(.top, 2)
                .opacity(text.isEmpty ? 0 : 1)
                .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
                .animation(.easeInOut(duration: 0.2), value: isValid())
            
        }
    }
}

