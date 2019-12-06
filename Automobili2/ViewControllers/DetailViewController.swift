//
//  DetailViewController.swift
//  Automobili2
//
//  Created by Pejo on 7/29/19.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit




class DetailViewController: UIViewController,ManageCarsDelegate {
    
    var car: Car?
    
    func didEditCar(car: Car) {
        carNameLabel.text = car.name
        carImageView.image = car.image
        carModelLabel.text = car.model
        if let _age = car.age {
            carAgeLabel.text = String(_age)
        }
        if let _price = car.price {
            carPriceLabel.text = String(_price)
        }
        
    }
    
    lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        return stackView
        
    }()
    
    lazy var carImageView: UIImageView = {
        let carImageView = UIImageView()
        carImageView.image = car?.image
        carImageView.contentMode = .scaleAspectFit
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.contentMode = .scaleAspectFit
        return carImageView
    }()
    
    lazy var carNameLabel: UILabel = {
        let label = UILabel()
        let prefix = "Name:"
        if let _name = car?.name {
            label.text = String("\(prefix) \(_name)")
        } else {
            label.text = "\(prefix) No name assigned"
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var carModelLabel: UILabel = {
        
        let label = UILabel()
        let prefix = "Model:"
        if let _model = car?.model {
            label.text = String("\(prefix) \(_model)")
        } else {
            label.text = "\(prefix) No model assigned"
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var carAgeLabel: UILabel = {
        
        let label = UILabel()
        let prefix = "Age:"
        if let _age = car?.age {
            label.text = String("\(prefix) \(_age)")
        } else {
            label.text = "\(prefix) No age assigned"
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    
    
    lazy var carPriceLabel: UILabel = {
        
        let label = UILabel()
        let prefix = "Price:"
        if let _price = car?.price {
            label.text = String("\(prefix) \(_price)")
        } else {
            label.text = "\(prefix) No price assigned"
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.view.backgroundColor = UIColor.customLightBlueColor
        
        view.addSubview(mainStackView)
        view.addSubview(carImageView)
        view.addSubview(carNameLabel)
        view.addSubview(carModelLabel)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action:  #selector(self.didTapEdit(sender:)))
        let topMainStacViewAnchor = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        let leftMainStacViewAnchor = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        let rightMainStacViewAnchor = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        NSLayoutConstraint.activate([topMainStacViewAnchor,leftMainStacViewAnchor,rightMainStacViewAnchor])
        
        
        let carImageViewTop = carImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        let carImageViewWidth = carImageView.widthAnchor.constraint(equalToConstant: 400)
        let carImageViewHeight = carImageView.heightAnchor.constraint(equalToConstant: 500)
        NSLayoutConstraint.activate([carImageViewWidth,carImageViewHeight,carImageViewTop])
        mainStackView.addArrangedSubview(carImageView)
        
        
        let carNameLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        let carNameLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        let carNameLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        NSLayoutConstraint.activate([carNameLabelTop,carNameLabelLeft,carNameLabelright])
        mainStackView.addArrangedSubview(carNameLabel)
        
        
        let carModelLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        let carModelLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
        let carModelLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
        NSLayoutConstraint.activate([carModelLabelTop,carModelLabelLeft,carModelLabelright])
        mainStackView.addArrangedSubview(carModelLabel)
        
        
        mainStackView.addArrangedSubview(carAgeLabel)
        mainStackView.addArrangedSubview(carPriceLabel)
        
        //        let carAgeLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400)
        //        let carAgeLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)
        //        let carAgeLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 100)
        //        NSLayoutConstraint.activate([carAgeLabelTop,carAgeLabelLeft,carAgeLabelright])
        //        mainStackView.addArrangedSubview(carAgeLabel)
        
    }
    
    @objc func didTapEdit(sender: UIBarButtonItem) {
        let editCarVC = EditCarViewController()
        editCarVC.newCar = self.car
        editCarVC.manageCarsDelegate = self
        
        
        self.present(editCarVC, animated: true, completion: nil)
    }
    
    
}
