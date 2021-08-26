//
//  LFAlbumListView.swift
//  LFPhotoAlbumDemo
//
//  Created by leo on 2021/8/6.
//

import UIKit

class LFAlbumListView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var tableView:UITableView!
    static let normalCellName = "normalCellName"
    var albumArray : Array<LFAlbumModel> = []
    var selectIndexBlock:LFIntFoundation?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI(){
        tableView = UITableView.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        self.addSubview(tableView)
        tableView.register(LFAlbumListTableViewCell.classForCoder(), forCellReuseIdentifier: LFAlbumListView.normalCellName)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    public func setSelectIndex(foundation:@escaping LFIntFoundation){
        selectIndexBlock = foundation
    }

}
extension LFAlbumListView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LFAlbumListTableViewCell = tableView.dequeueReusableCell(withIdentifier: LFAlbumListView.normalCellName) as! LFAlbumListTableViewCell
        
        let model = self.albumArray[indexPath.row]
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (self.selectIndexBlock != nil) {
            selectIndexBlock!(indexPath.row)
        }
    }
    
}
