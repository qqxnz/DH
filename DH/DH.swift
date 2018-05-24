//
//  DH.swift
//  DH
//
//  Created by lvfm on 2018/5/24.
//  Copyright © 2018年 lvfm. All rights reserved.
//

import Foundation

class DH: Any {
    ////生成公私密钥对
    class func generate_key_pair()->(private_key:String,public_key:String){
        var n_private:[UInt8] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        var n_public:[UInt8] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        
        DH_generate_key_pair(&n_public, &n_private)
        let pri_data = Data.init(bytes: n_private)
        let pub_data = Data.init(bytes: n_public)
        return (private_key:pri_data.base64EncodedString(),public_key:pub_data.base64EncodedString())
    }
    
    ///生成本地密钥
    class func generate_key_secret(my_private:String,other_public:String)->String{
        
        let my_private_data:Data = Data.init(base64Encoded: my_private)!
        let other_public_data:Data = Data.init(base64Encoded: other_public)!
        var n_private:[UInt8] = [UInt8](my_private_data)
        var n_public:[UInt8] = [UInt8](other_public_data)
        var n_secret:[UInt8] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        
        DH_generate_key_secret(&n_secret, &n_private, &n_public)
        let secret_data:Data = Data.init(bytes: n_secret)
        return secret_data.base64EncodedString()
    }
    
}
