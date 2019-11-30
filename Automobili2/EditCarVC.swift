//
//  EditCarVC.swift
//  Automobili2
//
//  Created by Pejo on 24/11/2019.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit





class EditCarViewController: UIViewController {
    
    var newCar: Car?
    
    let profileImageViewWidth: CGFloat = 100
    
    weak var manageCarsDelegate: ManageCarsDelegate?
    
    
    func upadateButtonState () {
        
        var enableButton = false
        
        if (newCar?.name != nil && newCar?.name! != "") && newCar?.price != nil && (newCar?.model != nil && newCar?.model! != "") && newCar?.age != nil {
            enableButton = true
        }
        
        if enableButton == true {
            saveButton.isEnabled = true
            saveButton.alpha = 1
        }else {
            saveButton.isEnabled = false
            saveButton.alpha = 0.5
            
        }
        
    }
    
    
    
    
    lazy var profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = profileImageViewWidth / 2
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    
    
    @objc fileprivate func profileImageButtonTapped() {
        print("Tapped profile image button")
        
        showImagePickerControllerActionSheet()
    }
    
    
    
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
        button.addTarget(self, action:#selector(self.didTapSave(sender:)), for: .touchUpInside)
        return button
        
    }()
    
    lazy var addImageButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFit
        button.layer.cornerRadius = profileImageViewWidth / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
        button.backgroundColor = .clear
        
        return button
        
    }()
    
    lazy var closeButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action:#selector(self.didTapClose(sender:)), for: .touchUpInside)
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
            
        case priceTextField:
            if let _validText = textField.text, let _price = Double(_validText) {
                newCar?.price = _price
            } else {
                newCar?.price = nil
            }
        case ageTextField:
            if let _validText = textField.text, let _age = Int(_validText) {
                newCar?.age = _age
            } else {
                newCar?.age = nil
            }
        default:
            break
        }
        
        upadateButtonState()
    }
    
    private func setupFields() {
        
        profileImageView.image = newCar?.image
        nameTextField.text = newCar?.name
        modelTextField.text = newCar?.model
        if let _age = newCar?.age {
                   ageTextField.text = String(_age)
               }
        
        if let _price = newCar?.price {
            priceTextField.text = String(_price)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upadateButtonState ()
        setupFields()
        
        self.view.backgroundColor = UIColor.customLightBlueColor
        
        
        
        
        view.addSubview(profileImageView)
        view.addSubview(addImageButton)
        
        view.addSubview(mainStackView)
        
        
        
        
        let topMainStacViewAnchor = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        let leftMainStacViewAnchor = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        let rightMainStacViewAnchor = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        NSLayoutConstraint.activate([topMainStacViewAnchor,leftMainStacViewAnchor,rightMainStacViewAnchor])
        
        let heightprofileImageViewAnchor = profileImageView.heightAnchor.constraint(equalToConstant: 100)
        let widthprofileImageViewAnchor = profileImageView.widthAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([heightprofileImageViewAnchor,widthprofileImageViewAnchor])
        mainStackView.addArrangedSubview(profileImageView)
        
        
        view.addSubview(closeButton)
        
        let topcloseButtonAnchor = closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        let rightcloawButtonAnchor = closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        let heightcloseButtonAnchor = closeButton.heightAnchor.constraint(equalToConstant: 30)
        let widthcloseButtonAnchor = closeButton.widthAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([topcloseButtonAnchor,rightcloawButtonAnchor,heightcloseButtonAnchor,widthcloseButtonAnchor])
        
        
        
        let addImageButtonAnchorHaight = addImageButton.heightAnchor.constraint(equalToConstant: 20)
        let addImageButtonAnchorWidth = addImageButton.widthAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([addImageButtonAnchorHaight,addImageButtonAnchorWidth])
        
        mainStackView.addArrangedSubview(addImageButton)
        
        //        let nameFieldHeight = nameTextField.heightAnchor.constraint(equalToConstant: 31)
        let nameFieldWidth = nameTextField.widthAnchor.constraint(equalToConstant: 300)
        let nameFieldHeight = nameTextField.heightAnchor.constraint(equalToConstant: 38)
        nameTextField.placeholder = "Name:"
        NSLayoutConstraint.activate([nameFieldWidth,nameFieldHeight])
        mainStackView.addArrangedSubview(nameTextField)
        
        
        let modelFieldHeight = modelTextField.heightAnchor.constraint(equalToConstant: 38)
        let modelFieldWidth = modelTextField.widthAnchor.constraint(equalToConstant: 300)
        modelTextField.placeholder = "Model:"
        NSLayoutConstraint.activate([modelFieldHeight,modelFieldWidth])
        mainStackView.addArrangedSubview(modelTextField)
        
        
        let priceFieldWidth = priceTextField.widthAnchor.constraint(equalToConstant: 300)
        let priceFieldHeight = priceTextField.heightAnchor.constraint(equalToConstant: 38)
        priceTextField.placeholder = "Price:"
        NSLayoutConstraint.activate([priceFieldWidth,priceFieldHeight])
        mainStackView.addArrangedSubview(priceTextField)
        
        
        let ageFieldWidth = ageTextField.widthAnchor.constraint(equalToConstant: 300)
        let ageFieldHeight = ageTextField.heightAnchor.constraint(equalToConstant: 38)
        ageTextField.placeholder = "Age:"
        NSLayoutConstraint.activate([ageFieldWidth,ageFieldHeight])
        mainStackView.addArrangedSubview(ageTextField)
        
        
        let saveButtonWidth = saveButton.widthAnchor.constraint(equalToConstant: 300)
        let saveButtondHeight = saveButton.heightAnchor.constraint(equalToConstant: 40)
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .black
        NSLayoutConstraint.activate([saveButtonWidth,saveButtondHeight])
        mainStackView.addArrangedSubview(saveButton)
        
        
        
        let closeButtonWidth = closeButton.widthAnchor.constraint(equalToConstant: 300)
        closeButton.setTitle("Close", for: .normal)
        NSLayoutConstraint.activate([closeButtonWidth])
        
        let addImageButtonWidth = addImageButton.widthAnchor.constraint(equalToConstant: 300)
        addImageButton.setTitle("add", for: .normal)
        NSLayoutConstraint.activate([addImageButtonWidth])
        
        
    }
    
    @objc func didTapSave(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        if let _newCar = newCar {
            manageCarsDelegate?.didEditCar?(car: _newCar )
        }
        
    }
    
    @objc func didTapClose(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
}
extension EditCarViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerControllerActionSheet() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a Source ", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController,animated: true, completion: nil)
            }else {
                print("Camera not availabel")
            }
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController,animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
        
        self.present(actionSheet,animated: true, completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let editingImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImageView.image = editingImage
        newCar?.image = editingImage
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}

