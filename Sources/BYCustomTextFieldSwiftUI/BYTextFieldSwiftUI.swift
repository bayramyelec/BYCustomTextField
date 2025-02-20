//
//  SwiftUIView.swift
//  BYCustomTextField
//
//  Created by Bayram Yeleç on 20.02.2025.
//

import SwiftUI

public struct BYTextFieldSwiftUI: View {
    
    @Binding var text: String
    let placeholder: String
    var alertText: String
    var validText: String
    let characters: [String]
    
    var backColor: Color
    var textColor: Color
    
    func isValid() -> Bool {
        guard !characters.isEmpty else { return true }
        return characters.allSatisfy { text.contains($0) }
    }
    
    
    
    public init(text: Binding<String>, placeholder: String, alertText: String, validText: String, characters: [String], backColor: Color, textColor: Color) {
        self._text = text
        self.placeholder = placeholder
        self.alertText = alertText
        self.validText = validText
        self.characters = characters
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
                    TextField("", text: $text)
                        .padding(.leading)
                        .font(.system(size: 15, weight: .bold))
                        .frame(height: 40)
                        .cornerRadius(10)
                        .offset(y: text.isEmpty ? 0 : 5)
                        .foregroundStyle(textColor)
                    
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
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.gray)
                    }
                    .padding(.trailing)
                }
                
                Text(placeholder)
                    .padding(.horizontal, 15)
                    .font(.system(size: text.isEmpty ? 15 : 10, weight: .bold))
                    .foregroundColor(isValid() || text.isEmpty ? Color.gray : Color.red)
                    .offset(y: text.isEmpty ? 0 : -15)
                    .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
            }
            
            if !characters.isEmpty {
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
}

