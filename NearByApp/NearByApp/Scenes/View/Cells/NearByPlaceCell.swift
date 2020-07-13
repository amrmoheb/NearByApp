//
//  NearByPlaceCell.swift
//  NearByApp
//
//  Created by developer on 10/07/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import UIKit

class NearByPlaceCell: UITableViewCell {
    @IBOutlet weak var Photo: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Adress: UILabel!
    
    var IsImageSeted = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func SetImage(Photo: Data)
    {
    
      self.Photo.image = UIImage(data: Photo)
        
    }
    func SetName(Name : String)  {
        self.Name.text = Name
    }
    func SetAdress(Adress : String)  {
           self.Adress.text = Adress
       }

}
