//
//  ViewController.swift
//  new
//
//  Created by 曾名艺 on 2020/10/16.
//

import UIKit

struct weather1:Codable {
    var records:record
    struct record:Codable {
        var location:[locations]
    }
        struct locations:Codable {
            var locationName:String
            var weatherElement:[weatherElements]
        }
            struct weatherElements:Codable {
                var elementName:String
                var time:[times]
            }
                struct times:Codable {
                    var startTime:String
                    var endTime:String
                    var parameter:parameters
                }
                    struct parameters:Codable{
                        var parameterName:String
                    }

}


class ViewController: UIViewController{
    var locationName:[String] = []
    var elementName:[String] = []
    var dataTime:[String] = []
    var parameter:[String] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
        
    }
    
    
        
    func getWeatherData() {
        let urlStr = "https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=CWB-3B5F675C-A3F2-49C5-83F1-3BECB0183603"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data {
                    do {
                        let searchResponse = try decoder.decode(weather1.self, from: data)
                        DispatchQueue.main.async{
                            
                            var weather = [weather1]()
                            weather.append(searchResponse)
                            
                            for index in 0...21{
                            for item in weather{
                                    self.locationName.append(item.records.location[index].locationName)
                                }
                                
                            }
//                            for index in 0...4{
//                            for item in weather{
//                                self.elementName.append(item.records.location[index].weatherElement[index].elementName)
//                                }
//                            }
//                            for index in 0...2{
//                            for item in weather{
//                                self.dataTime.append(item.records.location[index].weatherElement[index].time[index].startTime)
//                                self.dataTime.append(item.records.location[index].weatherElement[index].time[index].endTime)
//                                }
//                            }
//
//                            for index1 in 0...21{
//                                for index2 in 0...4{
//                                    for index in 0...2{
//                                    for item in weather{
//                                        self.parameter.append(item.records.location[index1].weatherElement[index2].time[index].parameter.parameterName)
//
//                                        }
//                                    }
//                                }
//                            }
                        
                            print(self.locationName.count)
                            print(self.locationName)
                            
//                            print(self.elementName)
//                            print(self.dataTime)
//                            print(self.parameter)
                        }
                        
                    } catch {
                        print("error")
                    }
//                    if let weatherData = try? decoder.decode(Weather.self, from: data){
//                        print(weatherData.records)
//                    }
                }
            }.resume()
        }
    }
    
}


//        let urlStr = "https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=CWB-3B5F675C-A3F2-49C5-83F1-3BECB0183603"
//        if let url = URL(string: urlStr) {
//            URLSession.shared.dataTask(with: url) { (data, response , error) in
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
//                if let data = data {
//                    do {
//                        let searchResponse = try decoder.decode(Weather.self, from: data)
//                        DispatchQueue.main.async{
//                            var weather = [Weather]()
//                            weather.append(searchResponse)
//                            for index in 0...21{
//                            for item in weather{
//                                    self.locationName.append(item.records.location[index].locationName)
//                                }
//                            }
//                            for index in 0...4{
//                            for item in weather{
//                                self.elementName.append(item.records.location[index].weatherElement[index].elementName)
//                                }
//                            }
//                            for index in 0...2{
//                            for item in weather{
//                                self.dataTime.append(item.records.location[index].weatherElement[index].time[index].startTime)
//                                self.dataTime.append(item.records.location[index].weatherElement[index].time[index].endTime)
//                                }
//                            }
//                            for index1 in 0...21{
//                                for index2 in 0...4{
//                                    for index in 0...2{
//                                    for item in weather{
//                                        self.parameter.append(item.records.location[index1].weatherElement[index2].time[index].parameter.parameterName)
//
//                                        }
//                                    }
//                                }
//                            }
//
//                            print(self.locationName)
//                            print(self.elementName)
//                            print(self.dataTime)
//                            print(self.parameter)
//                        }
//
//                    } catch {
//                        print("error")
//                    }
////                    if let weatherData = try? decoder.decode(Weather.self, from: data){
////                        print(weatherData.records)
////                    }
//                } else {
//                    print("error")
//                }
//            }.resume()
//
//        }
        
        
        
        
        
        
//        if let url = URL(string: urlStr) {
//                     // GET
//                     URLSession.shared.dataTask(with: url) { (data, response, error) in
//                         if let error = error {
//                             print("Error: \(error.localizedDescription)")
//                         } else if let response = response as? HTTPURLResponse,let data = data {
//                             print("Status code: \(response.statusCode)")
//                             let decoder = JSONDecoder()
//
//                             if let coffeeData = try? decoder.decode([Weather].self, from: data) {
//                                 DispatchQueue.main.async{
////                                 for coffee in coffeeData {                   self.shopName.append(coffee.name)
////                                     self.shopCity.append(coffee.city)
//
//                                 }
//                                    //self.tableView.reloadData()
//                                 }
//                             }
//                         }
//                     .resume()
//                 } else {
//                     print("Invalid URL.")
//                 }

        
        
        
        
        
        
        
        
        
        
        
        
        
//        var occupations = [
//            "Malcolm": "Captain",
//            "Kaylee": "Mechanic",
//        ]
    
