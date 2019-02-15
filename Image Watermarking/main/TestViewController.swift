//
//  TestViewController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 13/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

/* Data Structur For Meme Generator REST API */

struct popular : Decodable {
    let success:Bool
    let elapsedMS:Int
    let warning:String?
    let result:[result]

    init(dictionary:getAPIJSON) {
        self.success = dictionary["success"] as! Bool
        self.elapsedMS = dictionary["elapsedMS"] as! Int
        self.warning = dictionary["warning"] as? String
        self.result = dictionary["result"]  as! Array
    }
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




/* Beres */


class TestViewController: UIViewController, UICollectionViewDelegate ,UICollectionViewDataSource{
    @IBOutlet weak var collection:UICollectionView!



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("test")
        return nil;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }



    /*
     // MARK : - InitiliazeJSON-Generator0-0Meme
    */





    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
