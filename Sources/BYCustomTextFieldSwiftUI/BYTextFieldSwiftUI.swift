//
//  BYTextFieldSwiftUI.swift
//  BYTextField
//
//  Created by Bayram Yeleç on 21.02.2025.
//

import SwiftUI
import Combine

public struct BYTextFieldSwiftUI: View {
    
    @Binding var text: String
    let placeholder: String
    var alertText: String
    var validText: String
    var characters: [String]
    
    var backColor: Color
    var textColor: Color
    
    var leftIcon: String
    var leftIconColor: Color
    
    func isValid() -> Bool {
        guard !characters.isEmpty else { return true }
        return characters.allSatisfy { text.contains($0) }
    }
    
    @State private var displayValidText: String = ""
    
    public init(text: Binding<String>, placeholder: String, alertText: String = "", validText: String = "", characters: [String] = [], backColor: Color = .gray.opacity(0.2), textColor: Color = .black, leftIcon: String = "", leftIconColor: Color = .gray) {
        self._text = text
        self.placeholder = placeholder
        self.alertText = alertText
        self.validText = validText
        self.characters = characters
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
                    
                    Spacer()
                    
                    if !characters.isEmpty {
                        Button(action: {}) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color.red)
                                .opacity(!isValid() && !text.isEmpty ? 1 : 0)
                                .animation(.easeInOut(duration: 0.2), value: isValid())
                                .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
                        }
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
            
            if !characters.isEmpty {
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
}
