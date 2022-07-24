//
//  HomeViewController.swift
//  News
//
//  Created by apple on 22/07/2022.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    let cell = "HomeTableViewCell"
    
    var articles : [article] = []
    var timer: Timer? = nil
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            self.fetchNews(searchString: "bitcoin")
        }
        searchBar.delegate = self
        newsTableView.delegate = self
        
        cellSetUp()
       

    }
    // setUp for cell.
    func cellSetUp(){
        let newsListNip = UINib(nibName: cell, bundle: nil)
        self.newsTableView.register(newsListNip, forCellReuseIdentifier: cell)
    }
    
    // request using alamofire
    
    func fetchNews(searchString: String) {
        let parameters : Parameters = ["q": searchString, "apikey" : "4d24df0edad140228877a63cbaca4688"]
        let url = "https://newsapi.org/v2/everything"
        AF.request(url, parameters: parameters).responseDecodable {
            (response :DataResponse<News, AFError>) in
            switch response.result {
            case .success(let articleResponse):
                print("Success")
                //print(articleResponse)
                self.articles = articleResponse.articles
                print(self.articles)
                self.newsTableView.reloadData()
            case .failure(let error):
                print("Error")
                print(error)
        }
        
        }
    }
    


}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleDescriptionLength = articles[indexPath.row].description?.count ?? 0
        let linesNumber : Int = Int(articleDescriptionLength / 25)
        let reqRowHeight = (linesNumber * 25) + 120
        newsTableView.rowHeight = CGFloat(reqRowHeight)
//        newsTableView.rowHeight = UITableView.automaticDimension
//        newsTableView.estimatedRowHeight = UITableView.automaticDimension
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! HomeTableViewCell
        cell.configureCell(article: articles[indexPath.row])
        return cell
    }
    
    
}

extension HomeViewController : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController")as? DetailsViewController
         
         //performRequestWithAlmoFireForLeagues(sportName: sports[indexPath.row].strSport)
         //vc?.leaguesVar = leagues
         //vc?.sportName = sports[indexPath.row].strSport
        vc?.article = articles[indexPath.row]

        
         
         
         
         navigationController?.pushViewController(vc!, animated: true)
    }
}

extension HomeViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {


        print("Text has changed")
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(HomeViewController.output), userInfo: searchText, repeats: false)
    }

    @objc func output(){
        print("2 Sec Passed")
        if timer?.userInfo != nil {
            print(timer?.userInfo as Any)
            let inputString = timer?.userInfo
            self.fetchNews(searchString: inputString as! String)
        }
        timer!.invalidate()
    }
}
