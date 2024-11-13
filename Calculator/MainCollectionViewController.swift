//
//  MainCollectionViewController.swift
//  Calculator
//
//  Created by Chichek on 13.11.24.
//

import UIKit

class MainCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var myCollection: UICollectionView!
    var buttons = CalculatorStruct()
    var calculateElements = [String]()
    @IBOutlet var calculateAction: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        buttons.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        if let numbers = buttons.elements[indexPath.row]  as? Int {
            cell.myButton.setTitle(String(numbers), for: .normal)
            cell.tintColor = .darkGray
        } else if let operators = buttons.elements[indexPath.row] as? String {
            cell.myButton.setTitle(operators, for: .normal)
            cell.tintColor = .orange
        }
        
        cell.selectedElement = { [weak self] selectedIndex in
            if let buttonText = cell.myButton.titleLabel?.text {
                self?.calculateElements.append(buttonText)
                if cell.myButton.titleLabel?.text == "C" {
                    self?.calculateElements.removeAll()
                    self?.calculateAction.text?.removeAll()
                }
                else if buttonText == "=" {
                    self?.calculateAction.text = self?.evaluateExpression()
                    self?.calculateElements.removeAll()
                }
                else {
                    self?.calculateAction.text = self?.calculateElements.joined()
                }
            }
        }
        return cell
    }
    
    func evaluateExpression() -> String {
        var expression = calculateElements.filter { $0 != "=" }.joined()
        let calculation = NSExpression(format: expression)
        let result = calculation.expressionValue(with: nil, context: nil) as? NSNumber
        return result?.stringValue ?? ""

    }
}
