//
//  LFAlbumListTableViewCell.swift
//  LFPhotoAlbumDemo
//
//  Created by leo on 2021/8/5.
//

import UIKit

class LFAlbumListTableViewCell: UITableViewCell {

    //相册cell赋值
    var model : LFAlbumModel?{
        didSet{
            LFPhotoAlbumManager.requestImage(asset: (model?.albumCover)!, targetSize: CGSize.init(width: 99, height: 99), contentMode: .aspectFill) { (image, _) in
                self.imageView?.image = image;
            }
            textLabel?.text = model?.title
            if let count = model?.count{
                detailTextLabel?.text = "\(count) 张"
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //调整默认UI
    func layoutUI(){
        self.imageView?.snp.makeConstraints({ make in
            make.left.top.equalTo(self)
            make.bottom.equalTo(self).offset(-1)
            make.width.equalTo(self.snp.height)
        })
        
        self.textLabel?.snp.makeConstraints({ make in
            make.left.equalTo(self.imageView!.snp.right).offset(20)
            make.bottom.equalTo(self.snp.centerY).offset(-5)
        })
        
        self.detailTextLabel?.snp.makeConstraints({ make in
            make.left.equalTo(self.textLabel!)
            make.top.equalTo(self.snp.centerY).offset(5)
        })
        
        self.textLabel?.textColor = UIColor(named: "Color333")
        self.detailTextLabel?.textColor = UIColor(named: "Color333")
        self.textLabel?.font = UIFont.systemFont(ofSize: 16)
        self.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
}
