//
//  RestaurantViewController.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 09/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class OrderDetailsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    private var tableView : UITableView!;
    private var proceedBtn : UIButton!;
    private var totalAmountLabel : UILabel!;
    private var array : Array<String> = ["Coffee","Begeal","Soup","Donut"];
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
            let backBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain, target: self, action: #selector(OrderDetailsViewController.onBackClick))
            self.navigationItem.leftBarButtonItem = backBarButton;
            
            self.title = "Order Details";
            self.scrollView?.isScrollEnabled = true;
            self.scrollView?.contentSize = CGSize(width: self.viewWidth(), height: self.viewHeight());
            
            prepareAndAdd_Views();
            isUISetUpDone = true;
        }
    }
    
    private func prepareAndAdd_Views(){
        let title = UIUtil.standardLabel(text: "Cart items",
                                         x: 30,
                                         y: 30,
                                         width: self.viewWidth() - 30*2,
                                         height: 20,
                                         numberOfLines: 1,
                                         fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                         fontSize: 20);
        title.textColor = UIColor.darkGray;
        self.view.addSubview(title);
        
        self.tableView = UITableView(frame: CGRect(x: title.frame.origin.x,
                                                   y: title.frame.maxY + 10,
                                                   width: self.viewWidth() - 30*2,
                                                   height: self.viewHeight() - 120),
                                     style: .plain);
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.estimatedRowHeight = 70;
        self.tableView.rowHeight = UITableView.automaticDimension;
        self.tableView.separatorStyle = .singleLine;
        self.tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "cell");
        self.tableView.showsVerticalScrollIndicator = false;
        self.tableView.tableFooterView = UIView(frame: CGRect(x: 0,
                                                              y: 0,
                                                              width: tableView.frame.size.width,
                                                              height: 1));
        self.view.addSubview(self.tableView);
        
        
        let totalView = UIView(frame: CGRect(x: 0,
                                             y: self.viewHeight() - 110,
                                             width: self.viewWidth(),
                                             height: 50));
        totalView.backgroundColor = AppConstants.COLOR_2;
        self.view.addSubview(totalView);
        
        let totalLabel = UIUtil.standardLabel(text: "Total",
                                              x: 15,
                                              y: 10,
                                              width: 100,
                                              height: 30,
                                              numberOfLines: 1,
                                              fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                              fontSize: 25);
        totalLabel.textColor = UIColor.black;
        totalView.addSubview(totalLabel);
        
        self.totalAmountLabel = UIUtil.standardLabel(text: "30$",
                                              x: totalView.frame.maxX - 50,
                                              y: 10,
                                              width: 100,
                                              height: 30,
                                              numberOfLines: 1,
                                              fontName: AppConstants.HELVETICA_NEUE_BOLD,
                                              fontSize: 25);
        self.totalAmountLabel.textColor = AppConstants.COLOR_3;
        self.totalAmountLabel.sizeToFit();
        totalView.addSubview(self.totalAmountLabel);
        self.totalAmountLabel.frame.origin.x = totalView.frame.maxX - self.totalAmountLabel.frame.width - 15;
        
        
        self.proceedBtn = UIUtil.standardButton(title: "Proceed to payment",
                                                       x: self.tableView.frame.origin.x,
                                                       y:  self.viewHeight() - 60,
                                                       width: self.viewWidth(),
                                                       height: 60,
                                                       bgcolor: AppConstants.COLOR_1,
                                                       fontName: AppConstants.HELVETICA_NEUE,
                                                       fontSize: 20,
                                                       titleColor: UIColor.white,
                                                       enableRoundedCorners: false,
                                                       target: self,
                                                       action: #selector(OrderDetailsViewController.onProceedClick));
        //self.proceedBtn.layer.cornerRadius = 27;
        self.proceedBtn?.frame.origin.x = (self.viewWidth()/2) - ((self.proceedBtn?.frame.size.width)!/2);
        self.view.addSubview(self.proceedBtn!);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell;
        
        mycell.contentView.layer.cornerRadius = 10;
        mycell.lblItemName.text = self.array[indexPath.row];
        mycell.selectionStyle = UITableViewCell.SelectionStyle.none;
        //mycell.skillsLabel.text = restaurantArray[indexPath.row];
        return mycell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @objc private func onProceedClick(){
        self.navigationController?.pushViewController(PersonalDetailsViewController(), animated: true);
    }
    
    @objc private func onBackClick(){
        self.navigationController?.popViewController(animated: true);
    }
}
