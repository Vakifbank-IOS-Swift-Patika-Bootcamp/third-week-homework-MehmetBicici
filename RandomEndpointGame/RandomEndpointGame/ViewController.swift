//
//  ViewController.swift
//  RandomEndpointGame
//
//  Created by Mehmet Biçici on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteButton.setTitle("Change Quote", for: .normal)
        quoteButton.backgroundColor = .systemBlue
        quoteButton.setTitleColor(.white, for: .normal)
        quoteLabel.textColor = .white
        Client.getQuotes { quotes, error in
            guard let randomQuotes = quotes else {  return }
            self.quoteLabel.text = randomQuotes.en
            self.quoteLabel.sizeToFit()
        }
    }
    
    
    @IBAction func quoteButtonClicked(_ sender: Any) {
        Client.getQuotes { quotes, error in
            guard let randomQuotes = quotes else {  return }
            self.quoteLabel.text = randomQuotes.en
            self.quoteLabel.sizeToFit()

        }
    }
}

