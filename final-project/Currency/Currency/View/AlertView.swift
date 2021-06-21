//
//  AlertView.swift
//  Currency
//
//  Created by Petro Golishevskiy on 21.06.2021.
//

import UIKit

class AlertView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var usdBuyLabel: UILabel!
    @IBOutlet weak var plnBuyLabel: UILabel!
    @IBOutlet weak var rurBuyLabel: UILabel!
    @IBOutlet weak var eurBuyLabel: UILabel!
    @IBOutlet weak var chfBuyLabel: UILabel!
    @IBOutlet weak var gbpBuyLabel: UILabel!
    @IBOutlet weak var usdSelLabel: UILabel!
    @IBOutlet weak var plnSelLabel: UILabel!
    @IBOutlet weak var rurSelLabel: UILabel!
    @IBOutlet weak var eurSelLabel: UILabel!
    @IBOutlet weak var chfSelLabel: UILabel!
    @IBOutlet weak var gbpSelLabel: UILabel!
    
    var callBack: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    func fillIn(bank: Bank) {
         print(bank.name)
        nameLabel.text = bank.name
        addressLabel.text = bank.city
        
        usdBuyLabel.text = bank.prices[0].purchase
        usdSelLabel.text = bank.prices[0].sale
        plnBuyLabel.text = bank.prices[1].purchase
        plnSelLabel.text = bank.prices[1].sale
        rurBuyLabel.text = bank.prices[2].purchase
        rurSelLabel.text = bank.prices[2].sale
        eurBuyLabel.text = bank.prices[3].purchase
        eurSelLabel.text = bank.prices[3].sale
        chfBuyLabel.text = bank.prices[4].purchase
        chfSelLabel.text = bank.prices[4].sale
        gbpBuyLabel.text = bank.prices[5].purchase
        gbpSelLabel.text = bank.prices[5].sale
    }
    
    @IBAction func sharedButton(_ sender: UIButton) {
        callBack?()
    }
    
//    func loadView() {
//        let view = UINib(nibName: "AlertView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! AlertView
//        view.frame = bounds
//        view.layer.cornerRadius = 10
//        view.layer.masksToBounds = true
//        addSubview(view)
//        self.subviews
//    }
}
