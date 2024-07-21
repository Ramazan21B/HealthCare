//
//  BooksTableViewCell.swift
//  Books
//
//  Created by Aitzhan Ramazan on 17.07.2024.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(book: Books){
        titleLabel.text = book.title
        tagsLabel.text = book.bite
    }
}
