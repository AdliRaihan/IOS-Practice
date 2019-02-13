//
//  LandingViewController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 12/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var imageViewerTest:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initJSON()
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


    open func initJSON(){
        print("Hello JSON")
        let apiMeme = "http://version1.api.memegenerator.net/Generators_Select_ByPopular"

        let apiGenerator = URL(string: apiMeme)
        if let unwrappedurl = apiGenerator{
        }

        URLSession.shared.dataTask(with: URL(string: apiMeme)!) { (data, response, err) in
            if(err==nil){
                guard let data = data else {return}
                //guard let dataString = String(data: data, encoding: .utf8) else {return}
                do{
                    let resultSet = try JSONDecoder().decode(popular.self , from: data)
                    print("Data Koe")
                    print(resultSet)
                    print("Data kuhn\n\n\n\n\n\n\n\n\n\n")
                    let cleanURL = resultSet.result[0].imageUrl!
                    print(cleanURL)

                    // masih belum jalan ternyata . . ..  .

                    if let data2 = try? Data(contentsOf: URL(string: cleanURL)!) {
                        if let image = UIImage(data: data){
                            self.imageViewerTest.contentMode = UIViewContentMode.scaleAspectFit
                            self.imageViewerTest.image = image
                            DispatchQueue.main.async {
                                self.imageViewerTest.contentMode = UIViewContentMode.scaleAspectFit
                                self.imageViewerTest.image = image
                            }
                        }
                    }

                }catch let jsonErr{
                    print("Error : \(jsonErr)")
                }

            }else{
                print("========ERROR========")
                print(err)
            }
            }.resume()
    }

}
