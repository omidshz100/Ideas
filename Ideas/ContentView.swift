//
//  ContentView.swift
//  Ideas
//
//  Created by Omid Shojaeian Zanjani on 10/02/25.
//

import SwiftUI
// 
struct ContentView: View {
    var body: some View {
        TokenizerView()
    }
}

let exampleText = """
    Many words map to one token, but some don't: indivisible.

    Unicode characters like emojis may be split into many tokens containing the underlying bytes: 🤚🏾

    Sequences of characters commonly found next to each other may be grouped together: 1234567890
"""

let footerText = """
    The GPT family of models process text using tokens, which are common sequences of characters found in text. 
    The models understand the statistical relationships between these tokens and excel at producing the next token in a sequence.

    You can use this tool to understand how a piece of text would be tokenized by the API and the total count of tokens in that text.

    A helpful rule of thumb is that one token generally corresponds to ~4 characters of text for common English text. 
    This translates to roughly ¾ of a word (so 100 tokens ≈ 75 words).
"""

#Preview {
    ContentView()
}
