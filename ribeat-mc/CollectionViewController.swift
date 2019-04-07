//
//  ViewController.swift
//  ribeat-mc
//
//  Created by Neamțu Ionuț-Roberto on 4/6/19.
//  Copyright © 2019 888 Funcional Monkeys. All rights reserved.
//

import UIKit
import Alamofire

class CollectionViewController: UICollectionViewController {
//    var data: [MemeModel] = [MemeModel(table: UITableView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)), button: UIButton(frame: CGRect(x: 10, y: 200, width: 200, height: 50))),
//    MemeModel(table: UITableView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)), button: UIButton(frame: CGRect(x: 10, y: 200, width: 200, height: 50))),
//    MemeModel(table: UITableView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)), button: UIButton(frame: CGRect(x: 10, y: 200, width: 200, height: 50))),
//    MemeModel(table: UITableView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)), button: UIButton(frame: CGRect(x: 10, y: 200, width: 200, height: 50)))]
    var data: [MemeModel] = [MemeModel]()
    var orders: [OrderModel] = []
    
    func addOrder() {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
    
        var currentOffSet: CGFloat = 0
        for label in arrayOfOrders {
            label.frame.origin.x = currentOffSet
            currentOffSet = label.frame.origin.x + label.frame.size.width
            self.view.addSubview(label)
            let button = UIButton(frame: CGRect(x: label.frame.origin.x, y: label.frame.origin.y + label.frame.size.height - 50, width: label.frame.size.width, height: 50))
            button.backgroundColor = .green
            button.setTitle("Test Button", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//            button.isEnabled = true
            self.view.addSubview(button)
        }
    }
    
    var myLabel = Label(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 600)))
    
    
    
    var arrayOfOrders = [Label]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrayOfOrders.append(myLabel)
        addOrder()
        
        Alamofire.request("http://192.168.86.188:8080/api/v1/orders?orderReady=0").responseString { response in
            
            //print ("\(response.result.value)")
            if let jsonData = response.result.value?.data(using: String.Encoding.utf8) {
                do {
                    self.orders = try JSONDecoder().decode([OrderModel].self, from: jsonData)
                } catch {
                    
                }

                for order in self.orders {
                    self.data.append(MemeModel(table: UITableView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)), button: UIButton(frame: CGRect(x: 10, y: 200, width: 200, height: 50))))
                }
                self.collectionView.reloadData()
            }
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.data.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        cell.buttonOutlet.backgroundColor = UIColor.blue
        cell.buttonOutlet.setTitle("Order ready", for: .normal)
        cell.buttonOutlet.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        cell.buttonOutlet.tag = self.indexRow
        cell.configure(with: data[indexPath.row], forOrder: self.orders[indexPath.row])
        
//        cell.addSubview(myLabel)
        // Configure the cell
        
        return cell
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped ")
        print(sender.tag)
//        let myLabel = Label(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 600)))
//        arrayOfOrders.append(myLabel)
        //        arrayOfOrders.popLast()
//        addOrder()
//        data.removeLast()
//        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//        self.data.remove(at: indexPath.row)
//        collectionView.deleteItems(at: [indexPath])
 //      print( self.data[sender.tag])
        
//      self.data.remove(at: sender.tag)
        
//      collectionView.deleteItems(at: [indexPath])
        collectionView.reloadData()
    }
    
    
}

