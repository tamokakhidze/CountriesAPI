//
//  DetailsViewController.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 20.04.24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var region: String?
    var independent: Bool?
    var borders: [String]?
    var altspellings: String?
    var flagAlt: String?
    var capital: [String]?
    var name: String
    //var currency: [String : Currency]?
    var mainScrollView = UIScrollView()
    var contentView = UIView()
    var countryName = UILabel()
    var flagImage = UIImageView()
    var aboutheflag = UILabel()
    var flagDescriopion = UILabel()
    var divider1 = UIView()
    var basicInfo = UILabel()
    var independentLabel = UILabel()
    var independentTextLabel = UILabel()
    var spellingLabel = UILabel()
    var spellingTextLabel = UILabel()
    var capitalLabel = UILabel()
    var capitalTextLabel = UILabel()
    var currencyLabel = UILabel()
    var currencyTextLabel = UILabel()
    var regionLabel = UILabel()
    var regionTextLabel = UILabel()
    var neighborsLabel = UILabel()
    var neighborsTextLabel = UILabel()
    var divider2 = UIView()
    var emptyview = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    init(region: String? = nil, independent: Bool? = nil, borders: [String]? = nil, altspellings: String? = nil, flagAlt: String? = nil, flagImage: UIImageView? = nil, name: String) {
        self.name = name
        self.region = region
        self.independent = independent
        //currency: [String : Currency] = [:]
        self.borders = borders
        self.altspellings = altspellings
        self.flagAlt = flagAlt
        self.flagImage = flagImage ?? UIImageView()
       // self.currency = currency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
//        mainScrollView = configureScrollView()
//        contentView = configureContentView()
//        mainScrollView.addSubview(contentView)
        countryName = configureCountryNameLabel()
        flagImage = configureFlagImageView()
        aboutheflag = aboutTheFlagLabel()
        flagDescriopion = flagDescriptionLabel(descriptionText: flagAlt ?? "This flag does not have description")
        divider1 = createDividerView(topAnchor: flagDescriopion.bottomAnchor, constant: 20)
        basicInfo = basicInfoLabel()
        independentLabel = createSomeInfoLabel(topAnchor: basicInfo.bottomAnchor, constant: 15, text: "Independent:")
        independentTextLabel = createSomeInfoLabelTextLabels(topAnchor: basicInfo.bottomAnchor, constant: 15, text: String((independent) ?? false).uppercased())
        spellingLabel = createSomeInfoLabel(topAnchor: independentLabel.bottomAnchor, constant: 15, text: "Spelling:")
        spellingTextLabel = createSomeInfoLabelTextLabels(topAnchor: independentTextLabel.bottomAnchor, constant: 15, text: altspellings ?? "None")
        capitalLabel = createSomeInfoLabel(topAnchor: spellingLabel.bottomAnchor, constant: 15, text: "Capital")
        capitalTextLabel = createSomeInfoLabelTextLabels(topAnchor: spellingTextLabel.bottomAnchor, constant: 15, text: capital?[0] ?? "Capital")
        currencyLabel = createSomeInfoLabel(topAnchor: capitalLabel.bottomAnchor, constant: 15, text: "Currency:")
       // let currencyValuesString = currency?.values.map { $0.name }.joined(separator: ", ") ?? ""
        currencyTextLabel = createSomeInfoLabelTextLabels(topAnchor: capitalTextLabel.bottomAnchor, constant: 15, text: "EU")
        regionLabel = createSomeInfoLabel(topAnchor: currencyLabel.bottomAnchor, constant: 15, text: "Region:")
        regionTextLabel = createSomeInfoLabelTextLabels(topAnchor: currencyTextLabel.bottomAnchor, constant: 15, text: region ?? "Earth")
        neighborsLabel = createSomeInfoLabel(topAnchor: regionLabel.bottomAnchor, constant: 15, text: "Neighbors:")
        neighborsTextLabel = createSomeInfoLabelTextLabels(topAnchor: regionTextLabel.bottomAnchor, constant: 15, text: borders?.joined(separator: ", ") ?? "None")
        divider2 = createDividerView(topAnchor: neighborsLabel.bottomAnchor, constant: 20)
        view.backgroundColor = .white
        
//        let totalHeight = calculateTotalHeight()
//        mainScrollView.contentSize = CGSize(width: view.frame.width, height: totalHeight)
        
    }
    func configureScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        return scrollView
    }
    
    func configureContentView() -> UIView {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        
        return contentView
        
    }
    
