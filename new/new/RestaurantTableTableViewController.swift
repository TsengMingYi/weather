//
//  RestaurantTableTableViewController.swift
//  new
//
//  Created by 曾名艺 on 2020/12/25.
//

import UIKit
struct weather:Codable {
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
class RestaurantTableTableViewController: UITableViewController {
    var members = [Member]()
    var locationName:[String] = []
    var elementName:[String] = []
    var dataTime:[String] = []
    var parameter:[String] = []
    var JiaYiXianAndObject = [String: String]()
    var XinBeiShiAndObject = [String: String]()
    var JiaYiShiAndObject = [String: String]()
    var XinZhuXianAndObject = [String: String]()
    var XinZhuShiAndObject = [String: String]()
    var TaiBeiShiAndObject = [String: String]()
    var TaiNanShiAndObject = [String: String]()
    var YiLanXianAndObject = [String: String]()
    var MiaoLiXianAndObject = [String: String]()
    var YunLinXianAndObject = [String: String]()
    var HuaLianXianAndObject = [String: String]()
    var TaiZhongShiAndObject = [String: String]()
    var TaiDongXianAndObject = [String: String]()
    var TaoYuanShiAndObject = [String: String]()
    var NanTouXianAndObject = [String: String]()
    var GaoXiongShiAndObject = [String: String]()
    var JinMenXianAndObject = [String: String]()
    var PingDongXianAndObject = [String: String]()
    var JiLongShiAndObject = [String: String]()
    var PengHuXianAndObject = [String: String]()
    var ZhangHuaXianAndObject = [String: String]()
    var LianJiangXianAndObject = [String: String]()
    var cityImages = ["jiayixian","xinbeishi","jiayishi","xinzhuxian","xinzhushi","taibeishi","tainanshi","yilanxian","miaolixian","yunlinxian","hualianxian","taizhongshi","taidongxian","taoyuanshi","nantouxian","gaoxiongshi","jinmenxian","pingdongxian","jilongshi","penghuxian","zhanghuaxian","lianjiangxian"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return members.count
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
//                            print(weather)
//                            print(weather.count)
                            for index in 0...21{
                            for item in weather{
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("嘉義縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.JiaYiXianAndObject["嘉義縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.JiaYiXianAndObject["嘉義縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.JiaYiXianAndObject["嘉義縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.JiaYiXianAndObject["嘉義縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.JiaYiXianAndObject["嘉義縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiXianAndObject["嘉義縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("新北市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.XinBeiShiAndObject["新北市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.XinBeiShiAndObject["新北市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.XinBeiShiAndObject["新北市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.XinBeiShiAndObject["新北市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.XinBeiShiAndObject["新北市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinBeiShiAndObject["新北市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("嘉義市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.JiaYiShiAndObject["嘉義市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.JiaYiShiAndObject["嘉義市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.JiaYiShiAndObject["嘉義市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.JiaYiShiAndObject["嘉義市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.JiaYiShiAndObject["嘉義市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiaYiShiAndObject["嘉義市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("新竹縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.XinZhuXianAndObject["新竹縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.XinZhuXianAndObject["新竹縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.XinZhuXianAndObject["新竹縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.XinZhuXianAndObject["新竹縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.XinZhuXianAndObject["新竹縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuXianAndObject["新竹縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("新竹市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.XinZhuShiAndObject["新竹市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.XinZhuShiAndObject["新竹市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.XinZhuShiAndObject["新竹市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.XinZhuShiAndObject["新竹市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.XinZhuShiAndObject["新竹市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.XinZhuShiAndObject["新竹市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("臺北市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.TaiBeiShiAndObject["臺北市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.TaiBeiShiAndObject["臺北市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.TaiBeiShiAndObject["臺北市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.TaiBeiShiAndObject["臺北市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.TaiBeiShiAndObject["臺北市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiBeiShiAndObject["臺北市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("臺南市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.TaiNanShiAndObject["臺南市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.TaiNanShiAndObject["臺南市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.TaiNanShiAndObject["臺南市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.TaiNanShiAndObject["臺南市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.TaiNanShiAndObject["臺南市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiNanShiAndObject["臺南市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("宜蘭縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.YiLanXianAndObject["宜蘭縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.YiLanXianAndObject["宜蘭縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.YiLanXianAndObject["宜蘭縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.YiLanXianAndObject["宜蘭縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.YiLanXianAndObject["宜蘭縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YiLanXianAndObject["宜蘭縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("苗栗縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.MiaoLiXianAndObject["苗栗縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.MiaoLiXianAndObject["苗栗縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.MiaoLiXianAndObject["苗栗縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.MiaoLiXianAndObject["苗栗縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.MiaoLiXianAndObject["苗栗縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.MiaoLiXianAndObject["苗栗縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("雲林縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.YunLinXianAndObject["雲林縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.YunLinXianAndObject["雲林縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.YunLinXianAndObject["雲林縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.YunLinXianAndObject["雲林縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.YunLinXianAndObject["雲林縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.YunLinXianAndObject["雲林縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("花蓮縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.HuaLianXianAndObject["花蓮縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.HuaLianXianAndObject["花蓮縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.HuaLianXianAndObject["花蓮縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.HuaLianXianAndObject["花蓮縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.HuaLianXianAndObject["花蓮縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.HuaLianXianAndObject["花蓮縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("臺中市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.TaiZhongShiAndObject["臺中市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.TaiZhongShiAndObject["臺中市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.TaiZhongShiAndObject["臺中市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.TaiZhongShiAndObject["臺中市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.TaiZhongShiAndObject["臺中市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiZhongShiAndObject["臺中市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("臺東縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.TaiDongXianAndObject["臺東縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.TaiDongXianAndObject["臺東縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.TaiDongXianAndObject["臺東縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.TaiDongXianAndObject["臺東縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.TaiDongXianAndObject["臺東縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaiDongXianAndObject["臺東縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("桃園市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.TaoYuanShiAndObject["桃園市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.TaoYuanShiAndObject["桃園市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.TaoYuanShiAndObject["桃園市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.TaoYuanShiAndObject["桃園市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.TaoYuanShiAndObject["桃園市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.TaoYuanShiAndObject["桃園市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("南投縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.NanTouXianAndObject["南投縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.NanTouXianAndObject["南投縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.NanTouXianAndObject["南投縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.NanTouXianAndObject["南投縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.NanTouXianAndObject["南投縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.NanTouXianAndObject["南投縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("高雄市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.GaoXiongShiAndObject["高雄市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.GaoXiongShiAndObject["高雄市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.GaoXiongShiAndObject["高雄市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.GaoXiongShiAndObject["高雄市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.GaoXiongShiAndObject["高雄市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.GaoXiongShiAndObject["高雄市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("金門縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.JinMenXianAndObject["金門縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.JinMenXianAndObject["金門縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.JinMenXianAndObject["金門縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.JinMenXianAndObject["金門縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.JinMenXianAndObject["金門縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JinMenXianAndObject["金門縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("屏東縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.PingDongXianAndObject["屏東縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.PingDongXianAndObject["屏東縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.PingDongXianAndObject["屏東縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.PingDongXianAndObject["屏東縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.PingDongXianAndObject["屏東縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PingDongXianAndObject["屏東縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("基隆市"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.JiLongShiAndObject["基隆市第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.JiLongShiAndObject["基隆市第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.JiLongShiAndObject["基隆市第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.JiLongShiAndObject["基隆市第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.JiLongShiAndObject["基隆市第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.JiLongShiAndObject["基隆市第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("澎湖縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.PengHuXianAndObject["澎湖縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.PengHuXianAndObject["澎湖縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.PengHuXianAndObject["澎湖縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.PengHuXianAndObject["澎湖縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.PengHuXianAndObject["澎湖縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.PengHuXianAndObject["澎湖縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("彰化縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.ZhangHuaXianAndObject["彰化縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.ZhangHuaXianAndObject["彰化縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.ZhangHuaXianAndObject["彰化縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.ZhangHuaXianAndObject["彰化縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.ZhangHuaXianAndObject["彰化縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.ZhangHuaXianAndObject["彰化縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                for item1 in 0...4{
                                    if item.records.location[index].locationName.contains("連江縣"){
                                        if item.records.location[index].weatherElement[item1].elementName.contains("MaxT"){
                                            self.LianJiangXianAndObject["連江縣第一次最高溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第二次最高溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第三次最高溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("MinT"){
                                            self.LianJiangXianAndObject["連江縣第一次最低溫"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第二次最低溫"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第三次最低溫"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("Wx"){
                                            self.LianJiangXianAndObject["連江縣第一次天氣狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第二次天氣狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第三次天氣狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("PoP"){
                                            self.LianJiangXianAndObject["連江縣第一次降雨機率"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第二次降雨機率"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第三次降雨機率"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }else if
                                            item.records.location[index].weatherElement[item1].elementName.contains("CI"){
                                            self.LianJiangXianAndObject["連江縣第一次舒適狀況"] = item.records.location[index].weatherElement[item1].time[0].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第二次舒適狀況"] = item.records.location[index].weatherElement[item1].time[1].parameter.parameterName
                                            self.LianJiangXianAndObject["連江縣第三次舒適狀況"] = item.records.location[index].weatherElement[item1].time[2].parameter.parameterName
                                        }
                                    }
                                    continue
                                    
                                }
                                
                                
                                    self.locationName.append(item.records.location[index].locationName)
                                
                                }
                            }
                            self.members.append(Member(name: "嘉義縣", wx1: self.JiaYiXianAndObject["嘉義縣第一次天氣狀況"]!, wx2: self.JiaYiXianAndObject["嘉義縣第二次天氣狀況"]!, wx3: self.JiaYiXianAndObject["嘉義縣第三次天氣狀況"]!, pop1: self.JiaYiXianAndObject["嘉義縣第一次降雨機率"]!, pop2: self.JiaYiXianAndObject["嘉義縣第二次降雨機率"]!, pop3: self.JiaYiXianAndObject["嘉義縣第三次降雨機率"]!, mint1: self.JiaYiXianAndObject["嘉義縣第一次最低溫"]!, mint2: self.JiaYiXianAndObject["嘉義縣第二次最低溫"]!, mint3: self.JiaYiXianAndObject["嘉義縣第三次最低溫"]!, ci1: self.JiaYiXianAndObject["嘉義縣第一次舒適狀況"]!, ci2: self.JiaYiXianAndObject["嘉義縣第二次舒適狀況"]!, ci3: self.JiaYiXianAndObject["嘉義縣第三次舒適狀況"]!, maxt1: self.JiaYiXianAndObject["嘉義縣第一次最高溫"]!, maxt2: self.JiaYiXianAndObject["嘉義縣第二次最高溫"]!, maxt3: self.JiaYiXianAndObject["嘉義縣第三次最高溫"]!))
                            self.members.append(Member(name: "新北市", wx1: self.XinBeiShiAndObject["新北市第一次天氣狀況"]!, wx2: self.XinBeiShiAndObject["新北市第二次天氣狀況"]!, wx3: self.XinBeiShiAndObject["新北市第三次天氣狀況"]!, pop1: self.XinBeiShiAndObject["新北市第一次降雨機率"]!, pop2: self.XinBeiShiAndObject["新北市第二次降雨機率"]!, pop3: self.XinBeiShiAndObject["新北市第三次降雨機率"]!, mint1: self.XinBeiShiAndObject["新北市第一次最低溫"]!, mint2: self.XinBeiShiAndObject["新北市第二次最低溫"]!, mint3: self.XinBeiShiAndObject["新北市第三次最低溫"]!, ci1: self.XinBeiShiAndObject["新北市第一次舒適狀況"]!, ci2: self.XinBeiShiAndObject["新北市第二次舒適狀況"]!, ci3: self.XinBeiShiAndObject["新北市第三次舒適狀況"]!, maxt1: self.XinBeiShiAndObject["新北市第一次最高溫"]!, maxt2: self.XinBeiShiAndObject["新北市第二次最高溫"]!, maxt3: self.XinBeiShiAndObject["新北市第三次最高溫"]!))
                            self.members.append(Member(name: "嘉義市", wx1: self.JiaYiShiAndObject["嘉義市第一次天氣狀況"]!, wx2: self.JiaYiShiAndObject["嘉義市第二次天氣狀況"]!, wx3: self.JiaYiShiAndObject["嘉義市第三次天氣狀況"]!, pop1: self.JiaYiShiAndObject["嘉義市第一次降雨機率"]!, pop2: self.JiaYiShiAndObject["嘉義市第二次降雨機率"]!, pop3: self.JiaYiShiAndObject["嘉義市第三次降雨機率"]!, mint1: self.JiaYiShiAndObject["嘉義市第一次最低溫"]!, mint2: self.JiaYiShiAndObject["嘉義市第二次最低溫"]!, mint3: self.JiaYiShiAndObject["嘉義市第三次最低溫"]!, ci1: self.JiaYiShiAndObject["嘉義市第一次舒適狀況"]!, ci2: self.JiaYiShiAndObject["嘉義市第二次舒適狀況"]!, ci3: self.JiaYiShiAndObject["嘉義市第三次舒適狀況"]!, maxt1: self.JiaYiShiAndObject["嘉義市第一次最高溫"]!, maxt2: self.JiaYiShiAndObject["嘉義市第二次最高溫"]!, maxt3: self.JiaYiShiAndObject["嘉義市第三次最高溫"]!))
                            self.members.append(Member(name: "新竹縣", wx1: self.XinZhuXianAndObject["新竹縣第一次天氣狀況"]!, wx2: self.XinZhuXianAndObject["新竹縣第二次天氣狀況"]!, wx3: self.XinZhuXianAndObject["新竹縣第三次天氣狀況"]!, pop1: self.XinZhuXianAndObject["新竹縣第一次降雨機率"]!, pop2: self.XinZhuXianAndObject["新竹縣第二次降雨機率"]!, pop3: self.XinZhuXianAndObject["新竹縣第三次降雨機率"]!, mint1: self.XinZhuXianAndObject["新竹縣第一次最低溫"]!, mint2: self.XinZhuXianAndObject["新竹縣第二次最低溫"]!, mint3: self.XinZhuXianAndObject["新竹縣第三次最低溫"]!, ci1: self.XinZhuXianAndObject["新竹縣第一次舒適狀況"]!, ci2: self.XinZhuXianAndObject["新竹縣第二次舒適狀況"]!, ci3: self.XinZhuXianAndObject["新竹縣第三次舒適狀況"]!, maxt1: self.XinZhuXianAndObject["新竹縣第一次最高溫"]!, maxt2: self.XinZhuXianAndObject["新竹縣第二次最高溫"]!, maxt3: self.XinZhuXianAndObject["新竹縣第三次最高溫"]!))
                            self.members.append(Member(name: "新竹市", wx1: self.XinZhuShiAndObject["新竹市第一次天氣狀況"]!, wx2: self.XinZhuShiAndObject["新竹市第二次天氣狀況"]!, wx3: self.XinZhuShiAndObject["新竹市第三次天氣狀況"]!, pop1: self.XinZhuShiAndObject["新竹市第一次降雨機率"]!, pop2: self.XinZhuShiAndObject["新竹市第二次降雨機率"]!, pop3: self.XinZhuShiAndObject["新竹市第三次降雨機率"]!, mint1: self.XinZhuShiAndObject["新竹市第一次最低溫"]!, mint2: self.XinZhuShiAndObject["新竹市第二次最低溫"]!, mint3: self.XinZhuShiAndObject["新竹市第三次最低溫"]!, ci1: self.XinZhuShiAndObject["新竹市第一次舒適狀況"]!, ci2: self.XinZhuShiAndObject["新竹市第二次舒適狀況"]!, ci3: self.XinZhuShiAndObject["新竹市第三次舒適狀況"]!, maxt1: self.XinZhuShiAndObject["新竹市第一次最高溫"]!, maxt2: self.XinZhuShiAndObject["新竹市第二次最高溫"]!, maxt3: self.XinZhuShiAndObject["新竹市第三次最高溫"]!))
                            self.members.append(Member(name: "臺北市", wx1: self.TaiBeiShiAndObject["臺北市第一次天氣狀況"]!, wx2: self.TaiBeiShiAndObject["臺北市第二次天氣狀況"]!, wx3: self.TaiBeiShiAndObject["臺北市第三次天氣狀況"]!, pop1: self.TaiBeiShiAndObject["臺北市第一次降雨機率"]!, pop2: self.TaiBeiShiAndObject["臺北市第二次降雨機率"]!, pop3: self.TaiBeiShiAndObject["臺北市第三次降雨機率"]!, mint1: self.TaiBeiShiAndObject["臺北市第一次最低溫"]!, mint2: self.TaiBeiShiAndObject["臺北市第二次最低溫"]!, mint3: self.TaiBeiShiAndObject["臺北市第三次最低溫"]!, ci1: self.TaiBeiShiAndObject["臺北市第一次舒適狀況"]!, ci2: self.TaiBeiShiAndObject["臺北市第二次舒適狀況"]!, ci3: self.TaiBeiShiAndObject["臺北市第三次舒適狀況"]!, maxt1: self.TaiBeiShiAndObject["臺北市第一次最高溫"]!, maxt2: self.TaiBeiShiAndObject["臺北市第二次最高溫"]!, maxt3: self.TaiBeiShiAndObject["臺北市第三次最高溫"]!))
                            self.members.append(Member(name: "臺南市", wx1: self.TaiNanShiAndObject["臺南市第一次天氣狀況"]!, wx2: self.TaiNanShiAndObject["臺南市第二次天氣狀況"]!, wx3: self.TaiNanShiAndObject["臺南市第三次天氣狀況"]!, pop1: self.TaiNanShiAndObject["臺南市第一次降雨機率"]!, pop2: self.TaiNanShiAndObject["臺南市第二次降雨機率"]!, pop3: self.TaiNanShiAndObject["臺南市第三次降雨機率"]!, mint1: self.TaiNanShiAndObject["臺南市第一次最低溫"]!, mint2: self.TaiNanShiAndObject["臺南市第二次最低溫"]!, mint3: self.TaiNanShiAndObject["臺南市第三次最低溫"]!, ci1: self.TaiNanShiAndObject["臺南市第一次舒適狀況"]!, ci2: self.TaiNanShiAndObject["臺南市第二次舒適狀況"]!, ci3: self.TaiNanShiAndObject["臺南市第三次舒適狀況"]!, maxt1: self.TaiNanShiAndObject["臺南市第一次最高溫"]!, maxt2: self.TaiNanShiAndObject["臺南市第二次最高溫"]!, maxt3: self.TaiNanShiAndObject["臺南市第三次最高溫"]!))
                            self.members.append(Member(name: "宜蘭縣", wx1: self.YiLanXianAndObject["宜蘭縣第一次天氣狀況"]!, wx2: self.YiLanXianAndObject["宜蘭縣第二次天氣狀況"]!, wx3: self.YiLanXianAndObject["宜蘭縣第三次天氣狀況"]!, pop1: self.YiLanXianAndObject["宜蘭縣第一次降雨機率"]!, pop2: self.YiLanXianAndObject["宜蘭縣第二次降雨機率"]!, pop3: self.YiLanXianAndObject["宜蘭縣第三次降雨機率"]!, mint1: self.YiLanXianAndObject["宜蘭縣第一次最低溫"]!, mint2: self.YiLanXianAndObject["宜蘭縣第二次最低溫"]!, mint3: self.YiLanXianAndObject["宜蘭縣第三次最低溫"]!, ci1: self.YiLanXianAndObject["宜蘭縣第一次舒適狀況"]!, ci2: self.YiLanXianAndObject["宜蘭縣第二次舒適狀況"]!, ci3: self.YiLanXianAndObject["宜蘭縣第三次舒適狀況"]!, maxt1: self.YiLanXianAndObject["宜蘭縣第一次最高溫"]!, maxt2: self.YiLanXianAndObject["宜蘭縣第二次最高溫"]!, maxt3: self.YiLanXianAndObject["宜蘭縣第三次最高溫"]!))
                            self.members.append(Member(name: "苗栗縣", wx1: self.MiaoLiXianAndObject["苗栗縣第一次天氣狀況"]!, wx2: self.MiaoLiXianAndObject["苗栗縣第二次天氣狀況"]!, wx3: self.MiaoLiXianAndObject["苗栗縣第三次天氣狀況"]!, pop1: self.MiaoLiXianAndObject["苗栗縣第一次降雨機率"]!, pop2: self.MiaoLiXianAndObject["苗栗縣第二次降雨機率"]!, pop3: self.MiaoLiXianAndObject["苗栗縣第三次降雨機率"]!, mint1: self.MiaoLiXianAndObject["苗栗縣第一次最低溫"]!, mint2: self.MiaoLiXianAndObject["苗栗縣第二次最低溫"]!, mint3: self.MiaoLiXianAndObject["苗栗縣第三次最低溫"]!, ci1: self.MiaoLiXianAndObject["苗栗縣第一次舒適狀況"]!, ci2: self.MiaoLiXianAndObject["苗栗縣第二次舒適狀況"]!, ci3: self.MiaoLiXianAndObject["苗栗縣第三次舒適狀況"]!, maxt1: self.MiaoLiXianAndObject["苗栗縣第一次最高溫"]!, maxt2: self.MiaoLiXianAndObject["苗栗縣第二次最高溫"]!, maxt3: self.MiaoLiXianAndObject["苗栗縣第三次最高溫"]!))
                            self.members.append(Member(name: "雲林縣", wx1: self.YunLinXianAndObject["雲林縣第一次天氣狀況"]!, wx2: self.YunLinXianAndObject["雲林縣第二次天氣狀況"]!, wx3: self.YunLinXianAndObject["雲林縣第三次天氣狀況"]!, pop1: self.YunLinXianAndObject["雲林縣第一次降雨機率"]!, pop2: self.YunLinXianAndObject["雲林縣第二次降雨機率"]!, pop3: self.YunLinXianAndObject["雲林縣第三次降雨機率"]!, mint1: self.YunLinXianAndObject["雲林縣第一次最低溫"]!, mint2: self.YunLinXianAndObject["雲林縣第二次最低溫"]!, mint3: self.YunLinXianAndObject["雲林縣第三次最低溫"]!, ci1: self.YunLinXianAndObject["雲林縣第一次舒適狀況"]!, ci2: self.YunLinXianAndObject["雲林縣第二次舒適狀況"]!, ci3: self.YunLinXianAndObject["雲林縣第三次舒適狀況"]!, maxt1: self.YunLinXianAndObject["雲林縣第一次最高溫"]!, maxt2: self.YunLinXianAndObject["雲林縣第二次最高溫"]!, maxt3: self.YunLinXianAndObject["雲林縣第三次最高溫"]!))
                            self.members.append(Member(name: "花蓮縣", wx1: self.HuaLianXianAndObject["花蓮縣第一次天氣狀況"]!, wx2: self.HuaLianXianAndObject["花蓮縣第二次天氣狀況"]!, wx3: self.HuaLianXianAndObject["花蓮縣第三次天氣狀況"]!, pop1: self.HuaLianXianAndObject["花蓮縣第一次降雨機率"]!, pop2: self.HuaLianXianAndObject["花蓮縣第二次降雨機率"]!, pop3: self.HuaLianXianAndObject["花蓮縣第三次降雨機率"]!, mint1: self.HuaLianXianAndObject["花蓮縣第一次最低溫"]!, mint2: self.HuaLianXianAndObject["花蓮縣第二次最低溫"]!, mint3: self.HuaLianXianAndObject["花蓮縣第三次最低溫"]!, ci1: self.HuaLianXianAndObject["花蓮縣第一次舒適狀況"]!, ci2: self.HuaLianXianAndObject["花蓮縣第二次舒適狀況"]!, ci3: self.HuaLianXianAndObject["花蓮縣第三次舒適狀況"]!, maxt1: self.HuaLianXianAndObject["花蓮縣第一次最高溫"]!, maxt2: self.HuaLianXianAndObject["花蓮縣第二次最高溫"]!, maxt3: self.HuaLianXianAndObject["花蓮縣第三次最高溫"]!))
                            self.members.append(Member(name: "臺中市", wx1: self.TaiZhongShiAndObject["臺中市第一次天氣狀況"]!, wx2: self.TaiZhongShiAndObject["臺中市第二次天氣狀況"]!, wx3: self.TaiZhongShiAndObject["臺中市第三次天氣狀況"]!, pop1: self.TaiZhongShiAndObject["臺中市第一次降雨機率"]!, pop2: self.TaiZhongShiAndObject["臺中市第二次降雨機率"]!, pop3: self.TaiZhongShiAndObject["臺中市第三次降雨機率"]!, mint1: self.TaiZhongShiAndObject["臺中市第一次最低溫"]!, mint2: self.TaiZhongShiAndObject["臺中市第二次最低溫"]!, mint3: self.TaiZhongShiAndObject["臺中市第三次最低溫"]!, ci1: self.TaiZhongShiAndObject["臺中市第一次舒適狀況"]!, ci2: self.TaiZhongShiAndObject["臺中市第二次舒適狀況"]!, ci3: self.TaiZhongShiAndObject["臺中市第三次舒適狀況"]!, maxt1: self.TaiZhongShiAndObject["臺中市第一次最高溫"]!, maxt2: self.TaiZhongShiAndObject["臺中市第二次最高溫"]!, maxt3: self.TaiZhongShiAndObject["臺中市第三次最高溫"]!))
                            self.members.append(Member(name: "臺東縣", wx1: self.TaiDongXianAndObject["臺東縣第一次天氣狀況"]!, wx2: self.TaiDongXianAndObject["臺東縣第二次天氣狀況"]!, wx3: self.TaiDongXianAndObject["臺東縣第三次天氣狀況"]!, pop1: self.TaiDongXianAndObject["臺東縣第一次降雨機率"]!, pop2: self.TaiDongXianAndObject["臺東縣第二次降雨機率"]!, pop3: self.TaiDongXianAndObject["臺東縣第三次降雨機率"]!, mint1: self.TaiDongXianAndObject["臺東縣第一次最低溫"]!, mint2: self.TaiDongXianAndObject["臺東縣第二次最低溫"]!, mint3: self.TaiDongXianAndObject["臺東縣第三次最低溫"]!, ci1: self.TaiDongXianAndObject["臺東縣第一次舒適狀況"]!, ci2: self.TaiDongXianAndObject["臺東縣第二次舒適狀況"]!, ci3: self.TaiDongXianAndObject["臺東縣第三次舒適狀況"]!, maxt1: self.TaiDongXianAndObject["臺東縣第一次最高溫"]!, maxt2: self.TaiDongXianAndObject["臺東縣第二次最高溫"]!, maxt3: self.TaiDongXianAndObject["臺東縣第三次最高溫"]!))
                            self.members.append(Member(name: "桃園市", wx1: self.TaoYuanShiAndObject["桃園市第一次天氣狀況"]!, wx2: self.TaoYuanShiAndObject["桃園市第二次天氣狀況"]!, wx3: self.TaoYuanShiAndObject["桃園市第三次天氣狀況"]!, pop1: self.TaoYuanShiAndObject["桃園市第一次降雨機率"]!, pop2: self.TaoYuanShiAndObject["桃園市第二次降雨機率"]!, pop3: self.TaoYuanShiAndObject["桃園市第三次降雨機率"]!, mint1: self.TaoYuanShiAndObject["桃園市第一次最低溫"]!, mint2: self.TaoYuanShiAndObject["桃園市第二次最低溫"]!, mint3: self.TaoYuanShiAndObject["桃園市第三次最低溫"]!, ci1: self.TaoYuanShiAndObject["桃園市第一次舒適狀況"]!, ci2: self.TaoYuanShiAndObject["桃園市第二次舒適狀況"]!, ci3: self.TaoYuanShiAndObject["桃園市第三次舒適狀況"]!, maxt1: self.TaoYuanShiAndObject["桃園市第一次最高溫"]!, maxt2: self.TaoYuanShiAndObject["桃園市第二次最高溫"]!, maxt3: self.TaoYuanShiAndObject["桃園市第三次最高溫"]!))
                            self.members.append(Member(name: "南投縣", wx1: self.NanTouXianAndObject["南投縣第一次天氣狀況"]!, wx2: self.NanTouXianAndObject["南投縣第二次天氣狀況"]!, wx3: self.NanTouXianAndObject["南投縣第三次天氣狀況"]!, pop1: self.NanTouXianAndObject["南投縣第一次降雨機率"]!, pop2: self.NanTouXianAndObject["南投縣第二次降雨機率"]!, pop3: self.NanTouXianAndObject["南投縣第三次降雨機率"]!, mint1: self.NanTouXianAndObject["南投縣第一次最低溫"]!, mint2: self.NanTouXianAndObject["南投縣第二次最低溫"]!, mint3: self.NanTouXianAndObject["南投縣第三次最低溫"]!, ci1: self.NanTouXianAndObject["南投縣第一次舒適狀況"]!, ci2: self.NanTouXianAndObject["南投縣第二次舒適狀況"]!, ci3: self.NanTouXianAndObject["南投縣第三次舒適狀況"]!, maxt1: self.NanTouXianAndObject["南投縣第一次最高溫"]!, maxt2: self.NanTouXianAndObject["南投縣第二次最高溫"]!, maxt3: self.NanTouXianAndObject["南投縣第三次最高溫"]!))
                            self.members.append(Member(name: "高雄市", wx1: self.GaoXiongShiAndObject["高雄市第一次天氣狀況"]!, wx2: self.GaoXiongShiAndObject["高雄市第二次天氣狀況"]!, wx3: self.GaoXiongShiAndObject["高雄市第三次天氣狀況"]!, pop1: self.GaoXiongShiAndObject["高雄市第一次降雨機率"]!, pop2: self.GaoXiongShiAndObject["高雄市第二次降雨機率"]!, pop3: self.GaoXiongShiAndObject["高雄市第三次降雨機率"]!, mint1: self.GaoXiongShiAndObject["高雄市第一次最低溫"]!, mint2: self.GaoXiongShiAndObject["高雄市第二次最低溫"]!, mint3: self.GaoXiongShiAndObject["高雄市第三次最低溫"]!, ci1: self.GaoXiongShiAndObject["高雄市第一次舒適狀況"]!, ci2: self.GaoXiongShiAndObject["高雄市第二次舒適狀況"]!, ci3: self.GaoXiongShiAndObject["高雄市第三次舒適狀況"]!, maxt1: self.GaoXiongShiAndObject["高雄市第一次最高溫"]!, maxt2: self.GaoXiongShiAndObject["高雄市第二次最高溫"]!, maxt3: self.GaoXiongShiAndObject["高雄市第三次最高溫"]!))
                            self.members.append(Member(name: "金門縣", wx1: self.JinMenXianAndObject["金門縣第一次天氣狀況"]!, wx2: self.JinMenXianAndObject["金門縣第二次天氣狀況"]!, wx3: self.JinMenXianAndObject["金門縣第三次天氣狀況"]!, pop1: self.JinMenXianAndObject["金門縣第一次降雨機率"]!, pop2: self.JinMenXianAndObject["金門縣第二次降雨機率"]!, pop3: self.JinMenXianAndObject["金門縣第三次降雨機率"]!, mint1: self.JinMenXianAndObject["金門縣第一次最低溫"]!, mint2: self.JinMenXianAndObject["金門縣第二次最低溫"]!, mint3: self.JinMenXianAndObject["金門縣第三次最低溫"]!, ci1: self.JinMenXianAndObject["金門縣第一次舒適狀況"]!, ci2: self.JinMenXianAndObject["金門縣第二次舒適狀況"]!, ci3: self.JinMenXianAndObject["金門縣第三次舒適狀況"]!, maxt1: self.JinMenXianAndObject["金門縣第一次最高溫"]!, maxt2: self.JinMenXianAndObject["金門縣第二次最高溫"]!, maxt3: self.JinMenXianAndObject["金門縣第三次最高溫"]!))
                            self.members.append(Member(name: "屏東縣", wx1: self.PingDongXianAndObject["屏東縣第一次天氣狀況"]!, wx2: self.PingDongXianAndObject["屏東縣第二次天氣狀況"]!, wx3: self.PingDongXianAndObject["屏東縣第三次天氣狀況"]!, pop1: self.PingDongXianAndObject["屏東縣第一次降雨機率"]!, pop2: self.PingDongXianAndObject["屏東縣第二次降雨機率"]!, pop3: self.PingDongXianAndObject["屏東縣第三次降雨機率"]!, mint1: self.PingDongXianAndObject["屏東縣第一次最低溫"]!, mint2: self.PingDongXianAndObject["屏東縣第二次最低溫"]!, mint3: self.PingDongXianAndObject["屏東縣第三次最低溫"]!, ci1: self.PingDongXianAndObject["屏東縣第一次舒適狀況"]!, ci2: self.PingDongXianAndObject["屏東縣第二次舒適狀況"]!, ci3: self.PingDongXianAndObject["屏東縣第三次舒適狀況"]!, maxt1: self.PingDongXianAndObject["屏東縣第一次最高溫"]!, maxt2: self.PingDongXianAndObject["屏東縣第二次最高溫"]!, maxt3: self.PingDongXianAndObject["屏東縣第三次最高溫"]!))
                            self.members.append(Member(name: "基隆市", wx1: self.JiLongShiAndObject["基隆市第一次天氣狀況"]!, wx2: self.JiLongShiAndObject["基隆市第二次天氣狀況"]!, wx3: self.JiLongShiAndObject["基隆市第三次天氣狀況"]!, pop1: self.JiLongShiAndObject["基隆市第一次降雨機率"]!, pop2: self.JiLongShiAndObject["基隆市第二次降雨機率"]!, pop3: self.JiLongShiAndObject["基隆市第三次降雨機率"]!, mint1: self.JiLongShiAndObject["基隆市第一次最低溫"]!, mint2: self.JiLongShiAndObject["基隆市第二次最低溫"]!, mint3: self.JiLongShiAndObject["基隆市第三次最低溫"]!, ci1: self.JiLongShiAndObject["基隆市第一次舒適狀況"]!, ci2: self.JiLongShiAndObject["基隆市第二次舒適狀況"]!, ci3: self.JiLongShiAndObject["基隆市第三次舒適狀況"]!, maxt1: self.JiLongShiAndObject["基隆市第一次最高溫"]!, maxt2: self.JiLongShiAndObject["基隆市第二次最高溫"]!, maxt3: self.JiLongShiAndObject["基隆市第三次最高溫"]!))
                            self.members.append(Member(name: "澎湖縣", wx1: self.PengHuXianAndObject["澎湖縣第一次天氣狀況"]!, wx2: self.PengHuXianAndObject["澎湖縣第二次天氣狀況"]!, wx3: self.PengHuXianAndObject["澎湖縣第三次天氣狀況"]!, pop1: self.PengHuXianAndObject["澎湖縣第一次降雨機率"]!, pop2: self.PengHuXianAndObject["澎湖縣第二次降雨機率"]!, pop3: self.PengHuXianAndObject["澎湖縣第三次降雨機率"]!, mint1: self.PengHuXianAndObject["澎湖縣第一次最低溫"]!, mint2: self.PengHuXianAndObject["澎湖縣第二次最低溫"]!, mint3: self.PengHuXianAndObject["澎湖縣第三次最低溫"]!, ci1: self.PengHuXianAndObject["澎湖縣第一次舒適狀況"]!, ci2: self.PengHuXianAndObject["澎湖縣第二次舒適狀況"]!, ci3: self.PengHuXianAndObject["澎湖縣第三次舒適狀況"]!, maxt1: self.PengHuXianAndObject["澎湖縣第一次最高溫"]!, maxt2: self.PengHuXianAndObject["澎湖縣第二次最高溫"]!, maxt3: self.PengHuXianAndObject["澎湖縣第三次最高溫"]!))
                            self.members.append(Member(name: "彰化縣", wx1: self.ZhangHuaXianAndObject["彰化縣第一次天氣狀況"]!, wx2: self.ZhangHuaXianAndObject["彰化縣第二次天氣狀況"]!, wx3: self.ZhangHuaXianAndObject["彰化縣第三次天氣狀況"]!, pop1: self.ZhangHuaXianAndObject["彰化縣第一次降雨機率"]!, pop2: self.ZhangHuaXianAndObject["彰化縣第二次降雨機率"]!, pop3: self.ZhangHuaXianAndObject["彰化縣第三次降雨機率"]!, mint1: self.ZhangHuaXianAndObject["彰化縣第一次最低溫"]!, mint2: self.ZhangHuaXianAndObject["彰化縣第二次最低溫"]!, mint3: self.ZhangHuaXianAndObject["彰化縣第三次最低溫"]!, ci1: self.ZhangHuaXianAndObject["彰化縣第一次舒適狀況"]!, ci2: self.ZhangHuaXianAndObject["彰化縣第二次舒適狀況"]!, ci3: self.ZhangHuaXianAndObject["彰化縣第三次舒適狀況"]!, maxt1: self.ZhangHuaXianAndObject["彰化縣第一次最高溫"]!, maxt2: self.ZhangHuaXianAndObject["彰化縣第二次最高溫"]!, maxt3: self.ZhangHuaXianAndObject["彰化縣第三次最高溫"]!))
                            self.members.append(Member(name: "連江縣", wx1: self.LianJiangXianAndObject["連江縣第一次天氣狀況"]!, wx2: self.LianJiangXianAndObject["連江縣第二次天氣狀況"]!, wx3: self.LianJiangXianAndObject["連江縣第三次天氣狀況"]!, pop1: self.LianJiangXianAndObject["連江縣第一次降雨機率"]!, pop2: self.LianJiangXianAndObject["連江縣第二次降雨機率"]!, pop3: self.LianJiangXianAndObject["連江縣第三次降雨機率"]!, mint1: self.LianJiangXianAndObject["連江縣第一次最低溫"]!, mint2: self.LianJiangXianAndObject["連江縣第二次最低溫"]!, mint3: self.LianJiangXianAndObject["連江縣第三次最低溫"]!, ci1: self.LianJiangXianAndObject["連江縣第一次舒適狀況"]!, ci2: self.LianJiangXianAndObject["連江縣第二次舒適狀況"]!, ci3: self.LianJiangXianAndObject["連江縣第三次舒適狀況"]!, maxt1: self.LianJiangXianAndObject["連江縣第一次最高溫"]!, maxt2: self.LianJiangXianAndObject["連江縣第二次最高溫"]!, maxt3: self.LianJiangXianAndObject["連江縣第三次最高溫"]!))
                            
                            
//                            for index in 0...2{
//                            for item in weather{
//                                self.dataTime.append(item.records.location[index].weatherElement[index].time[index].startTime)
//                                self.dataTime.append(item.records.location[index].weatherElement[index].time[index].endTime)
//                                }
//                            }
//                            for index in 0...4{
//                            for item in weather{
//                                self.elementName.append(item.records.location[index].weatherElement[index].elementName)
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
                            
                            self.tableView.reloadData()
                            
                            
//
                            
                        
//                            print(self.locationName.count)
//                            print(self.locationName)
//                            print(self.parameter)
                            
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        let memeber = members[indexPath.row]
        cell.nameLabel.text = memeber.name
        cell.locationLabel.text = memeber.maxt1+"°C"
        cell.typeLabel.text = memeber.mint1+"°C"
        //cell.nameLabel.text = locationName[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: cityImages[indexPath.row])
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
        if segue.identifier == "segue_vc_to_myvc"{
            if let row = tableView.indexPathForSelectedRow?.row {
                let infoViewController = segue.destination as? SecondViewController
                infoViewController?.member = members[row]
            }
        }
        }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
