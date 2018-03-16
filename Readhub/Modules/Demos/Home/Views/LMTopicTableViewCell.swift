//
//  LMTopicTableViewCell.swift
//  Readhub
//
//  Created by limo on 2018/3/16.
//  Copyright © 2018年 Limo. All rights reserved.
//

import UIKit

class LMTopicTableViewCell: FoldingCell {
    
    /// 小卡片上的标题
    @IBOutlet weak var smallCardTitleLabel: UILabel!
    /// 小卡片上的时间轴
    @IBOutlet weak var smallCardUpdatedLabel: UILabel!
    
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 时间轴
    @IBOutlet weak var updatedLabel: UILabel!
    /// 内容概要
    @IBOutlet weak var summaryLabel: UILabel!
    
    open var model: LMTopicModel?{
        didSet {
            smallCardTitleLabel.text = model?.title
            smallCardUpdatedLabel.text = model?.updatedRequiredString
            titleLabel.text = model?.title
            updatedLabel.text = model?.updatedRequiredString

            
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

    open func nib() -> [UINib] {
        
        return [UINib.init(nibName: "KIInPutTableViewCell", bundle: nil)]
    }
    
    
}
