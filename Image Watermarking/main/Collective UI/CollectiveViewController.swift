//
//  CollectiveViewController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 14/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage
import Alamofire

class CollectiveViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollection", for: indexPath) as! ColCollectionViewCell

        //Init Cell

        Alamofire.request("http://version1.api.memegenerator.net/Generators_Select_ByPopular").responseJSON { (data) in
            if (data.result.value) != nil {

                //Init Var
                let json = JSON(data.result.value)
                let imageUrl = json["result"][indexPath.row]["imageUrl"].string


                //Tembak Image!
                DispatchQueue.global(qos: .background).async {

                    let Ranking = json["result"][indexPath.row]["ranking"].int!
                    let textTitle = json["result"][indexPath.row]["displayName"].string!;
                    print("#Checking : \(Ranking)")


                    DispatchQueue.main.async {

                        cell.imageHolder.contentMode = UIViewContentMode.center

                        if Ranking == 1 {

                            cell.textHolder.textColor           = UIColor.white
                            cell.textHolder.backgroundColor     = UIColor.yellow
                            cell.textHolder.layer.cornerRadius  = 2.5
                            cell.textHolder.text                = textTitle

                            cell.textRanking.text      = "Ranking 1 of \(json.count)"
                            cell.textRanking.textColor = UIColor.orange

                        }else if Ranking == 2 {

                            cell.textHolder.textColor  = UIColor.green
                            cell.textHolder.text       = textTitle
                            cell.textRanking.text      = "Ranking 2 of \(json.count)"
                            cell.textRanking.textColor = UIColor.green

                        }else if Ranking == 3 {

                            cell.textHolder.textColor = UIColor.cyan
                            cell.textHolder.text      = textTitle
                            cell.textRanking.text      = "Ranking 3 of \(json.count)"
                            cell.textRanking.textColor = UIColor.green

                        }else{

                            cell.textHolder.textColor  = UIColor.darkGray
                            cell.textHolder.text       = textTitle
                            cell.textRanking.text      = "Ranking \(Ranking) of \(json.count)"
                            cell.textRanking.textColor = UIColor.gray

                        } // end Init Object
                    }

                    cell.imageHolder.sd_setImage(with: URL(string: imageUrl!), completed: nil)

                }
            }
        }

        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

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