//        occupations["Jayne"] = "Public Relations"
//        if occupations["Jayne"] != nil{
//            let a = occupations["Jayne"]
//            print(a!)
//        }
//        let individualScores = [75, 43, 103, 87, 12]
//        var teamScore = 0
//        for score in individualScores {
//            print(score)
//            if score > 50 {
//                teamScore += 3
//            } else {
//                teamScore += 1
//            }
//        }
//        print(teamScore)
//        let optionalString: String? = "Hello"
//        print(optionalString == nil)//輸出判斷式
//        let interestingNumbers = [
//            "Prime": [2, 3, 5, 7, 11, 13],
//            "Fibonacci": [1, 1, 2, 3, 5, 8],
//            "Square": [1, 4, 9, 16, 25],
//        ]
//        var largest = 0
//        var string = ""
//        for (kind, numbers) in interestingNumbers {
//            for number in numbers {
//                if number > largest {
////                    print(number)//字典無序集合
////                    print(kind)
//                    largest = number
//                    string = kind
//                }
//            }
//        }
//        print(largest)
//        print(string)
        
//        var m = 2
//        repeat {
//            m = m * 2
//        } while m < 100//m不小於100時
//        print(m)
        
//        func greet(name: String, day: String,lunch: String) -> String {//使用->来指定函数返回值。
//            return "Hello \(name), today is \(day),today i eat \(lunch)"
//        }
//        print(greet(name:"Bob",day: "Tuesday",lunch: "noodle"))
        
//        func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
//            var min = scores[0]
//            var max = scores[0]
//            var sum = 0
//
//            for score in scores {
//                if score > max {
//                    max = score
//                    print(max)
//                } else if score < min {
//                    min = score
//                    print(min)
//                }
//                sum += score
//            }
//
//            return (min, max, sum)
//        }
//        let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
//        print(statistics.sum)
//        print(statistics.2)
        
//        func sumOf(numbers: Int...) -> Float {
//            var sum = 0
//            var count = 0
//            for number in numbers {
//                sum += number
//
//                count += 1
//            }
//            let sum1 = Float(sum)
//            let count1 = Float(count)
//            return sum1/count1
//        }
//        print(sumOf())
//        print(sumOf(numbers:42, 597, 12))
        
//        func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
//            for item in list {
//                if condition(item) {
//                    return true
//                }
//            }
//            return false
//        }
//        func lessThanTen(number: Int) -> Bool {
//            return number < 10
//        }
//        var numbers = [20, 19, 7, 12]
//        print(hasAnyMatches(list:numbers,condition: lessThanTen))
        
        
        
