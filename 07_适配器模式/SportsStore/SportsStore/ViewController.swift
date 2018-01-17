//
//  ViewController.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/18.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var totalStockLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let productStore:ProductDataStore = ProductDataStore()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayStockTotal()
        
        ////假请求
        productStore.callBack = { (product:Product) in
            self.tableView.visibleCells.forEach({ [weak self] (cell) in
                if let pcell = cell as? ProductTableViewCell,
                    let cellProduct = pcell.product{
                    
                    if cellProduct.name == product.name{
                        pcell.stockStepper.value = Double(product.stockLevel)
                        pcell.stockField.text = "\(product.stockLevel)"
                    }
                }
            })
            
            self.displayStockTotal()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productStore.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else { return ProductTableViewCell() }
        
        let product = productStore.products[indexPath.row]
        
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.description
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockField.text = "\(product.stockLevel)"
        cell.product = product
        return cell
        
    }
    
    @IBAction func stockLebelDidChange(_ sender: Any) {
        if var currentCell = sender as? UIView {
            while (true) {
                currentCell = currentCell.superview!
                if let cell = currentCell as? ProductTableViewCell {
                    if let product = cell.product {
                        if let stepper = sender as? UIStepper {
                            product.stockLevel = Int(stepper.value)
                        } else if let textfield = sender as? UITextField {
                            if let newValue = textfield.text {
                                product.stockLevel = Int(newValue)!
                            }
                        }
                        
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockField.text = String(product.stockLevel)
                        Logger.shared.logItem(product)
                    }
                    break;
                }
            }
            displayStockTotal();
        }
    }
    
    
    
    func displayStockTotal() {
//        let stockTotal = products.reduce(0) { (total, product) -> Int in
//            return total + product.stockLevel
//        }
        
        let finalTotals:(Int,Double) = productStore.products.reduce((0,0.0)) { (totals, product) -> (Int,Double) in
            return (
                totals.0 + product.stockLevel,
                totals.1 + product.stockValue
            )
        }
        
        let factory = StockTotalFactory.getFactory(curr: .other)
        guard let totalAmount = factory.converter?.convertTotal(finalTotals.1),
            let formatted = factory.formatter?.formatTotal(totalAmount) else { return }
        
        totalStockLabel.text = "\(finalTotals.0) Products in Stock." + "Total value:\(formatted)"
    }
}

