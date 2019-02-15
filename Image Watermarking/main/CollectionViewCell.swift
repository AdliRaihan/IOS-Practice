//
//  CollectionViewCell.swift
//  Image Watermarking
//
//  Created by APCMBP001 on 13/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit



class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var _Something: UIImageView!
    @IBOutlet weak var _Something_Text: UILabel!

    func displayContent(Image:UIImage , Text:String){
        _Something.image = Image
        _Something_Text.text = Text
    }
    
}