//        let url2 = "http://127.0.0.1/first.php"
//                let url = NSURL(string:url2)
//                if let data = try? Data(contentsOf: url as! URL){
//                    do{
//                        let parsedData = try JSONSerialization.jsonObject(with: data as Data,options:.allowFragments)
//                        let dict = parsedData as! NSDictionary
//                        if let user = dict["user"] ?? 0
//                        {
//                            print("user:\(user)")
//                        }
//                        if let a = dict["a"] ?? 0
//                        {
//                            print("a:\(a)")
//                            let str = a as! String
//                            let arr = str.split(separator: ",")
//                            print("arr=\(arr)")
//                            for i in 0..<arr.count{
//                                let a_i = Int(arr[i])!
//                                print("a_i=\(a_i)")
//                                if i == 0 {
//                                    label1.text = String(arr[i])
//                                }
//                                if i == 1 {
//                                    label2.text = String(arr[i])
//                                }
//                                if i == 2 {
//                                    label3.text = String(arr[i])
//                                }
//                                if i == 3 {
//                                    label4.text = String(arr[i])
//                                }
//                                if i == 4 {
//                                    label5.text = String(arr[i])
//                                }
//                                if i == 5 {
//                                    label6.text = String(arr[i])
//                                }
//                                if i == 6 {
//                                    label7.text = String(arr[i])
//                                }
//                                if i == 7 {
//                                    label8.text = String(arr[i])
//                                }
//                                if i == 8 {
//                                    label9.text = String(arr[i])
//                                }
//                                if i == 9 {
//                                    label10.text = String(arr[i])
//                                }
//                            }
//                        }
//                        if let b = dict["b"] ?? 0
//                        {
//                            print("b:\(b)")
//                        }
//                    }
//                        catch{
//                            print(error.localizedDescription)
//                        }
//        let url2 = "http://127.0.0.1/first.php"
//        let url = NSURL(string:url2)
//        if let data = try? Data(contentsOf: url as! URL){
//            do{
//                let parsedData = try JSONSerialization.jsonObject(with: data as Data,options:.allowFragments)
//                let dict = parsedData as! NSDictionary
//                if let user = dict["user"] ?? 0
//                {
//                    print("user:\(user)")
//                }
//                if let a = dict["a"] ?? 0
//                {
//                    print("a:\(a)")
//                }
//                if let op = dict["op"] ?? 0
//                {
//                    print("op:\(op)")
//                }
//                if let b = dict["b"] ?? 0
//                {
//                    print("b:\(b)")
//                }
//            }catch{
//                print(error.localizedDescription)
//            }
//        }
//        var nums = [[Int]]()
//        nums.append([1,2,3])
//        nums.append([4,5,6])
//        var nums1 = [[Int]]()
//        nums1.append([7,8,9])
//        nums1.append([10,11,12])
//        let sum = nums+nums1
//        print("二維陣列運算",sum)
//
//        var zoo: Set = ["x","y","z"]
//        var zoo2: Set = ["a","y","b","c"]
//        let s = zoo.union(zoo2)
//        let s1 = zoo.intersection(zoo2)
//        let s2 = zoo.symmetricDifference(zoo2)
//        let s3 = zoo.subtracting(zoo2)
//
//        print("集合交集",s1)
//        print("集合聯集",s)
//        print("集合對稱差集",s2)
//        print("集合差集",s3)
//    }
//}
        
        
        
        
//        //zoo.insert("x")
//        //zoo.insert("w")
//        print(zoo)
//        var a = zoo.intersection(zoo2)
//        print("intersection: \(a)")
//        a = zoo.union(zoo2)
//        print("union: \(a)")
//        a = zoo.symmetricDifference(zoo2)
//        print("symmetricDifference: \(a)")
//        a = zoo.subtracting(zoo2)
//        print("subtracting: \(a)")
    
        
//        var x = Int.random(in: 1...100)
//        var y = Int.random(in: 1...100)
//        var div : Float = 0.0
//        func addiaion(_ value:Int,_ value2:Int) ->Int{
//            return value+value2
//        }//加法傳值
//        func subtraction(_ value:Int,_ value2:Int) ->Int{
//            return value - value2
//        }//減法傳值
//        func division(_ value:inout Int,_ value2:inout Int,_ value3:inout Float){
//             value3 = Float(value) / Float(value2)
//        }
//        division(&x, &y, &div)//除法傳址
//        class A{
//            var value = 0
//        }
//        let a = A()
//        func multiplication(_ obj:A){
//            obj.value = x * y
//        }
//        multiplication(a)//乘法傳物件
//        print("x = \(x), y = \(y)")
//        print(addiaion(x, y))
//        print(subtraction(x, y))
//        print(div)
//        print(a.value)
        
        
//        var div: Float = 0.0
//        var arr = [Int]()
//        var number = Int.random(in: 1...100)
//        var number1 = Int.random(in: 1...100)
//        arr.append(number)
//        arr.append(number1)
//        func addiaion(_ value:Int,_ value2:Int) ->Int{
//                    return value+value2
//                }//加法傳值
//        func subtraction(_ value:Int,_ value2:Int,op:(Int,Int)->Int) ->Int{
//                    return op(value,value2)
//                }
//        let sub = subtraction(number, number1, op: {(value,value2) -> Int in
//            return value-value2
//    })//減法傳函數（閉包）
//        func closure(_ value:Int,_ value2:Int,op:(Int,Int)->Int) ->Int{
//                            return op(value,value2)
//                        }
//        func subtraction(_ value:Int,_ value2:Int) ->Int{
//                    return value - value2
//                }//減法傳函數（閉包）
//        func division(_ value:inout Int,_ value2:inout Int,_ value3:inout Float){
//                     value3 = Float(value) / Float(value2)
//                }
//                division(&number, &number1, &div)//除法傳址
//        class A{
//                var value = 0
//                }
//            let a = A()
//        func multiplication(_ obj:A){
//                obj.value = number * number1
//                }
//            multiplication(a)//乘法傳物件
//                print("x = \(arr[0]), y = \(arr[1])")
//                print(addiaion(arr[0], arr[1]))
//                print(closure(arr[0], arr[1], op: subtraction(_:_:)))
//                print(div)
//                print(a.value)
        
        
        
        
        
        
//        func hi(who: String = "whatever"){
//            print("hi, \(who)")
//        }
//        hi()
//        hi(who: "Kite")
        
        
        
        
        
