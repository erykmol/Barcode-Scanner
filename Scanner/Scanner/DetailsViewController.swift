//
//  HistoryViewController.swift
//  Scanner
//
//  Created by Eryk Mól on 17.03.19.
//  Copyright © 2019 Eryk Mól. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameOutput: UILabel!
    @IBOutlet weak var scanOutput: UILabel!
    @IBOutlet weak var dbOutput: UILabel!
    @IBOutlet weak var imageOutput: UIImageView!
    
    var stringScan: String?
    var historyRecord: [Any?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let history = UserDefaults.standard.array(forKey: "history") {
            historyRecord = history
        }

        
        self.scanOutput.text = "Barcode number: \(stringScan!)"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "https://world.openfoodfacts.org/api/v0/product/\(stringScan!).json")!
        let task = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            
            guard let content = data else {
                print("No data")
                return
            }
            
            do{
                let json = (try JSONSerialization.jsonObject(with: content, options: [JSONSerialization.ReadingOptions.allowFragments])) as! [String: Any]
                
                if let product = json["product"] as? [String: Any] {
                    if let imageUrl = product["image_front_url"] as? String {
                        self.downloadImage(from: URL(string: "\(imageUrl)")!)
                    }
                    DispatchQueue.main.async() {
                        if let name = product["product_name"] as? String {
                            self.nameOutput.text = "Name: \(name)"
                        }
                    }
                    if let ingredients = product["ingredients_text_en"] as? String {
                        DispatchQueue.main.async() {
                            let ingr = "Ingredients: \n-" + ingredients.replacingOccurrences(of: ", ", with: "\n-")

                            self.dbOutput.text = "\(ingr)"
                        }
                    }
                }
        
            } catch let err {
                print(err)
            }
            
        }
        
        task.resume()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.imageOutput.image = UIImage(data: data)

                self.historyRecord.append(["name": self.nameOutput.text!, "scan": self.scanOutput.text!, "image": data])
                UserDefaults.standard.set(self.historyRecord, forKey: "history")
            }
        }
    }
    
//    override func viewWillAppear(_ animated : Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated : Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
}
