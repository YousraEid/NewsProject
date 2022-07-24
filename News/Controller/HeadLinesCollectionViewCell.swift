//
//  HeadLinesCollectionViewCell.swift
//  News
//
//  Created by apple on 23/07/2022.
//

import UIKit
import Kingfisher

class HeadLinesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var articleTitle: UILabel!
    
    
    @IBOutlet weak var articleAuther: UILabel!
    
    func configureCell(article : article) {
        let imageUrl = URL(string: article.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png")
        self.articleImage.kf.setImage(with: imageUrl) { result in
            
            switch result {
            case .success(let value):
                self.articleImage.image = value.image
            case .failure(let error):
                print("Error: \(error)")
            }
            }
            
        
        self.articleTitle.text = article.title
        self.articleAuther.text = article.author
       
        
    }
}
