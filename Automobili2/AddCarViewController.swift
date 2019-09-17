//
//  AddCarViewController.swift
//  Automobili2
//
//  Created by Pejo on 8/19/19.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit

class AddCarViewController: UIViewController {
    
    var newCar: Car?
    
    
    
    lazy var profileImageView: UIImageView = {
        
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
        
    }()
    
    lazy var nameTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.contentMode = .scaleAspectFit
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(AddCarViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        return textField
        
    }()
    
    lazy var modelTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.contentMode = .scaleAspectFit
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(AddCarViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        return textField
        
    }()
    
    lazy var ageTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.contentMode = .scaleAspectFit
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(AddCarViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        return textField
      
    }()
    
    lazy var priceTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.contentMode = .scaleAspectFit
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(AddCarViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        return textField
        
    }()
    
    lazy var saveButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(self.action(sender:)), for: .touchUpInside)
        return button
        
    }()
    
    lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.center
        
        
        return stackView
        
    }()
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        switch textField {
        case nameTextField:
            newCar?.name = textField.text
        case modelTextField:
            newCar?.model = textField.text
//        case priceTextField:
//            newCar?.price = textField.text
//        case ageTextField:
//            newCar?.age = textField.text
        default:
            break
        }
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newCar = Car (name: nil, price: nil, age: nil, model: nil, imageName: nil)
        
        self.view.backgroundColor = .orange
        
        view.addSubview(mainStackView)
        
        let topMainStacViewAnchor = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        let leftMainStacViewAnchor = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        let rightMainStacViewAnchor = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        NSLayoutConstraint.activate([topMainStacViewAnchor,leftMainStacViewAnchor,rightMainStacViewAnchor])
        
        let heightprofileImageViewAnchor = profileImageView.heightAnchor.constraint(equalToConstant: 100)
        let widthprofileImageViewAnchor = profileImageView.widthAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([heightprofileImageViewAnchor,widthprofileImageViewAnchor])
        mainStackView.addArrangedSubview(profileImageView)
        
//        let nameFieldHeight = nameTextField.heightAnchor.constraint(equalToConstant: 31)
        let nameFieldWidth = nameTextField.widthAnchor.constraint(equalToConstant: 300)
        nameTextField.placeholder = "Name:"
        NSLayoutConstraint.activate([nameFieldWidth])
        mainStackView.addArrangedSubview(nameTextField)
        
    
        let modelFieldWidth = modelTextField.widthAnchor.constraint(equalToConstant: 300)
        modelTextField.placeholder = "Model:"
        NSLayoutConstraint.activate([modelFieldWidth])
        mainStackView.addArrangedSubview(modelTextField)
        
        
        let priceFieldWidth = priceTextField.widthAnchor.constraint(equalToConstant: 300)
        priceTextField.placeholder = "Price:"
        NSLayoutConstraint.activate([priceFieldWidth])
        mainStackView.addArrangedSubview(priceTextField)
        
        
        let ageFieldWidth = ageTextField.widthAnchor.constraint(equalToConstant: 300)
        ageTextField.placeholder = "Age:"
        NSLayoutConstraint.activate([ageFieldWidth])
        mainStackView.addArrangedSubview(ageTextField)
        
        
        let saveButtonWidth = saveButton.widthAnchor.constraint(equalToConstant: 300)
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .black
        NSLayoutConstraint.activate([saveButtonWidth])
        mainStackView.addArrangedSubview(saveButton)
    }
    
    @objc func action(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
