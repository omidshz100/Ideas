//
//  TokenView.swift
//  Ideas
//
//  Created by Omid Shojaeian Zanjani on 10/02/25.
//

import Foundation
import SwiftUI

public struct TokenizerView: View {
    @StateObject private var vm = TokenizerViewModel()
    @FocusState private var isFocused: Bool
    
    public init() {}

    public var body: some View {
        List {
            inputSection
            if vm.output != nil {
                outputSection
            }
        }
        .navigationTitle("GPT Tokenizer")
    }
    
    private var inputSection: some View {
        Section("Input") {
            TextField("Enter text to tokenize", text: $vm.inputText, axis: .vertical)
                .focused($isFocused)
                .lineLimit(4...12)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") { isFocused = false }
                    }
                }
            
            HStack {
                Button("Clear") {
                    withAnimation { vm.inputText = "" }
                }
                .buttonStyle(.borderedProminent)
                .disabled(vm.inputText.isEmpty)
                
                Button("Show example") {
                    withAnimation {
                        vm.inputText = exampleText
                        isFocused = false
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(vm.inputText == exampleText)
                
                Spacer()
                
                if vm.isTokenizing {
                    ProgressView()
                }
            }
            .padding(.vertical, 2)
        }
    }
    
    private var outputSection: some View {
        Section {
            VStack(alignment: .leading) {
                tokenInfo
                Picker("Output Type", selection: $vm.outputType) {
                    Text("Text").tag(OutputType.text)
                    Text("Token Ids").tag(OutputType.tokenIds)
                }
                .pickerStyle(.segmented)
                
                outputContent
            }
        } footer: {
            Text(footerText).padding(.top, 8)
        }
        
        
        
    }
    
    private var tokenInfo: some View {
        HStack {
            infoBlock(title: "Tokens", value: "\(vm.output?.tokens.count ?? 0)")
            Divider().frame(height: 32)
            infoBlock(title: "Characters", value: "\(vm.output?.text.count ?? 0)")
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private func infoBlock(title: String, value: String) -> some View {
        VStack {
            Text(title).font(.subheadline)
            Text(value).font(.headline)
        }
    }
    
    @ViewBuilder
    private var outputContent: some View {
        switch vm.outputType {
        case .text:
            TextView(output: vm.output!)
                .frame(height: 240)
        case .tokenIds:
            Text(vm.output!.tokens.description)
                .textSelection(.enabled)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
        }
    }
}
