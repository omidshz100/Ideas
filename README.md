# TokenizerView - GPT Tokenizer

## Overview
TokenizerView is a SwiftUI-based component for tokenizing text input using GPT-based tokenization. The view allows users to enter text, process it, and view the tokenized output in different formats.

## Features
- **Text Input**: Users can enter text to be tokenized.
- **Example Text**: Provides a sample input for demonstration.
- **Clear Functionality**: Users can clear the text input.
- **Output Format Selection**: Users can switch between text representation and token IDs.
- **Live Tokenization**: Displays token and character counts dynamically.

## UI Components
### Input Section
```swift
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
```
- Provides a `TextField` for user input.
- Includes buttons to clear the text or insert an example.
- Displays a loading indicator when processing tokens.

### Output Section
```swift
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
```
- Displays tokenized output in text or token ID format.
- Provides a segmented picker to switch between output types.

### Token Information
```swift
private var tokenInfo: some View {
    HStack {
        infoBlock(title: "Tokens", value: "\(vm.output?.tokens.count ?? 0)")
        Divider().frame(height: 32)
        infoBlock(title: "Characters", value: "\(vm.output?.text.count ?? 0)")
    }
    .frame(maxWidth: .infinity, alignment: .center)
}
```
- Displays the number of tokens and characters processed.

### Output Content
```swift
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
```
- Displays tokenized output in a `TextView` for text format or a `Text` view for token IDs.

## Dependencies
- **SwiftUI**: Used for UI layout and interactions.
- **Foundation**: Provides data processing utilities.

## Future Enhancements
- Implement customizable tokenization settings.
- Allow exporting tokenized data.
- Enhance UI with real-time updates.

## Author
**Omid Shojaeian Zanjani**  
Created on **February 10, 2025**

