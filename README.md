# HAMKeyboard

# Used:

    let textField: UITextField = UITextField(frame: .zero)
    let keyboardView = HAMKeyboard()
    keyboardView.delegate = self
    textField.inputView = keyboardView


# Call back:

    extension ViewController: HAMKeyboardDelegate {
        func keyboardShouldReturn(_ keyboard: HAMKeyboard) {
            
        }
        
        func keyboard(_ keyboard: HAMKeyboard, string: String) {
            textField.insertText(string)
        }
        
        func keyboardShouldReturnDelete(_ keyboard: HAMKeyboard) {
            textField.deleteBackward()
        }
        
        func keyboardShouldReturnCancel(_ keyboard: HAMKeyboard) {
            self.view.endEditing(true)
        }
    }