//        func inc(_ value: inout Int){
//            value = value+1
//        }
//        var n = 0
//        inc(&n)
//        print(n)
        
        
        
        
//        class A {
//            var n = 0
//        }
//        func square(_ obj:A){
//            obj.n = obj.n * obj.n
//        }
//
//        let a = A()
//        a.n = 10
//        square(a)
//        print(a.n)
        
        
        
        
//        var n = Float(10.0)
//        func uf(_ value:Float)->String{
//            guard n>0 else{
//                return String(value*n*(-1.0))
//            }
//            return String(value*n)
//        }
//        print("OK")
//        var out = uf(3.0)
//        print(out)
//        var n = Float(10.0)
//        func uf(number value:Float)->String{
//            guard n>0 else{
//                return String(value*n*(-1.0))
//            }
//            return String(value*n)
//        }
//        print("OK")
//        var out = uf(number: 3.0)
//        print(out)
        //var n:Int?
        //n = Int("10")
//        print(n!*10)
//        print(n!)
//        if (n != nil){
//            print(n!)
//        }else {
//            print(n)
//        }
        //if let n2 = n {
          //  print(n2)
       // }else{
         //   print(n)
        //}
//        var n = 0
//        func uf()->String{
//            guard n>0 else{
//                return "n<=0"
//            }
//            return "n>0"
//        }
//        print("OK")
//        var out = uf()
//        print(out)
        // Do any additional setup after loading the view.
        



