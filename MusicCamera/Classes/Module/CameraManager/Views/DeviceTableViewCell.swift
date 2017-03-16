//
//  DeviceTableViewCell.swift
//  MusicCamera
//
//  Created by 程平 on 17/2/25.
//  Copyright © 2017年 程平. All rights reserved.
//

import UIKit

protocol DeviceTableViewCellDelegate {
    func buttonTouched(cell:DeviceTableViewCell,buttonTag:Int)
}



class DeviceTableViewCell: UITableViewCell {
 
    @IBOutlet weak var containerView: UIView!

     var delegate:DeviceTableViewCellDelegate?
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var setterButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var soundButton: UIButton!
    
    
    var isOnline:Bool = false{
        didSet{
            setButtonsState(isOnline)
        }
    }
    
    
    var isAlarmSeleted:Bool = false {
        
        didSet{
            if oldValue != isAlarmSeleted{
                
            }
            setSoundButton(selected: isAlarmSeleted)
            
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("NewMonitorTableViewCell ===>init")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("NewMonitorTableViewCell ===>aDecoder")
        //fatalError("init(coder:) has not been implemented")
        // containerView.bo
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initButtons()
        initProperties()
        
        //self.shareButton.removeFromSuperview();
        print("awakeFromNib")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    private func initProperties(){
        self.photoImageView.layer.cornerRadius = self.photoImageView.bounds.size.height / 2
        self.photoImageView.layer.masksToBounds = true ;
        
        containerView.layer.borderColor = UIColor.lightGray.cgColor
       // cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }
    
    private func initButtons(){
        self.setterButton.setImage(UIImage(named: "设置"), for: .normal)
         self.shareButton.setImage(UIImage(named: "分享"), for: .normal)
        self.deleteButton.setImage(UIImage(named: "删除"), for: .normal)
        self.soundButton.setImage(UIImage(named: "报警"), for: .normal)
        self.setterButton.setImage(UIImage(named: "设置-离线"), for: .disabled)
         self.shareButton.setImage(UIImage(named: "分享-离线"), for: .disabled)
        self.deleteButton.setImage(UIImage(named: "删除-离线"), for: .disabled)
        self.soundButton.setImage(UIImage(named: "报警-离线"), for: .disabled)
        self.soundButton.setImage(UIImage(named: "取消报警-离线"), for: .selected)
        
    }
    
    
    private  func setButtonsState(_ value: Bool)  {
        
        self.setterButton.isEnabled = value
         self.shareButton.isEnabled = value
        self.deleteButton.isEnabled = value
        self.soundButton.isEnabled = value
    }
    
    private func setSoundButton(selected: Bool){
        self.soundButton.isSelected = selected
    }
    
    
    @IBAction func setterHandler(_ sender: UIButton) {
        delegate?.buttonTouched(cell: self, buttonTag: 4)
    }
    
    @IBAction func shareHandler(_ sender: UIButton) {
        delegate?.buttonTouched(cell: self, buttonTag: 3)
    }
    
    
    @IBAction func deleteHandler(_ sender: UIButton) {
        delegate?.buttonTouched(cell: self, buttonTag: 2)
    }
    
    @IBAction func soundHandler(_ sender: UIButton) {
        
        isAlarmSeleted = !sender.isSelected
        let flag = isAlarmSeleted ? 11 :10
        delegate?.buttonTouched(cell: self, buttonTag: flag)
    }

    
}
