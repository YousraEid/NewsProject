//
//  DetailsViewController.swift
//  News
//
//  Created by apple on 24/07/2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    var article : article?

    @IBOutlet weak var articleOuther: UILabel!
    
    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var articleDate: UILabel!
    
    @IBOutlet weak var articleImage: UIImageView!
    
    
    @IBOutlet weak var articleDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTheView()

        // Do any additional setup after loading the view.
    }
    
    func setUpTheView(){
        self.articleOuther.text = article?.author
        self.articleTitle.text = article?.title
        self.articleDate.text = article?.publishedAt
        self.articleDescription.text = article?.description
        
        let imageUrl = URL(string: article?.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png")
        self.articleImage.kf.setImage(with: imageUrl) { result in
            
            switch result {
            case .success(let value):
                self.articleImage.image = value.image
            case .failure(let error):
                print("Error: \(error)")
            }
            }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
