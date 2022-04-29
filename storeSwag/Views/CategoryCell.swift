//
//  CategoryCellTableViewCell.swift
//  storeSwag
//
//  Created by Danylo Kushlianskyi on 27.04.2022.
//

import UIKit

class CategoryCell: UITableViewCell{

    @IBOutlet weak var categoryImage:UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!

    func updateViews(category: Category){
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title 
    }
    
  

}
