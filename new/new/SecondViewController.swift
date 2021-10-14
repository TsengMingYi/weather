//
//  SecondViewController.swift
//  new
//
//  Created by 曾名艺 on 2020/12/27.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var infoLabel : UILabel!
    @IBOutlet weak var Wx1 : UILabel!
    @IBOutlet weak var Pop1 : UILabel!
    @IBOutlet weak var Mint1 : UILabel!
    @IBOutlet weak var Maxt1 : UILabel!
    @IBOutlet weak var CI1 : UILabel!
    @IBOutlet weak var weather : UILabel!
    @IBOutlet weak var weather1 : UILabel!
    @IBOutlet weak var weather2 : UILabel!
    @IBOutlet weak var weather3 : UILabel!
    @IBOutlet weak var firstImageView : UIImageView!
    @IBOutlet weak var secondImageView : UIImageView!
    @IBOutlet weak var thredImageView : UIImageView!
    @IBOutlet weak var fourImageView : UIImageView!
    
    var member:Member?
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.font = infoLabel.font.withSize(30)
        weather.font = weather.font.withSize(30)
        infoLabel.text = member?.name
        Wx1.text = member?.wx1
        Pop1.text = member!.pop1+"%"
        Mint1.text = member!.mint1+"°C"
        Maxt1.text = member!.maxt1+"°C"
        CI1.text = member?.ci1
        weather.text = member!.maxt1+"°C"
        weather1.text = member!.maxt1+"°C"
        weather2.text = member!.maxt2+"°C"
        weather3.text = member!.maxt3+"°C"
        
        if ((member?.wx1) != nil){
            if member!.wx1.contains("雨"){
                firstImageView.image = UIImage(named: "001lighticons-24.svg")
                secondImageView.image = UIImage(named: "001lighticons-24.svg")
            }else if member!.wx1.contains("多雲"){
                firstImageView.image = UIImage(named: "001lighticons-25.svg")
                secondImageView.image = UIImage(named: "001lighticons-25.svg")
            }else if member!.wx1.contains("陰"){
                firstImageView.image = UIImage(named: "001lighticons-17.svg")
                secondImageView.image = UIImage(named: "001lighticons-17.svg")
            }else{
                firstImageView.image = UIImage(named: "001lighticons-02.svg")
                secondImageView.image = UIImage(named: "001lighticons-02.svg")
            }
        }
        if ((member?.wx2) != nil){
            if member!.wx2.contains("雨"){
                thredImageView.image = UIImage(named: "001lighticons-24.svg")
            }else if member!.wx2.contains("多雲"){
                thredImageView.image = UIImage(named: "001lighticons-25.svg")
            }else if member!.wx2.contains("陰"){
                thredImageView.image = UIImage(named: "001lighticons-17.svg")
            }else{
                thredImageView.image = UIImage(named: "001lighticons-02.svg")
            }
        }
        if ((member?.wx3) != nil){
            if member!.wx3.contains("雨"){
                fourImageView.image = UIImage(named: "001lighticons-24.svg")
            }else if member!.wx3.contains("多雲"){
                fourImageView.image = UIImage(named: "001lighticons-25.svg")
            }else if member!.wx3.contains("陰"){
                fourImageView.image = UIImage(named: "001lighticons-17.svg")
            }else{
                fourImageView.image = UIImage(named: "001lighticons-02.svg")
            }
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
