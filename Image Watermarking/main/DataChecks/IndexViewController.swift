//
//  IndexViewController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 13/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import SwiftyJSON


var reuseIdentifier = "usera"
var testArray = ["asd","asd","def","fec","teC","pec","kkkkkk"]
var ImageMemeGenerator = [String]()

class IndexViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // Cell Init
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell

        // Mengisi value ke object
        cell.paramLabel.text = testArray[indexPath.row]

        let apiMeme = "http://version1.api.memegenerator.net/Generators_Select_ByPopular"

        URLSession.shared.dataTask(with: URL(string: apiMeme)!) { (data, response, err) in
            if(err==nil){
                guard let data = data else {return}
                let json = JSON(data)
                DispatchQueue.global(qos: .background).async {
                    if let data = try? Data(contentsOf: URL(string: json["result"][indexPath.row]["imageUrl"].string!)!) {
                        if let image = UIImage(data: data){
                            DispatchQueue.main.async {
                                cell.paramImage.contentMode = UIViewContentMode.center
                                cell.paramImage.image = image
                            }
                        }
                    }
                }
            }else{
                print("========ERROR========")
                print(err as Any)
            }

        }.resume()

        cell.backgroundColor = self.randomColor()
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
    {

        return 4;
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        return 1;
    }

    //UICollectionViewDatasource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 100
    }

    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getArray()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getArray(){
        var Iteration:Int = 0
        repeat{
            print("loopers")
            ImageMemeGenerator.append(APIClient.initJSON(iteration: Iteration))
            Iteration += 1
        }while(Iteration < 10)
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
