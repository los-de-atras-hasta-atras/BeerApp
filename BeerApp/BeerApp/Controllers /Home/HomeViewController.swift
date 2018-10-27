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
    
    var arrayBeers:[String] = ["Prueba 1","Prueba 1","Prueba 1","Prueba 1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func serachBeer(_ sender:UITextField){
        print("Buscando", sender.text)
    }

}

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayBeers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BeerCollectionViewCell
        let item  = arrayBeers[indexPath.row]
        cell.beerName.text = item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail_segue", sender: nil)
    }
    
    
    
    
}
