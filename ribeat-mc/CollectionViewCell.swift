import UIKit

struct MemeModel {
    //    let image: UIImage
    //    let name: String
    let table: UITableView
    let button: UIButton
}
class CollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: MemeModel) {
//        image.image = model.image
//        name.text = model.name
//        tableViewOutlet. = model.table
//        buttonOutlet.button = model.button
        tableViewOutlet = model.table
        buttonOutlet = model.button
        
    }
    
    
}
