//
//  RestaurantViewController.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class RestaurantViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    private var tableView : UITableView!;
    private var restaurantArray : Array<String> = ["bg_tims","bg_starb"];
    private var selectCount : Int = 0;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewDidLayoutSubviews() {
        if(!isUISetUpDone){
            self.title = "Restaurant";
            let backBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain, target: self, action: #selector(RestaurantViewController.onBackClick))
            self.navigationItem.leftBarButtonItem = backBarButton;
            
            self.scrollView?.isScrollEnabled = true;
            self.scrollView?.contentSize = CGSize(width: self.viewWidth(), height: self.viewHeight());
            
            prepareAndAdd_Views();
            isUISetUpDone = true;
        }
    }
    
    private func prepareAndAdd_Views() {
        
        self.tableView = UITableView(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: self.viewWidth(),
                                                   height: self.viewHeight()),
                                     style: .plain);
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.estimatedRowHeight = 250;
        //self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.separatorStyle = .none;
        self.tableView.register(UINib(nibName: "RestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "cell");
        self.tableView.backgroundColor = UIColor.white;
        self.tableView.allowsMultipleSelection = true;
        self.tableView.showsVerticalScrollIndicator = false;
        self.view.addSubview(self.tableView);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantTableViewCell;
        
        mycell.contentView.layer.cornerRadius = 10;
        //mycell.ivRestaurant.isHidden = true;
        mycell.ivRestaurant.image = UIImage(named: self.restaurantArray[indexPath.row]);
        mycell.selectionStyle = UITableViewCell.SelectionStyle.none
        //mycell.skillsLabel.text = restaurantArray[indexPath.row];
        return mycell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.navigationController?.pushViewController(MenuViewController(), animated: true);
    }
    
    @objc private func onBackClick(){
        self.navigationController?.popViewController(animated: true);
    }
}
