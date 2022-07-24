//
//  HomeTableViewCell.swift
//  News
//
//  Created by apple on 22/07/2022.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    


    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    
    @IBOutlet weak var articleAuther: UILabel!
    
    @IBOutlet weak var articleDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
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
        self.articleDate.text = article.publishedAt
        self.articleAuther.text = article.author
        self.articleDescription.text = article.description
        
    }

    
}
