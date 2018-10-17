//
//  HomeVC.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
import Firebase
class HomeVC: UIViewController {
    //Outlets
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tabelview
        tabelView.dataSource = self
        tabelView.delegate = self
        
        DataService.instanc.getCcountriesData(withApiurl: API_URL) { (status, error) in
            if status{
                self.tabelView.reloadData()
            }else{
                self.showAlert(title: "Error", message: "\(String(describing: error?.localizedDescription))", okTitle: "ok", completion: nil)
            }
        }
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
        return DataService.instanc.countryArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: COUNTRY_CELL, for: indexPath) as? CountriesCell else{
            return UITableViewCell()
        }
        let oneElement = DataService.instanc.countryArray[indexPath.row]
        cell.configureCell(country: oneElement, indexPath: indexPath)
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
