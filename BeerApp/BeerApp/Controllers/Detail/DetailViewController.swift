//
//  DetailViewController.swift
//  BeerApp
//
//  Created by Angel Ricardo Solsona Nevero on 26/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import UIKit
import NotificationBannerSwift
class DetailViewController: UIViewController {

    @IBOutlet weak var categoryProduct: UITableView!
    @IBOutlet weak var imageBeere: UIImageView!
    @IBOutlet weak var descriptionBeer: UILabel!
    var arrayCategory:[String] = ["Prueba"]
    var currentBeer:Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionBeer.text = currentBeer?.description
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
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

extension DetailViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell") as! CategoryTableViewCell
        cell.delegate = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
}

extension DetailViewController:CategoryTableViewCellDelegate{
    func addCategoryToOrder(cell: CategoryTableViewCell) {
        
        let indexPath = self.categoryProduct.indexPath(for: cell)
        print(indexPath!.row)
        
        let banner = NotificationBanner(title:"Producto agregado",subtitle: "Tu podructo ha sido agregado si deseas pedirlo has tap aqui",style: .info)
        banner.show(on: self)
        banner.autoDismiss = true
        banner.onTap = {
            self.tabBarController?.selectedIndex = 1
        }
        
    }
}
