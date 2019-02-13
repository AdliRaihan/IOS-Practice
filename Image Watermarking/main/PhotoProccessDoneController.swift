//
//  PhotoProccessDoneController.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 12/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class PhotoProccessDoneController: UIViewController {

    /* Init Var */
    @IBOutlet weak var imageEditing : UIImageView!
    
    open var images : UIImage!
    open var nameWatermark: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        imageEditing.image = imageProcessing(imageSource: images)
        imageEditing.contentMode = UIViewContentMode.scaleAspectFit
        // Do any additional setup after loading the view.
    }


    /* Tembak Image  [ Core Graphics ] */

    func imageProcessing (imageSource:UIImage) -> UIImage{
        let watermarkText:NSString = nameWatermark! as NSString
        let fontInit = UIFont(name: "GeezaPro", size: imageSource.size.width/16)!

        // Initialize
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(imageSource.size, false, scale)
        // End Init

        let textFontAttribute = [
            NSAttributedStringKey.font : fontInit,
            NSAttributedStringKey.foregroundColor : UIColor.white.cgColor
            ] as [NSAttributedStringKey : Any]

        // Drawer
        imageSource.draw(in: CGRect(x: 0, y: 0, width: imageSource.size.width, height: imageSource.size.height))
        watermarkText.draw(in: CGRect(x: images.size.width/3.5, y: images.size.height/1.15, width: images.size.width, height: images.size.height), withAttributes: textFontAttribute as [NSAttributedStringKey : Any]?)
        // end Drawer

        // Building Logo circle
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: images.size.width, height: images.size.height))

        let Logo = renderer.image { (contextBuilder) in
            contextBuilder.cgContext.addEllipse(in: CGRect(x: 50, y: 50, width: (images.size.width/4), height: (images.size.width/4)-50))
            contextBuilder.cgContext.setFillColor(UIColor.darkGray.cgColor)
            contextBuilder.cgContext.fillPath()
        }

        Logo.draw(at: CGPoint(x: 50, y: 50))

        // Receive Image Drawer

        let imagesFinish = UIGraphicsGetImageFromCurrentImageContext()

        // Center Crop [ BUG ]
//        let cgImage = imagesFinish?.cgImage
//        let CntxImages:UIImage = UIImage(cgImage: cgImage!)
//        let CntxSize           = CntxImages.size
//        var posX:CGFloat       = 0.0
//        var posY:CGFloat       = 0.0
//        var screenSize = UIScreen.main.bounds
//        var cgwidth    = screenSize.width
//        var cgheight   = screenSize.height
//
//        if(CntxSize.width > CntxSize.height){
//            posX = ((CntxSize.width - CntxSize.height)/2)
//            posY = 0
//            cgwidth = CntxSize.width
//            cgheight = CntxSize.height
//        }else{
//            posX = 0
//            posY = ((CntxSize.width - CntxSize.height)/2)
//            cgwidth = CntxSize.width
//            cgheight = CntxSize.height
//        }
//
//        let rect :CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
//        let imageCrop = cgImage?.cropping(to: rect)
//        let imageSender:UIImage = UIImage(cgImage: imageCrop!, scale: (imagesFinish?.scale)!, orientation: (imagesFinish?.imageOrientation)!)

        UIGraphicsEndImageContext()
        return imagesFinish!
    }
    

    @IBAction func sharingIsCaring(){
        let alert = UIAlertController(title: "Sharing Options", message: "Pilih platform untuk membagikan foto ini.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Facebook", style: .default, handler: nil))

        let imageShared = UIImageJPEGRepresentation(self.imageEditing.image!, 400)

        /*
         *  Beberapa fungsi implementasi UIAlertAction
         *  Line Sharer Function
         *
         */

        alert.addAction(UIAlertAction(title: "LINE", style: .default, handler: {
            UIAlertAction in
            if(UIApplication.shared.canOpenURL(URL(string: "line://app")!)){

                let writePath = (NSTemporaryDirectory() as NSString).appendingPathComponent("line.igo")

                do{
                    try imageShared?.write(to: URL(fileURLWithPath: writePath),options: .atomic)
                }
                catch let error{
                    print ("Error : \(error)")
                }

                let FP = URL(fileURLWithPath: writePath)
                let documentController = UIDocumentInteractionController(url: FP)
                documentController.delegate = self as? UIDocumentInteractionControllerDelegate
                documentController.uti = "com.line"

                if UIDevice.current.userInterfaceIdiom == .phone {
                    documentController.presentOpenInMenu(from: self.view.bounds,in: self.view, animated: true)
                }
            }else{
                print("Application is not installed !")
            }
        }))

        /*
         Save Image Alert Button
         */

        alert.addAction(UIAlertAction(title: "SAVE", style: .default, handler: {
            UIAlertAction in
            UIImageWriteToSavedPhotosAlbum(self.imageEditing.image!,self, nil, nil)
        }))

        /*
         Instagram Alert Sharer Button
         */
        alert.addAction(UIAlertAction(title: "Instagram", style: .default, handler: {
            UIAlertAction in
            let instagram = URL(string: "instagram://app")
            if(UIApplication.shared.canOpenURL(instagram!)){
                let writePath = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.igo")

                do{
                    try imageShared?.write(to: URL(fileURLWithPath: writePath),options: .atomic)
                }
                catch let error{
                    print("Error : \(error)")
                }
                let filePath = URL(fileURLWithPath: writePath)
                let documentController = UIDocumentInteractionController(url: filePath)
                documentController.delegate = self as? UIDocumentInteractionControllerDelegate
                documentController.uti = "com.instagram.exlusivegram"

                if UIDevice.current.userInterfaceIdiom == .phone {
                    documentController.presentOpenInMenu(from: self.view.bounds, in: self.view, animated: true)
                }else{
                }
            }else{
                print("Instagram APP not found !")
            }
        }))
        self.present(alert, animated: true, completion: nil)
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
