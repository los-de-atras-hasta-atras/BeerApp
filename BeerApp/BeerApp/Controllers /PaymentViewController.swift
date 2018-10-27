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
   
    
    @IBOutlet weak var cardMsj: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cardMsj.text = ""

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
        cardMsj.text = "******\(token.card!.last4)"
        
        
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
