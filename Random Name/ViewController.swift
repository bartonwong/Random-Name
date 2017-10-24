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
    
    @IBOutlet weak var nameView: UITextView!
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func random(_ sender: UIButton) {
        if counter > 0{
            let random = uint(counter)
            let randomPosition = arc4random_uniform(random)
            
            let alertController = UIAlertController(title: "iOScreator", message:
                name[Int(randomPosition)], preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Randm Name", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        nameList = ""
        nameField.text = nameList
        counter = 0
        name.removeAll()
    }
    
    @IBAction func addName(_ sender: UIButton) {
        if (nameField.text != ""){
            nameList = nameList + nameField.text! + "\n"
            name.append(nameField.text!)
            counter = counter + 1
            nameView.text = nameList
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

