//
//  photoController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 12/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit





class photoController: UIViewController {

    /* Object name */
    @IBOutlet weak var setWaterMarkName: UITextField!
    @IBOutlet weak var segButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func performSegueManual() {
        self.performSegue(withIdentifier: "takingPhotoSection", sender: Any?.self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestinationController = segue.destination as? photoProccessController
        DestinationController?.watermarkName = (setWaterMarkName.text)!
    }




}
