//
//  FirstViewController.swift
//  Viper
//
//  Created by Антон Малыгин on 24/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import UIKit

class TranslationViewController: UIViewController, TranslationViewProtocol, UITextFieldDelegate {
    
    @IBOutlet weak var contentBackView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var fromLangButton: UIButton!
    @IBOutlet weak var toLangButton: UIButton!
    @IBOutlet weak var swapButton: UIButton!
    
    typealias ConfiguratorProtocol = TranslationConfigurator
    
    var presenter: TranslationPresenterProtocol!
    var configurator: ConfiguratorProtocol = TranslationConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        
        contentBackView.layer.cornerRadius = 10
        
        self.updateButtons()
    }
    
    func show(item: TranslationItem) {
        inputTextField.text = item.word
        outputLabel.text = item.translationValue
        fromLangButton.setTitle(item.fromLanguage.description, for: .normal)
        toLangButton.setTitle(item.toLanguage.description, for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, text.count > 0 else {
            return false
        }
        textField.resignFirstResponder()
        
        presenter.setWord(text)
        
        return false
    }
    
    func updateButtons() {
        fromLangButton.setTitle(presenter.fromLanguageTitle, for: .normal)
        toLangButton.setTitle(presenter.toLanguageTitle, for: .normal)
    }

    @IBAction func fromLangButtonTouched(_ sender: Any) {
        presenter.fromLangButtonTouched()
    }
    
    @IBAction func toLangButtonTouched(_ sender: Any) {
        presenter.toLangButtonTouched()
    }
    
    @IBAction func swapButtonTouched(_ sender: Any) {
        presenter.swapButtonTouched()
    }
    
}

