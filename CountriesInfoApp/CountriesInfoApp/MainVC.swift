import UIKit

class MainVC: UIViewController {
    
    let tableView = UITableView()
    var countriesArray = [Country]()
    var urlString = "https://restcountries.com/v3.1/all"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        configureTableView()
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        NetworkService().getData(urlString: urlString) { (result: Result<[Country],Error>) in
            switch result {
            case .success(let success):
                self.countriesArray = success
                self.tableView.reloadData()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }

    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 109).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 3).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
    }
        

    
}

extension MainVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as? CountryCell
        let currentCountry = countriesArray[indexPath.section]
        cell?.configureCell(name: currentCountry.name?.official, image: currentCountry.flags!.png)
        print(countriesArray.count)
        print("row: \(indexPath.row), section: \(indexPath.section) is creating")
        
        return cell!
       
    }
    
}

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryItem = countriesArray[indexPath.section]
        let region = countryItem.region
        let borders = countryItem.borders
        var bordersFive = [String]()
        
        if let borders = borders {
            bordersFive = Array(borders.prefix(5))
        }
        else {
            bordersFive = ["None"]
        }
        
        let alt: String?
        let flagAlt = countryItem.flags?.alt
        let name = (countryItem.name?.official)!
        let independent = countryItem.independent
        let capital = countryItem.capital
        let flagUrl = URL(string: countryItem.flags!.png)
        //let currency = countryItem.currencies

        if let altSpellings = countryItem.altSpellings, altSpellings.indices.contains(1) {
            alt = altSpellings[1]
        } else if let altSpellings = countryItem.altSpellings?.first {
            alt = altSpellings
        } else {
            alt = nil
        }
        

        if countriesArray.firstIndex(where: { $0.altSpellings?[0] == countryItem.altSpellings?[0] }) != nil {
            let detailsVC = DetailsViewController(name: name)
            detailsVC.region = region
            detailsVC.borders = bordersFive
            detailsVC.altspellings = alt
            detailsVC.flagAlt = flagAlt
            detailsVC.independent = independent
            detailsVC.capital = capital
            detailsVC.flagImage.setImage(with: flagUrl!)
            //detailsVC.currency = currency
            navigationController?.pushViewController(detailsVC, animated: true)
            }
        }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    

}

#Preview {
    MainVC()
}
