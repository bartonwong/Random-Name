//
//  ViewController.swift
//  Random Name
//
//  Created by Ngo Hay Barton Wong on 24/10/2017.
//  Copyright © 2017 Ngo Hay Barton Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var nameList = ""
    var counter = 0
    var name = [String]()
    
    @IBOutlet weak var titleName: UILabel!
    //@IBOutlet weak var nameView: UITextView!
    @IBOutlet weak var nameView: UITextView!
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func removeName(_ sender: UIButton) {
        if (nameField.text != ""){
            if let index = name.index(of: nameField.text!){
                name.remove(at: index)
                nameList = ""
                for word in name {
                    nameList = nameList + word + "\n"
                }
                nameView.text = nameList
                nameField.text = ""
                counter = counter - 1
            }
        }
    }
    @IBAction func random(_ sender: UIButton) {
        if counter > 0 {
            let random = uint(counter)
            let randomPosition = arc4random_uniform(random)
            titleName.text = name[Int(randomPosition)]
        }
        
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        nameList = ""
        nameView.text = nameList
        counter = 0
        name.removeAll()
        nameField.text = ""
        titleName.text = "Random Name"
    }
    
    @IBAction func addName(_ sender: UIButton) {
        if (nameField.text != ""){
            nameList = nameList + nameField.text! + "\n"
            name.append(nameField.text!)
            counter = counter + 1
            nameView.text = nameList
            nameField.text = ""
            nameField.endEditing(true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

