//
//  HomeVC.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
import Firebase
import TransitionButton
class HomeVC: UIViewController {
    //Outlets
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var errorView: GradientView!
    @IBOutlet weak var errorLbl: UILabel!
   
    
    //Variable
    var countryArray = [Country]()
    
    let reachabilty = Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tabelview
        tabelView.dataSource = self
        tabelView.delegate = self
        
        //Internet Detection
        reachabilty?.whenReachable = {[weak self] _ in
            guard let self = self else{return}
            DispatchQueue.main.async {
                self.getData()
                self.hideViewError()
            }
        }
        reachabilty?.whenUnreachable = { [weak self] _ in
            guard let self = self else{return}
            DispatchQueue.main.async {
                self.countryArray = []
                self.tabelView.reloadData()
                self.showViewError()
            }
        }
        
        // Recive  internet notifiction status
        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged(notifi:)), name:Notification.Name.reachabilityChanged , object: reachabilty)
        // startNotification
        do{
            try reachabilty?.startNotifier()
        }catch{
            showAlert(title: " Internet Error ", message: "Can't detected internet Connection ", okTitle: "ok", completion: nil)
        }
        
    }
    
    //Function
    //handle internet Notification
    @objc func internetChanged(notifi:Notification){
        let reachabilty = notifi.object as! Reachability
        if reachabilty.connection != .none{
            // check connction if wifi or data
        if reachabilty.connection == .cellular{
                    DispatchQueue.main.async {
                      self.hideViewError()
                       }
                 }else{
                    DispatchQueue.main.async {
                      self.hideViewError()
                    }
                }//if reachabilty.connection == .cellular
          }else{
            DispatchQueue.main.async {
                   self.showViewError()
            }
        }//if
    }
    //two function hide or show view error
    func hideViewError(){
        self.tabelView.isHidden = false
        self.errorLbl.isHidden = true
        self.errorView.isHidden = true
    }
    func showViewError(){
        self.tabelView.isHidden = true
        self.errorView.isHidden = false
        self.errorLbl.isHidden = false
    }
    
    //This function help to get data from api
    func getData(){
        DataService.instanc.getCountriesData(api: API_URL) { [weak self ] (countries, error) in
            guard let self = self else{return}
            if error != nil {
                self.showViewError()
                self.showAlert(title: "Internet connection Error ", message:(error?.localizedDescription)!, okTitle: "ok", completion: nil)
            }else{
                //handle respons if have data or not  ..
                if countries!.count > 0 {
                    self.countryArray = countries!
                    self.tabelView.reloadData()
                }else{
                   self.hideViewError()
                }//if
                
            }//if
            
        }//closure


    }
    
    //Action
    @IBAction func logoutBtnWasPressed(_ sender: Any) {
        logoutAlert(title: "Logout Message ", message: "Are you want to logout from Countries Flags ?", okTitle: "LOGOUT") { (action) in
            do{
                try Auth.auth().signOut()
                guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: LOGIN_VC) as? LoginVC else{return }
                self.present(loginVC, animated: true, completion: nil)
            }catch{
                self.showAlert(title: "Error logout message", message: "\(error.localizedDescription)", okTitle: "ok ", completion: nil)
            }
        }
    }
    
    
}
//Extension

extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: COUNTRY_CELL, for: indexPath) as? CountriesCell else{
            return UITableViewCell()
        }
        let oneElement = countryArray[indexPath.row]
        cell.configureCell(country: oneElement)
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //  Animation Cell
        cell.transform = CGAffineTransform(translationX: 0 , y: tableView.rowHeight/2)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.alpha = 0
        
        UIView.beginAnimations("rotation", context: nil)
        UIView.setAnimationDuration(0.5)
        cell.transform = CGAffineTransform(translationX: 0, y: 0)
        cell.alpha = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        UIView.commitAnimations()
    }
}
