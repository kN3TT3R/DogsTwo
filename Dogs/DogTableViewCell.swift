//
//  DogTableViewCell.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 6/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


import UIKit


class DogTableViewCell: UITableViewCell {

    
    //MARK: Properties
    @IBOutlet weak var dogPhotoImageView: UIImageView!
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dogBreedLabel: UILabel!


    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
