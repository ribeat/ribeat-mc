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
    let data: [MemeModel] = [MemeModel(table: UITableView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)), button: UIButton(frame: CGRect(x: 10, y: 200, width: 200, height: 50)))]
    
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
        
        Alamofire.request("http://192.168.86.188:8080/api/v1/orders?orderReady=0").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        collectionView.register(UINib.init(nibName: "MemeCell", bundle: nil), forCellWithReuseIdentifier: "MemeCell")
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        cell.configure(with: data[indexPath.row])
//        cell.addSubview(myLabel)
        // Configure the cell
        return cell
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped ")
        let myLabel = Label(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 600)))
        arrayOfOrders.append(myLabel)
        //        arrayOfOrders.popLast()
        addOrder()
        print("sasda")
    }
    
    
}

