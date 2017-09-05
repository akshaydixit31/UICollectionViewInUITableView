//
//  TableViewVC.swift
//  UICollectionViewInUITableView
//
//  Created by Appinventiv Technologies on 05/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController {
//--------------- Outlet's -------------------
    @IBOutlet weak var tableView: UITableView!
//--------------- Variable's -----------------
//    let dataArray = ["Fazer","Ford","Glamour","lenovo","micromax","moto","Street Triple","Swift","videocone","Vitara"]
    let  dataInTableSection = ["BiCycle's","Bike's","Car's","Mobile's"]
    let biCycleArray = ["Atlas","Avon","Hero","TrekBicycle","Atlas","Avon","Hero","TrekBicycle"]
    let bikeArray = ["CRF","F3","Fazer","Glamour","Street Triple","z1","CRF","F3","Fazer","Glamour","Street Triple","z1"]
    let carArray = ["Ford","Swift","Vitara","Ford","Swift","Vitara","Ford","Swift","Vitara"]
    let mobileArray = ["lenovo","micromax","moto","videocone","lenovo","micromax","moto","videocone"]
//--------------- ViewDidLoad ----------------
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
//--------------- Button Action's -------------

    
}
//================ Extension of TableViewVC class =============
extension TableViewVC: UITableViewDataSource,UITableViewDelegate{
//    --------- Number of section in tableview -----------
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataInTableSection.count
    }
//    --------- Title for section ----------
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return dataInTableSection[section]
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.backgroundView?.backgroundColor = UIColor.brown
        header.textLabel?.textAlignment = .center
        

    }
//    --------- Number of row's in tableview -------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
//    --------- CellForRow in tableView ------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellData", for: indexPath) as? TableCellData else{fatalError()}
        cell.sections = indexPath.section
        cell.biCycleArray = self.biCycleArray
        cell.bikeArray = self.bikeArray
        cell.carArray = self.carArray
        cell.mobileArray = self.mobileArray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
//================ Class For tableview cell ================
class TableCellData: UITableViewCell {
//    ---------- Outlet's -----------------
    var sections = 0
    var biCycleArray = [String]()
    var bikeArray = [String]()
    var carArray = [String]()
    var mobileArray = [String]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}
//================ Class for collectionView cell ============
class CollectionCellData: UICollectionViewCell {
//    ------- Outlet's ---------
    @IBOutlet weak var imageOnCollectionCell: UIImageView!
    
}
//============== Extension for TableCellData Class ==============
extension TableCellData: UICollectionViewDataSource,UICollectionViewDelegate{
//------------ Number of item in collection view ------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      switch sections {
        case 0:
            return biCycleArray.count
        case 1:
            return bikeArray.count
        case 2:
            return carArray.count
        default:
            return mobileArray.count
        }
    }
//----------- Cell for ItemAt IndexPath ------------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellData", for: indexPath) as? CollectionCellData else{fatalError()}
       switch sections {
        case 0:
            cell.imageOnCollectionCell.image = UIImage(named: biCycleArray[indexPath.row])
       case 1:
            cell.imageOnCollectionCell.image = UIImage(named: bikeArray[indexPath.row])
        case 2:
            cell.imageOnCollectionCell.image = UIImage(named: carArray[indexPath.row])
        default:
             cell.imageOnCollectionCell.image = UIImage(named: mobileArray[indexPath.row])
        }
        return cell
    }
}















