//
//  BYUnderlineSecurityTextFieldSwiftUI.swift
//  BYTextField
//
//  Created by Bayram Yeleç on 21.02.2025.
//

import SwiftUI
import Combine

public struct BYUnderlineSecurityTextFieldSwiftUI: View {
    @Binding var text: String
    let placeholder: String
    var alertText: String
    var validText: String
    let minCharacterCount: Int
    
    var backColor: Color
    var textColor: Color
    var underLineColor: Color
    var leftIcon: String
    
    func isValid() -> Bool {
        return text.count >= minCharacterCount
    }
    
    @State private var isToggle: Bool = false
    
    @State private var displayValidText: String = ""
    
    public init(text: Binding<String>, placeholder: String, alertText: String = "", validText: String = "", minCharacterCount: Int = 0, backColor: Color = .gray.opacity(0.0), textColor: Color = .black, underLineColor: Color = Color.gray, leftIcon: String = "") {
        self._text = text
        self.placeholder = placeholder
        self.alertText = alertText
        self.validText = validText
        self.minCharacterCount = minCharacterCount
        self.backColor = backColor
        self.textColor = textColor
        self.underLineColor = underLineColor
        self.leftIcon = leftIcon
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 0)
                    .fill(backColor)
                    .frame(height: 50)
                
                HStack {
                    Image(systemName: leftIcon)
                        .foregroundColor(isValid() || text.isEmpty ? underLineColor : Color.red)
                    
                    if isToggle {
                        TextField("", text: $text)
                            .padding(.leading, 5)
                            .font(.system(size: 15, weight: .bold))
                            .frame(height: 40)
                            .cornerRadius(10)
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
                    .padding(.horizontal, leftIcon.isEmpty ? 15 : 30)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(isValid() || text.isEmpty ? Color.gray : Color.red)
                    .opacity(text.isEmpty ? 1 : 0)
            }
            
            RoundedRectangle(cornerRadius: 0)
                .stroke(isValid() || text.isEmpty ? underLineColor : Color.red, lineWidth: 1)
                .frame(height: 1)
                .animation(.easeInOut(duration: 0.2), value: isValid())
                .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
            
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

