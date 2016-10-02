//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
class LoginUser{
    var username: String = " "{
        willSet (newName){
            print("willset  "+newName)
        }
        didSet(oldName){
            print("didset "+oldName)
        }
        
        
    }
    
    init(name: String){
        username = name
    }

}

let name = LoginUser.init(name: "yangzhi")
name.username = "nihao"

