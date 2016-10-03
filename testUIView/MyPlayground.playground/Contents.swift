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

class Person{
    var  name = ""
    var power: Double  = 0.0
    var life: Double = 0.0
    var defense: Double = 0.0
    func attack(target: Person, withAttack: AttackMethod){
        target.life -= (self.power + withAttack.power)/target.defense*10
        let intLift = Int(target.life)
        target.life = Double(intLift)
    }
}

class AttackMethod{
    var power: Double = 10
}

var caocao = Person()
caocao.name = "曹操"
caocao.power = 100
caocao.life = 1000
caocao.defense = 30
var liubei = Person()
liubei.name = "刘备"
liubei.power = 80
liubei.life = 80
liubei.defense = 60
var am = AttackMethod()
caocao.attack(liubei, withAttack: am)
print(liubei.life)

caocao.attack(liubei, withAttack: am)
print(liubei.life)

//单例模式
class Tool{
    var toolName = ""
    struct ToolParams{
        static var tool: Tool? = nil
    }
    
    class func sharedTool() -> Tool {
        if ToolParams.tool == nil{
            ToolParams.tool = Tool()
        }
        return ToolParams.tool!
    }
    
}

var tool = Tool.sharedTool()
tool.toolName = "11111"
var tool2 = Tool.sharedTool()
print(tool2.toolName)

class Student{
    var name = ""
    var stuId = 0
    init(name: String,id: Int){
        self.name = name
        self.stuId = id
    }
}

class ClassRoom{
    var className = ""
    var students = Dictionary<Int, Student>()
    init(className: String){
        self.className = className
    }
    subscript(stuId: Int) -> Student{
        get{
            return students[stuId]!
        }
        set{
            students[stuId] = newValue
        }
    }
}


class School{
    var classes = Dictionary<Int, ClassRoom>()
    subscript(classId: Int, stuId: Int) -> Student{
        get{
            let cr: ClassRoom = classes[classId]!
            let stu: Student = cr[stuId]
            return stu
        }
        set{
            let cr: ClassRoom? = classes[classId]
            cr![stuId] = newValue
        }
    }
    subscript(classId: Int) -> ClassRoom{
        get{
            return classes[classId]!
        }
        set{
            classes[classId] = newValue
        }
    }
}

var phone = School()
for classId in 10...20{
    var cr = ClassRoom.init(className: "班级\(classId)")
    for stuId in 100...139{
        var stu = Student.init(name: "班级\(classId)学生\(stuId)", id: stuId)
        cr[stuId] = stu
    }
    phone[classId] = cr
}
print(phone[10, 130].name)

struct AccountOwnerInfo {
    var name: String = ""
    var Id: uint64 = 0
    var telNumber: uint64 = 0
    var homeAddress: String = ""
    var emailAddress: String = ""
    func showHostInfo() {
        print("姓名:\(name)")
        print("身份证号码:\(Id)")
        print("\(telNumber)  \(homeAddress)   \(emailAddress)")
    }
}

class BankAccount{
    var accountOwnerInfo = AccountOwnerInfo()
    let accountNumber = 0
    var accountPassword: uint = 0
    var accountBalance: UInt64 = 0
    func verifyPassword(intputPassword: uint) -> Bool {
        return intputPassword == accountPassword
    }
    func changePassword(newPassword: uint){
        accountPassword = newPassword
    }
    func deposit(amount: uint32){
        print("存款,金额\(amount)元")
    }
    func withdraw(amount: uint32) {
        print("取款,金额\(amount)元")
    }
    
    func showAccountInfo() {
        accountOwnerInfo.showHostInfo()
        print("帐号:\(accountNumber)")
    }
}

enum FixedDepositKind: String {
    case DefaultKind = "3个月"
    case HalfAYear = "半年"
    case OneYear = "一年"
    case ThreeYears = "三年"
    case FiveYears = "五年"
}

struct FixedSavingInfo {
    var amount: uint32
    let valueDate: Int
    let savingKind: FixedDepositKind
}

class CurrentAccount: BankAccount {
    var vip: Bool = false
    override func deposit(amount: uint32) {
        accountBalance += uint64( amount )
    }
    override func withdraw(amount: uint32) {
        accountBalance -= UInt64(amount)
    }
    override var accountBalance: UInt64{
        willSet{
            print("do nothing!")
        }
        didSet{
            if accountBalance >= 5000{
                vip = true
            }else{
                vip = false
            }
        }
    }
    override func showAccountInfo() {
        super.showAccountInfo()
        if vip{
            print("您是vip!!!!")
        }else{
            print("您是普通用户!!!")
        }
    }
}

