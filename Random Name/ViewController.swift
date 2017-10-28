//
//  ViewController.swift
//  Random Name
//
//  Created by Ngo Hay Barton Wong on 24/10/2017.
//  Copyright © 2017 Ngo Hay Barton Wong. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var nameList = ""
    var counter = 0
    var name = [String]()
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var nameView: UITextView!
    @IBOutlet weak var nameField: UITextField!
    
    func addNameToField(){
        if let temp = nameField.text {
            nameList = nameList + temp + "\n"
            name.append(temp)
            counter = counter + 1
            nameView.text = nameList
            nameField.text = ""
            
        }
    }
    
    @IBAction func primaryAction(_ sender: UITextField) {
        addNameToField()
    }
    @IBAction func removeName(_ sender: UIButton) {
        if let temp = nameField.text {
            if let index = name.index(of: temp){
                name.remove(at: index)
                nameList = ""
                for word in name {
                    nameList = nameList + word + "\n"
                }
                nameView.text = nameList
                nameField.text = ""
                counter = counter - 1
                nameField.endEditing(true)
            }
        }
    }
    @IBAction func random(_ sender: UIButton) {
        if counter > 0 {
            nameField.endEditing(true)
            let random = uint(counter)
            let randomPosition = arc4random_uniform(random)
            let random2 = arc4random_uniform(36)+1000
            titleName.text = name[Int(randomPosition)]
            nameField.endEditing(true)
            AudioServicesPlayAlertSound(random2)
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        nameList = ""
        nameView.text = nameList
        counter = 0
        name.removeAll()
        nameField.text = ""
        titleName.text = "Random Name"
        nameField.endEditing(true)
    }
    
    @IBAction func addName(_ sender: UIButton) {
        addNameToField()
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

