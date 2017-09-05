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
//--------------- Structure's ----------------
    struct DataCollection {
        var sectionData : String
        var cellData: [String]
        init(sectionData:String,cellData:[String]) {
            self.sectionData = sectionData
            self.cellData = cellData
        }
    }
    
//--------------- Variable's -----------------
    var dataObject = [DataCollection]()
   
//--------------- ViewDidLoad ----------------
    override func viewDidLoad() {
        super.viewDidLoad()                         // --- TableView dataSource, delegate........
        tableView.dataSource = self
        tableView.delegate = self
        
// -------- Assigning data in structure ------
        dataObject = [DataCollection(sectionData: "BiCycle's",cellData: ["Atlas","Avon","Hero","TrekBicycle","Atlas","Avon","Hero","TrekBicycle"]),
            DataCollection(sectionData:"Bike's",cellData:["CRF","F3","Fazer","Glamour","Street Triple","z1","CRF","F3","Fazer","Glamour","Street Triple","z1"]),
            DataCollection(sectionData:"Car's",cellData:["Ford","Swift","Vitara","Ford","Swift","Vitara","Ford","Swift","Vitara"]),
        DataCollection(sectionData:"Mobile's",cellData:["lenovo","micromax","moto","videocone","lenovo","micromax","moto","videocone"])]

    }
//--------------- Button Action's -------------

    
}

//================ Extension of TableViewVC class =============
extension TableViewVC: UITableViewDataSource,UITableViewDelegate{
    
//    --------- Number of section in tableview -----------
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataObject.count
    }
    
//    --------- Title for section ----------
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return dataObject[section].sectionData
    }
//    -------- Method for display header -------
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
        cell.populate(with: dataObject[indexPath.section].cellData)
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
    var cellData = [String]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
//------------- Method to get data from tableviewvc ------------
    func populate(with data : [String]) {
        self.cellData = data
        self.collectionView.reloadData()
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
        print(cellData.count)
    return cellData.count
    }
    
//----------- Cell for ItemAt IndexPath ------------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellData", for: indexPath) as? CollectionCellData else{fatalError()}
        cell.imageOnCollectionCell.image = UIImage(named: cellData[indexPath.row])
        return cell
    }
}















