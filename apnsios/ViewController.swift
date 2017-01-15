//
//  ViewController.swift
//  apnsios
//
//  Created by Asif Junaid on 15/01/2017.
//  Copyright © 2017 Asif Junaid. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        PFCloud.callFunction(inBackground: "hello", withParameters: [:]) {
            (response, error) -> Void in
            print("--------------")
          print(error.debugDescription)
            print("--------------")
            print(response)
            
        }
        PFCloud.callFunction(inBackground: "hello", withParameters: nil, block: { (response, error) -> Void in
            if error == nil{
                print("success")
            }else{
                print("error")
            }
        }
        )
        PFCloud.callFunction(inBackground: "hello", withParameters: [:])
//        addObjectToDatabase()
    }
    func addObjectToDatabase(){
        
        //addding data to class test object
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "checking login"
        testObject.saveInBackground { (success, error) in
            if success {
                print("Object Uploaded")
            } else {
                print("Error: \(error) \(error.debugDescription)")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

