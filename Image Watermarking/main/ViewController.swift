//
//  ViewController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 12/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

struct popular : Decodable{
    let success:Bool
    let elapsedMS:Int
    let warning:String?
    let result:[result]
}
struct result : Decodable {
    let generatorID:Int?
    let imageID:Int?
    let displayName:String?
    let urlName:String?
    let totalVotesScore:Int?
    let instancesCount:Int?
    let ranking:Int?
    let imageUrl:String?

}

struct entityVotesSummary : Decodable {
    let entityName:String?
    let entityID:Int?
    let totalVotesSum:Int?
    let userID:Int?
    let userVoteScore:Int?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()        // Dispose of any resources that can be recreated.
    }

    /*
     Pengaturan Attr Object
    */

    @IBOutlet weak var startBtn : UIButton!
    func initializeButton(){
        startBtn.layer.borderWidth = 0.25
        startBtn.layer.borderColor = UIColor.darkGray.cgColor
    }

    /*
     Prepare
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


    /*
     Test JSON
     */
    @IBOutlet weak var imageFromUrl : UIImageView!


    /*
     Embed Picture
     */



    

}

