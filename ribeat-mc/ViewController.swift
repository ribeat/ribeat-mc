//
//  ViewController.swift
//  ribeat-mc
//
//  Created by Neamțu Ionuț-Roberto on 4/6/19.
//  Copyright © 2019 888 Funcional Monkeys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func addOrder() {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        var currentOffSet: CGFloat = 0
        for label in arrayOfOrders {
            label.frame.origin.x = currentOffSet
            currentOffSet = label.frame.origin.x + label.frame.size.width
            view.addSubview(label)
            let button = UIButton(frame: CGRect(x: label.frame.origin.x, y: label.frame.origin.y + label.frame.size.height - 50, width: label.frame.size.width, height: 50))
            button.backgroundColor = .green
            button.setTitle("Test Button", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//            button.isEnabled = true
            view.addSubview(button)
        }
    }
    
    var myLabel = Label(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 600)))

    
    
    var arrayOfOrders = [Label]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        
        arrayOfOrders.append(myLabel)
        
        addOrder()
        
       
        
    }
    @IBAction func panYellowView(sender: UIPanGestureRecognizer) {

        let translation = sender.translation(in: self.view)

        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)

        sender.setTranslation(CGPoint.zero, in: self.view)
        print("sdasd")

    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped ")
        let myLabel = Label(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 600)))
        arrayOfOrders.append(myLabel)
//        arrayOfOrders.popLast()
        addOrder()
    }


}