//    func calculateTotalHeight() -> CGFloat {
//        var totalHeight: CGFloat = 0
//        for subview in mainScrollView.subviews {
//            totalHeight += subview.frame.size.height
//        }
//        return totalHeight
//    }
    
    
//    func s() -> UIView {
//        let uiview = UIView()
//        //mainScrollView.addSubview(uiview)
//        view.addSubview(uiview)
//        uiview.translatesAutoresizingMaskIntoConstraints = false
//        uiview.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        uiview.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 30).isActive = true
//        return uiview
//    }
    

    
    
    func configureCountryNameLabel() -> UILabel {
        let countryNameLabel = UILabel()
        //mainScrollView.addSubview(countryNameLabel)
        view.addSubview(countryNameLabel)
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48).isActive = true
        countryNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countryNameLabel.widthAnchor.constraint(equalToConstant: 343).isActive = true
        countryNameLabel.textAlignment = .center
        countryNameLabel.font.withSize(17)
        countryNameLabel.text = name
        return countryNameLabel
    }
    
    func configureFlagImageView() -> UIImageView {
        let flagImageView = UIImageView()
        //mainScrollView.addSubview(flagImageView)
        view.addSubview(flagImageView)
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.widthAnchor.constraint(equalToConstant: 343).isActive = true
        flagImageView.heightAnchor.constraint(equalToConstant: 228).isActive = true
        flagImageView.layer.cornerRadius = 30
        flagImageView.clipsToBounds = true
        flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flagImageView.topAnchor.constraint(equalTo: countryName.bottomAnchor, constant: 29).isActive = true
        
        return flagImageView
    }
    
    func aboutTheFlagLabel() -> UILabel {
        let label = UILabel()
        //mainScrollView.addSubview(label)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: flagImage.bottomAnchor, constant: 25).isActive = true
        label.widthAnchor.constraint(equalToConstant: 325).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.textAlignment = .left
        label.text = "About the flag"
        
        return label
    }
    
    func flagDescriptionLabel(descriptionText: String?) -> UILabel {
        let description = UILabel()
        //mainScrollView.addSubview(description)
        view.addSubview(description)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.topAnchor.constraint(equalTo: aboutheflag.bottomAnchor, constant: 15).isActive = true
        description.widthAnchor.constraint(equalToConstant: 325).isActive = true
        description.heightAnchor.constraint(equalToConstant: 85).isActive = true
        description.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        description.numberOfLines = 0
        description.textAlignment = .left
        description.text = descriptionText
        
        return description
    }
    
    func createDividerView(topAnchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        let divider = UIView()
        //mainScrollView.addSubview(divider)
        view.addSubview(divider)
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 312).isActive = true
        divider.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        divider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        divider.backgroundColor = .lightGray
        
        return divider
    }
    
    func basicInfoLabel() -> UILabel {
        let label = UILabel()
        //mainScrollView.addSubview(label)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 24).isActive = true
        label.widthAnchor.constraint(equalToConstant: 325).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.textAlignment = .left
        label.text = "Basic information"
        
        return label
    }
    
    func createSomeInfoLabel(topAnchor: NSLayoutYAxisAnchor, constant: CGFloat, text: String) -> UILabel {
        let label = UILabel()
        //mainScrollView.addSubview(label)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        label.text = text
        
        return label
    }
    
    func createSomeInfoLabelTextLabels(topAnchor: NSLayoutYAxisAnchor, constant: CGFloat, text: String = "") -> UILabel {
        let label = UILabel()
        //mainScrollView.addSubview(label)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        label.text = text
        label.numberOfLines = 0
        
        return label
    }
    

}

