//
//  CryptoPriceVC.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/13/21.
//

import UIKit

class CryptoPriceVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var cryptoPicker: UIPickerView!
    @IBOutlet weak var cryptoPrice: UILabel!
    
    var crpCcy: [String] = ["BTC", "ETH", "XRP", "BCH"]
    var ccy: [String] = ["USD", "EUR", "JPY", "CHF"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cryptoPicker.delegate = self
        cryptoPicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return crpCcy.count;
            
        } else {
            return ccy.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return crpCcy[row];
        } else {
            return ccy[row];
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getPrice(
            crpCcy: crpCcy[cryptoPicker.selectedRow(inComponent: 0)],
            ccy: ccy[cryptoPicker.selectedRow(inComponent: 1)]
        )
    }
    
    func getPrice(crpCcy: String, ccy: String){
        let urlString = "https://min-api.cryptocompare.com/data/price?fsym=" + crpCcy + "&tsyms=" + ccy
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) {
                (data, response, error) in if let data = data {
                    print("connected")
                    if let json = try? JSONSerialization.jsonObject(with: data, options:[]) as? [String:Double] {
                        DispatchQueue.main.async {
                            if let price = json[ccy] {
                                let formatter = NumberFormatter()
                                formatter.currencyCode = ccy
                                formatter.numberStyle = .currency
                                let formattedPrice = formatter.string(from: NSNumber(value:price))
                                self.cryptoPrice.text = formattedPrice
                            }
                        }
                    }
                } else{
                    print("wrong =(")
                }
            }.resume()
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
