//
//  ViewController.swift
//  Cars
//
//  Created by Pejo on 7/8/19.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, ManageCarsDelegate , UISearchResultsUpdating, UISearchControllerDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text as NSString? else { return }
        filterCars = cars.filter { (car) -> Bool in
            guard let carName = car.name as NSString? else { return false }
            return (carName.range(of: searchString as String, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        }
        collectionView.reloadData()
        
    }
    
    
    func didRemoveCar(car: Car) {
        
        
        createAlert(title: "Do You Like Delete \(car.name ?? "this car")?", message: "Do you?", car: car)
        
        
        
        
    }
    
    
    
    func didAddCar(car: Car) {
        cars.append(car)
        collectionView.reloadData()
    }
    let search = UISearchController(searchResultsController: nil)
    
    
    let cellld = "cellld"
    var collectionView: UICollectionView!
    
    var isSearchActive = false
    
    var filterCars: [Car]!
    
    
    
    var cars = [Car(name: "Ferrari T8", price: 2500.00, age: 1999, model:"Alpina", imageName: "Ferrari T8"),
                Car(name: "Aston Martin DB11", price: 20.30, age: 1999, model:"Alpina", imageName: "Aston Martin DB11"),
                Car(name: "Cadillac Fleetwood", price: 20.30, age: 1999, model:"Alpina", imageName: "Cadillac Fleetwood"),
                Car(name: "Bentley", price: 20.30, age: 1999, model:"Alpina", imageName: "Bentley"),
                Car(name: "BMW Alpina B10", price: 20.30, age: 1999, model:"Alpina", imageName: "BMW Alpina B10."),
                Car(name: "Alfa Romeo", price: 20.30, age: 1999, model:"Alpina", imageName: "Alfa Romeo"),
                Car(name: "Audi", price: 20.30, age: 1999, model:"Alpina", imageName: "Audi"),
                Car(name: "Chrysler Fifth Avenue", price: 20.30, age: 1999, model:"Alpina", imageName: "Chrysler Fifth Avenue"),
                Car(name: "Jaguar", price: 20.30, age: 1999, model:"Alpina", imageName: "Jaguar"),
                Car(name: "Jeep.", price: 20.30, age: 1999, model:"Alpina", imageName: "Jeep."),
                Car(name: "Lamborghini", price: 20.30, age: 1999, model:"Alpina", imageName: "Lamborghini"),
                Car(name: "Land Rover", price: 20.30, age: 1999, model:"Alpina", imageName: "Land Rover"),
                Car(name: "Lexus", price: 20.30, age: 1999, model:"Alpina", imageName: "Lexus"),
                Car(name: "Maserati", price: 20.30, age: 1999, model:"Alpina", imageName: "Maserati"),
                Car(name: "Mercedes-Benz W124 E60 AMG", price: 20.30, age: 1999, model:"Alpina", imageName: "Mercedes-Benz W124 E60 AMG"),
                Car(name: "Porsche", price: 20.30, age: 1999, model:"Alpina", imageName: "Porsche"),
                Car(name: "Rolls Royce", price: 20.30, age: 1999, model:"Alpina", imageName: "Rolls Royce"),
                Car(name: "Volkswagen Golf", price: 20.30, age: 1999, model:"Alpina", imageName: "Volkswagen Golf")
    ]
    
    func layoutCollectionView() {
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let trailing = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        let leading = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        let top = collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        let bottom = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([trailing,leading,top,bottom])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterCars = []
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
        search.delegate = self
        search.searchBar.delegate = self
        
        let flowelayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowelayout)
        
        layoutCollectionView()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self 
        
        
        collectionView.backgroundColor = UIColor.customLightBlueColor
        
        navigationController?.navigationBar.topItem?.title = "Car"
        navigationController?.navigationBar.barTintColor = UIColor.customRedColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        navigationController?.navigationBar.tintColor = .white
        
        collectionView.register(CarCollectionViewCell.self, forCellWithReuseIdentifier: cellld)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(self.action(sender:)))
        
    }
    
    @objc func action(sender: UIBarButtonItem) {
        let addCarViewController = AddCarViewController()
        addCarViewController.manageCarsDelegate = self
        self.present(addCarViewController, animated: true, completion: nil)
        
    }
    
    
    
    func createAlert (title:String, message:String, car:Car)
    {
        
        
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            
            self.deleteThis(car: car)
            alert.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancle", style: UIAlertAction.Style.default, handler: { (action) in
            print("Cancle")
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    func deleteThis(car:Car)
    {
        if let index = cars.firstIndex(of: car) {
            
            cars.remove(at: index)
            let indexPath = IndexPath(item: index, section: 0)
            collectionView.deleteItems(at: [indexPath])
            
        }
    }
    func collectionView(_ _collectionView:UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        if isSearchActive {
        //           return filterCars.count
        //        }
        //
        //        return cars.count
        let count = isSearchActive ? filterCars.count : cars.count
        return count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellld, for: indexPath) as! CarCollectionViewCell
        if isSearchActive {
            cell.car = filterCars[indexPath.item]
        } else {
            cell.car = cars[indexPath.item]
        }
        cell.manageCarsDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.car = cars[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 16, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt
        section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
    }
    
    
}
extension CarsViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //        search(shouldShow: false)
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearchActive = true
        collectionView.reloadData()
        
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearchActive = false
        collectionView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
