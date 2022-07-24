//
//  HeadLineViewController.swift
//  News
//
//  Created by apple on 23/07/2022.
//

import UIKit
import Alamofire

class HeadLineViewController: UIViewController {
    
    let cell = "CountriesCollectionViewCell"
    var articles : [article] = []
    var countryId = ""


    @IBOutlet weak var headLineCollectionView: UICollectionView!
    

    @IBOutlet weak var countriesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cellSetUp()
        
        headLineCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
       
        
        DispatchQueue.global().async {
           self.performRequestWithAlamofire(countryID: "us")

        }


    }
    
    // setUp for cell.
    func cellSetUp(){
        let countryNip = UINib(nibName: cell, bundle: nil)
        self.countriesCollectionView.register(countryNip, forCellWithReuseIdentifier: cell)
    }
    
    func performRequestWithAlamofire(countryID : String) {
        
        let parameters : Parameters = ["country":countryID, "apiKey" : "4d24df0edad140228877a63cbaca4688"]
        let url = "https://newsapi.org/v2/top-headlines"
        AF.request(url, parameters: parameters).responseDecodable {
            (response :DataResponse<News, AFError>) in
            switch response.result {
            case .success(let articleResponse):
                print("Success")
                //print(articleResponse)
                self.articles = articleResponse.articles
                print(self.articles)
                self.headLineCollectionView.reloadData()
            case .failure(let error):
                print("Error")
                print(error)
        }
        
        }
    }
    
    

}

extension HeadLineViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.headLineCollectionView {
            return articles.count
        }else  {
            return countries.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.countriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath)as!CountriesCollectionViewCell
            cell.configureCell(with: countries[indexPath.row])
            return cell
        }else{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadLinesCollectionViewCell", for: indexPath)as! HeadLinesCollectionViewCell
            
            cell.configureCell(article: articles[indexPath.row])
        
        return cell
        }
    }
    
    
    
}

extension HeadLineViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.countriesCollectionView {
            return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.height)
        }else{
        return CGSize(width: 200, height: 300)
        }
    }
}

extension HeadLineViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == countriesCollectionView {
            countryId = countries[indexPath.row].countryName
            DispatchQueue.global().async {
                self.performRequestWithAlamofire(countryID: self.countryId)
            }
            
           // self.headLineCollectionView.reloadData()
        }else{
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewControllerViewController")as? WebViewControllerViewController
            
            vc?.url = articles[indexPath.row].url ?? "https://www.google.com"


            
             navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
}


