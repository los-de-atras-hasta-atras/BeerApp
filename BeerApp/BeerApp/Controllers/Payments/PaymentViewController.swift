//
//  PaymentViewController.swift
//  BeerApp
//
//  Created by Itzel GoOm on 10/26/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import UIKit
import Stripe

class PaymentViewController: UIViewController, STPAddCardViewControllerDelegate{
   

    @IBOutlet weak var cardTable: UITableView!
    
    var arrayCard:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cardMsj.text = ""

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addCardButton(_ sender: UIBarButtonItem) {
        //Setup add card
        let addCardViewController = STPAddCardViewController()
        addCardViewController.delegate = self
        
        //Present  add card
        let navigationController = UINavigationController(rootViewController: addCardViewController)
        present(navigationController, animated: true)
    
        
    }
    
    //MARK:  STPAddCardVC
    
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        //dismiss add card VC
        dismiss(animated: true)
        
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
        
        dismiss(animated: true)
        arrayCard.append(token.card!.last4)
//        cardMsj.text = "******\(token.card!.last4)"
        cardTable.reloadData()
        
    }
}

extension PaymentViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell
        let card =  arrayCard[indexPath.row]
        cell.textLabel?.text =  "**** **** **** \(card)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            arrayCard.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }

    }
    
    
    
}