var cur = CurrentAccount()
cur.deposit(505000)
print(cur.vip)

class DepositeBankAccount: BankAccount {
    var fixedSavings: [FixedSavingInfo] = []
    override var accountBalance: UInt64 {
        get {
            var sum: uint64 = 0
            for item in fixedSavings{
                sum += uint64(item.amount)
            }
            print(sum)
            return sum
        }
        set {
            print("Do nothing!!!")
        }
    }
    subscript(index: Int) -> uint32?{
        if index >= 0 && index < fixedSavings.count{
            return fixedSavings[index].amount
        }else{
            return nil
        }
    }
    func showFixedDepositeInfo() {
        for item in fixedSavings{
            print("金额:\(item.amount), 种类:\(item.savingKind.rawValue)")
        }
    }
    override func deposit(amount: uint32) {
        let curDate = NSDate().timeIntervalSinceNow
        let newItem = FixedSavingInfo.init(amount: amount, valueDate: Int(curDate)
            , savingKind: FixedDepositKind.DefaultKind)
        fixedSavings.append(newItem)
    }
}

let host = AccountOwnerInfo.init(name: "yz111" ,Id: 4254 ,telNumber: 4545, homeAddress: "454545", emailAddress: "dscddsc")
var baseAcct = BankAccount()
baseAcct.accountOwnerInfo = host
baseAcct.accountPassword = 123456
baseAcct.deposit(100)

var fixedAcct = DepositeBankAccount()
fixedAcct.deposit(1400)
fixedAcct.accountOwnerInfo = host
let depositItem1 = FixedSavingInfo.init(amount: 100, valueDate: 2014001, savingKind: FixedDepositKind.DefaultKind)
let depositItem2 = FixedSavingInfo.init(amount: 1000, valueDate: 20141001, savingKind: FixedDepositKind.HalfAYear)
fixedAcct.fixedSavings.append(depositItem1)
fixedAcct.fixedSavings.append(depositItem2)
fixedAcct.showFixedDepositeInfo()
fixedAcct.accountBalance


class Personer{
    var residence: Residence?
}
class Residence{
    var rooms = [Room]()
    var numberOfRooms: Int{
        return rooms.count
    }
    subscript(i: Int) -> Room{
        return rooms[i]
    }
    func printNumberOfRooms(){
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Address{
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String?{
        if buildingName != nil{
            return buildingName
        }else if buildingNumber != nil{
            return buildingNumber
        }else{
            return nil
        }
    }
}
class Room{
    let name: String
    init(name: String){
        self.name = name
    }
}
let john = Personer()
john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms{
    print("john's residence has \(roomCount) rooms")
}else{
    print("不能取嘚房间数量")
}

let johnHouse = Residence()
johnHouse.rooms.append(Room.init(name: "Living room"))
johnHouse.rooms.append(Room.init(name: "Kitchen"))
john.residence = johnHouse
if let firstRoomName = john.residence?[0].name{
    print("the first room name is \(firstRoomName)")
}else{
    print("unable to retrive the first room name.")
}

let johnsAdress = Address()
johnsAdress.buildingName = "THE LARCHES"
johnsAdress.street = "LAUREL STREET"
john.residence!.address = johnsAdress
if let johnsStreet = john.residence?.address?.street{
    print("john's street name is \(johnsStreet).")
}else{
    print("unable to retrive the address.")
}

class Entity{
    var name = ""
    init(entityName: String){
        self.name = entityName
    }
    func showTag()  {
        
    }
}

class Hero: Entity{
    var race = ""
    override func showTag() {
        print("世界由我来拯救!")
    }
}

class Monster: Entity{
    var level = 0
    override func showTag() {
        print("你是我的食物!")
    }
}

var h:Entity = Hero.init(entityName: "恶魔猎物")
h.showTag()

var entities = Array<Entity>()
entities.append(Hero.init(entityName: "大法师"))
entities.append(Monster.init(entityName: "食人魔拳手"))
entities.append(Hero.init(entityName: "山丘之王"))

var b = h is Hero


protocol FullyNamed {
    var fullName: String{get }
}
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        return (prefix != nil ? prefix! + "" : "")+name
    }
    
}
var ncc1701 = Starship.init(name: "bjdjjknxsjn", prefix: "dsjdjs")
print(ncc1701.fullName)










