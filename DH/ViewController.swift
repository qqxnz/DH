//
//  ViewController.swift
//  DH
//
//  Created by lvfm on 2018/5/24.
//  Copyright © 2018年 lvfm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var a_private:String = ""
    var a_public:String = ""
    var a_secret:String = ""
    
    var b_private:String = ""
    var b_public:String = ""
    var b_secret:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionA(_ sender: Any) {

       let key =  DH.generate_key_pair()
        self.a_private = key.private_key
        self.a_public = key.public_key
        print(self.a_private)
        print(self.a_public)
        
    }

    @IBAction func actionB(_ sender: Any) {
        
        let key =  DH.generate_key_pair()
        self.b_private = key.private_key
        self.b_public = key.public_key
        print(self.b_private)
        print(self.b_public)
        
    }
    
    
    @IBAction func serA(_ sender: Any) {
        
        self.a_secret =  DH.generate_key_secret(my_private: self.a_private, other_public: self.b_public)
        
        print(self.a_secret)
        
        
    }
    
    
    @IBAction func serB(_ sender: Any) {
        
        self.b_secret = DH.generate_key_secret(my_private: self.b_private, other_public: self.a_public)
        
        print(self.b_secret)
        
    }
    
    
}

extension Data {
    /// 打印Data数据16进制字符串
    ///
    /// - returns: `String` representation of this `Data` object.
    func hexadecimal() -> String {
        return map { String(format: "%02x", $0) }
            .joined(separator: "")
    }
}

