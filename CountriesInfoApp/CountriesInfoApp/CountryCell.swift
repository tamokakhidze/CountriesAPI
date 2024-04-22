//import UIKit
//
//class CountryCell: UITableViewCell {
//    
//    var nameLabel = UILabel()
//    //var backgroundImageView = UIImageView()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(nameLabel)
//        configureNameLabel()
//        contentView.layer.cornerRadius = 37
//        contentView.clipsToBounds = true
//        contentView.backgroundColor = .lightGray
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configureNameLabel() {
//        nameLabel.font = UIFont(name: "FiraGO-Medium", size: 14)
//        nameLabel.numberOfLines = 0
//        nameLabel.textAlignment = .center
//        nameLabel.textColor = .black
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.heightAnchor.constraint(equalToConstant: 38).isActive = true
//        nameLabel.widthAnchor.constraint(equalToConstant: 303).isActive = true
//        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34).isActive = true
//        nameLabel.setLineHeight(16.71)
//
//
//    }
//    
//    func configureCell(name: String) {
//        //nameLabel.text = String(independent)
//        nameLabel.text = name
//    }
//    
//}


import UIKit

class CountryCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var titleLabel = UILabel()
    var flagImageView = UIImageView()
    var nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(nextButton)
        addSubview(flagImageView)
        configureNameLabel()
        configureNextButton()
        configureFlagImageView()
        contentView.layer.cornerRadius = 26
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureFlagImageView() {
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        flagImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        flagImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        flagImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        flagImageView.backgroundColor = .red
        flagImageView.layer.cornerRadius = 3
        flagImageView.clipsToBounds = true
    }
    
    
    func configureNameLabel() {
        nameLabel.font = UIFont(name: "FiraGO-Medium", size: 12)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 220).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -1).isActive = true
        nameLabel.backgroundColor = .yellow
    }
    
    func configureTitleLabel() {
        titleLabel.font = UIFont(name: "FiraGO-Medium", size: 14)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 38).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 303).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.setLineHeight(16.8)
    }
    
    func configureNextButton() {
        let image = UIImage(systemName: "chevron.right")
        nextButton.setImage(image!.withTintColor(.gray), for: .normal)
        nextButton.tintColor = .black
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 10.14).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 11).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23).isActive = true
        }

    func configureCell(name: String?, image: String) {
        nameLabel.text = name
        guard let imgUrl = URL(string: image) else { return  }
        flagImageView.setImage(with: imgUrl)
    }
}
