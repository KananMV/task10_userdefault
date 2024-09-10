//
//  ViewController.swift
//  task10_userdefault
//
//  Created by Kenan Memmedov on 08.09.24.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    private let savesLabel:UILabel = {
       let label = UILabel()
        label.text = "Last saved operation:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20,weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let textField1: UITextField = {
        var textfield = UITextField()
        textfield.keyboardType = .numberPad
        textfield.placeholder = "Text 1"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    private let textField2: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .numberPad
        textfield.placeholder = "Text 2"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    private let sumButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sum", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        return button
    }()
    private let sumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "The sum will appear here."
        label.font = .systemFont(ofSize: 25,weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGreen
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup(){
        view.backgroundColor = .white
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.addSubview(sumButton)
        view.addSubview(sumLabel)
        view.addSubview(saveButton)
        view.addSubview(savesLabel)
        textField1.delegate = self
        textField2.delegate = self
        savesLabel.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        textField1.snp.makeConstraints{make in
            make.top.equalTo(savesLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        textField2.snp.makeConstraints{make in
            make.top.equalTo(textField1.snp.bottom).offset(20)
            make.leading.equalTo(textField1.snp.leading)
            make.trailing.equalTo(textField1.snp.trailing)
        }
        sumButton.snp.makeConstraints{make in
            make.top.equalTo(textField2.snp.bottom).offset(20)
            make.leading.equalTo(textField1.snp.leading)
            make.trailing.equalTo(textField1.snp.trailing)
        }
        sumLabel.snp.makeConstraints{make in
            make.top.equalTo(sumButton.snp.bottom).offset(20)
            make.leading.equalTo(textField1.snp.leading)
            make.trailing.equalTo(textField1.snp.trailing)
        }
        sumButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        saveButton.snp.makeConstraints{make in
            make.top.equalTo(sumLabel.snp.bottom).offset(20)
            make.leading.equalTo(textField1.snp.leading)
            make.trailing.equalTo(textField2.snp.trailing)
        }
        saveButton.addTarget(self, action: #selector(savebuttonTapped), for: .touchUpInside)
    }
    @objc func buttonTapped(){
        if let text1 = textField1.text, let text2 = textField2.text,
           let number1 = Int(text1), let number2 = Int(text2) {
            let result = number1 + number2
            var results = UserDefaults.standard.array(forKey: "sumsave") as? [String] ?? [String]()
            sumLabel.text = "\(result)"
            results.append("\(result)")
            UserDefaults.standard.set(results, forKey: "sumsave")
        } else {
            sumLabel.text = "Please fill in both text fields."
        }
    }
    @objc func savebuttonTapped(){
        let results = UserDefaults.standard.array(forKey: "sumsave") as? [String] ?? [String]()
        if results.isEmpty == false{
            savesLabel.text = "Last saved operation: \(results.joined(separator: ","))"
        }else{
            savesLabel.text = "No operation saved"
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
extension ViewController: UITextFieldDelegate{
    
}

