//
//  HomeViewController.swift
//  BeerApp
//
//  Created by Angel Ricardo Solsona Nevero on 26/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var searchField:UITextField!
    
    var arrayBeers:[Beer] = []{
        didSet{
            menuCollectionView.reloadData()
        }
    }
    var arrayFiltered:[Beer] = []
    var isfilterring = false
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = "Products"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.definesPresentationContext = true
        navigationItem.titleView = searchController.searchBar
        // Do any additional setup after loading the view.
        searchController.hidesNavigationBarDuringPresentation = false
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadData(){
        BeerService.sharedInstance.all { [weak self] (beers) in
            self!.arrayBeers = beers
        }
    }


}

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.isfilterring ? self.arrayFiltered.count : arrayBeers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BeerCollectionViewCell
        let beer  = arrayBeers[indexPath.row]
        cell.beerName.text = beer.name
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail_segue", sender: nil)
    }
}

extension HomeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
           print("print",text)
            isfilterring = true
            arrayFiltered = arrayBeers.filter({$0.name == text})
        }else{
            isfilterring = false
        }
        
        menuCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Se cancelo la busqueda")
    }
    
    
}
