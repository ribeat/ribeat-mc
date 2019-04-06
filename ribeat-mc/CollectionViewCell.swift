import UIKit

struct MemeModel {
//    let image: UIImage
//    let name: String
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: MemeModel) {
//        image.image = model.image
//        name.text = model.name
    }
    
}
