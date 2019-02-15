//
//  ViewController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 12/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var imageViewTestAutoLayouting : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViewTestAutoLayouting.sd_setImage(with:
            URL(string: "https://images.unsplash.com/photo-1548371836-9f0b75a62d8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
                                               completed: nil)
        imageViewTestAutoLayouting.contentMode = UIViewContentMode.scaleAspectFill
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

