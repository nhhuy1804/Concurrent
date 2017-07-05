//
//  ViewController.swift
//  Concurrent
//
//  Created by Cntt35 on 7/5/17.
//  Copyright © 2017 Nhom5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn1Click(_ sender: Any) {
        let thread1 = DispatchQueue(label: "thread1", qos: .default)
        let thread2 = DispatchQueue(label: "thread2", qos: .default)
        let thread3 = DispatchQueue(label: "thread3", qos: .default)
        thread1.async {
            for i in 0...9 {
                print("🔴\(i)")
            }
        }
        thread2.async {
            for i in 100...109 {
                print("⚫️\(i)")
            }
        }
        thread3.async {
            for i in 1000...1009 {
                print("🔵\(i)")
            }
        }
    }

    @IBAction func btn2Click(_ sender: Any) {
        let queue = DispatchQueue(label: "myQueue", qos: .default, attributes: .concurrent)
        queue.async {
            for i in 0...9 {
                print("🔴\(i)")
            }
        }
        queue.async {
            for i in 100...109 {
                print("⚫️\(i)")
            }
        }
        queue.async {
            for i in 1000...1009 {
                print("🔵\(i)")
            }
        }
    }
}

