//
//  MyViewController.swift
//  new
//
//  Created by 曾名艺 on 2020/12/12.
//

import UIKit

class MyViewController: UIViewController {
    var str:String?
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let str = str{
            print(str)
            label.text = str
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
