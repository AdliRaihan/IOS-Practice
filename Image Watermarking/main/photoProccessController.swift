//
//  photoProccessController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 12/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class photoProccessController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    /* Open Var */
    @IBOutlet weak var imageTarget : UIImageView!
    open var watermarkName:String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageTakers()
        // Do any additional setup after loading the view.

        self.imageTarget.contentMode = UIViewContentMode.scaleAspectFit
        self.imageTarget.isUserInteractionEnabled = true
        self.imageTarget.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.photoProccessSegue)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*Image Takers Func*/
    func imageTakers(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){

            /* Masih Memakai Simulator */

        }else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){

            /*Reminder that...*/
            print("Kamu tidak mempunyai akses camera!")

            /*Opener Photo Lib..*/
            let Opener = UIImagePickerController()
            Opener.allowsEditing = false
            Opener.delegate = self
            self.present(Opener, animated: true, completion: nil)
        }
    }

    /* Image Takers Func -> Tembak data ke ImageView */

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let finish = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageTarget.image = finish
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {    }

    /* end of image takers function */

    @objc func photoProccessSegue(){
        print("Clicked!")
        self.performSegue(withIdentifier: "photoProccessSegDone", sender: Any?.self)
    }

  //|
  //V

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let PPhotoDone = segue.destination as? PhotoProccessDoneController
        PPhotoDone?.images = imageTarget.image
        PPhotoDone?.nameWatermark = watermarkName
    }


}
