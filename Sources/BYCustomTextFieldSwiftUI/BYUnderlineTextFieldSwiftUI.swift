//
//  BYUnderineTextFieldSwiftUI.swift
//  BYTextField
//
//  Created by Bayram Yeleç on 21.02.2025.
//

import SwiftUI
import Combine

public struct BYUnderlineTextFieldSwiftUI: View {
    @Binding var text: String
    let placeholder: String
    var alertText: String
    var validText: String
    let characters: [String]
    
    var backColor: Color
    var textColor: Color
    var underLineColor: Color
    var leftIcon: String
    
    func isValid() -> Bool {
        guard !characters.isEmpty else { return true }
        return characters.allSatisfy { text.contains($0) }
    }
    
    @State private var displayValidText: String = ""
    
    public init(text: Binding<String>, placeholder: String, alertText: String = "", validText: String = "", characters: [String] = [], backColor: Color = .gray.opacity(0.0), textColor: Color = .black, underLineColor: Color = .gray, leftIcon: String = "") {
        self._text = text
        self.placeholder = placeholder
        self.alertText = alertText
        self.validText = validText
        self.characters = characters
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
                    
                    TextField("", text: $text)
                        .padding(.leading, 5)
                        .font(.system(size: 15, weight: .bold))
                        .frame(height: 20)
                        .cornerRadius(10)
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

