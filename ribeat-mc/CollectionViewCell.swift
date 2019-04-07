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
    
    var order: OrderModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableViewOutlet.dataSource = self
    }
    
    public func configure(with model: MemeModel, forOrder order:OrderModel) {
//        image.image = model.image
//        name.text = model.name
//        tableViewOutlet. = model.table
//        buttonOutlet.button = model.button
        self.order = order
        tableViewOutlet = model.table
        buttonOutlet = model.button
        tableViewOutlet.reloadData()
        
    }
}

extension CollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let order = order {
            return  order.items.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderItemCell", for: indexPath as IndexPath)
        if let orderItem = order?.items[indexPath.row] {
            cell.textLabel!.text = "\(orderItem.quantity) x \(orderItem.productName)"
        } else {
            cell.textLabel!.text = "1 x Pork Ribs"
        }
        return cell
    }
    
    
}
