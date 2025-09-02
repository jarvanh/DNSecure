//
//  LazyTextField.swift
//  DNSecure
//
//  Created by Kenta Kubo on 4/25/23.
//

import SwiftUI

struct LazyTextField {
    private let title: String
    @Binding private var text: String
    @State private var localText: String
    @FocusState private var isFocused

    init(_ title: some StringProtocol, text: Binding<String>) {
        self.title = String(title)
        self._text = text
        self._localText = .init(initialValue: text.wrappedValue)
    }
}

extension LazyTextField: View {
    var body: some View {
        HStack {
            TextField(self.title, text: self.$localText)
                .focused(self.$isFocused)
            if self.isFocused && !self.localText.isEmpty {
                Button("Clear", systemImage: "xmark.circle.fill") {
                    self.text.removeAll()
                    self.localText.removeAll()
                }
                .foregroundStyle(Color.primary)
                .opacity(0.2)
                .labelStyle(.iconOnly)
                .buttonStyle(.borderless)
                .hoverEffect()
            }
        }
        .onChange(of: self.isFocused) { isFocused in
            if !isFocused {
                self.text = self.localText
            }
        }
        .onChange(of: self.text) { text in
            self.localText = text
        }
    }
}

#Preview {
    LazyTextField("Name", text: .constant(""))
}
