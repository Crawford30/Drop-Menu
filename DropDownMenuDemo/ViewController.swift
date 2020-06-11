//
//  ViewController.swift
//  DropDownMenuDemo
//
//  Created by JOEL CRAWFORD on 6/10/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    private let myCategoryArray: Array = ["Agri Business","Animal Care","Beauty", "Bussiness Support", "cleaning", "compound"]
    
    private let myServicesArray: Array = ["Farm Management", "Gardeneing", "Irrigation", "Pest Control", "Poultry Keeping", "Soil Sampling", "Animal Farm Management", "Animal shelter Construction", "Dog Training", "Pet Care", "Vertenary Services", "Zoo Keeper", "Agri Business","Animal Care","Beauty", "Bussiness Support", "cleaning", "compound","Agri Business","Animal Care","Beauty", "Bussiness Support", "cleaning", "compound"]
    
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var serviceUnderCatLabel: UILabel!
    
    var tapStart: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        categoryLabel.isUserInteractionEnabled = true
        
        serviceUnderCatLabel.isUserInteractionEnabled = true
        
        
        categoryLabel.layer.cornerRadius = 8.0
        
        categoryLabel.layer.masksToBounds = true
        
        serviceUnderCatLabel.layer.cornerRadius = 8.0
        
        serviceUnderCatLabel.layer.masksToBounds = true
        
    }
    
    
    
    @IBAction func onCategoryTapped(_ sender: UITapGestureRecognizer) {
        
        
        print("Category tapped")
        
        prepDropDownMenu()
        
        
        
        let array = Utilities.categoryArray()
        
        print(array)
        
    }
    
    
    
    @IBAction func onServUnderCatTapped(_ sender: UITapGestureRecognizer) {
        
         print("Service tapped")
        
                prepDropDownMenu()
        
    
    }
    
    

    
    
    
    
    func prepDropDownMenu() {
        
        let tempView: UIView     = UIView.init()    // Fill screen with invisible view to disable taps in back
        tempView.tag             = 1000
        tempView.frame           = self.view.frame
        tempView.backgroundColor = UIColor.clear
        self.view.addSubview( tempView )
        
        var myTableView: UITableView!
        
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 0 , width: Int(tempView.frame.size.width), height: Int(tempView.frame.size.height)))
        
        
        
        if !tapStart {
            
            myTableView.frame.origin.x = tempView.frame.origin.x + categoryLabel.frame.origin.x
            
            myTableView.frame.origin.y = tempView.frame.origin.y + categoryLabel.frame.origin.y + categoryLabel.frame.size.height
            
           
            
        } else {
            
            
            myTableView.frame.origin.x = tempView.frame.origin.x + serviceUnderCatLabel.frame.origin.x
            
            myTableView.frame.origin.y = tempView.frame.origin.y + serviceUnderCatLabel.frame.origin.y + serviceUnderCatLabel.frame.size.height
            
            
            
        }
        
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        tempView.addSubview(myTableView)
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myServicesArray[indexPath.row])")
        
        
        if !tapStart {
            
            categoryLabel.text! =  myServicesArray[indexPath.item]
            
            tapStart = true
            
           
            
        }
        else {
            
            serviceUnderCatLabel.text! =  myServicesArray[indexPath.item]
            
            
        }
        
        
        //categoryLabel.text! =  myServicesArray[indexPath.item]
        
        self.view.viewWithTag(1000)?.removeFromSuperview()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myServicesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myServicesArray[indexPath.row])"
        return cell
    }

    
}




























//@IBDesignable class PaddingLabel: UILabel {
//
//    @IBInspectable var topInset: CGFloat = 5.0
//    @IBInspectable var bottomInset: CGFloat = 5.0
//    @IBInspectable var leftInset: CGFloat = 7.0
//    @IBInspectable var rightInset: CGFloat = 7.0
//
//    override func drawText(in rect: CGRect) {
//        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
//
//        super.drawText(in: rect.inset(by: insets))
//
//
//    }
//
//    override var intrinsicContentSize: CGSize {
//
//        let size = super.intrinsicContentSize
//
//        return CGSize(width: size.width + leftInset + rightInset, height: size.height + topInset + bottomInset)
//    }
//
//
//    override  var bounds: CGRect {
//        didSet {
//            //ensure this works within stack views if multiple lines
//
//            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
//        }
//
//    }
//
//
//}
