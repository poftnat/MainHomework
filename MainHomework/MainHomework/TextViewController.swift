//
//  TextViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 16.11.2023.
//  Сделайте сворачивающийся/разворачивающийся текст по нажатию кнопки. У лейбла стоит ограничение в ноль строк и констрейнта по высоте. По нажатию на кнопку эта констрейнта должна последовательно меняться на высоту одной строки лейбла и на высоту в пять строк.

import UIKit

class TextViewController: UIViewController {
    
    private lazy var myLabel = UILabel()
    lazy var staticText = "Ее глаза на звезды не похожи, \n нельзя уста кораллами назвать, \n не белоснежна плеч открытых кожа, \n и черной проволокой вьется прядь. \n Ты не найдешь в ней совершенных линий, \n особенного света на челе. \n Не знаю я, как шествуют богини, \n но милая ступает по земле. \n И все ж она уступит тем едва ли, \n кого в сравненьях пышных оболгали."
    
    lazy var changeButton = UIButton()
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI() {
        
        //есть мнение, что здесь это не пишется, а пишется выше.
        
        changeButton.setTitle("Развернуть", for: .normal)
        changeButton.setTitleColor(.white, for: .normal)
        changeButton.backgroundColor = .systemMint
        changeButton.layer.cornerRadius = 17
        changeButton.addTarget(self, action: #selector(buttonIsTapped ), for: .touchUpInside)
        
        view.addSubview(changeButton)
        
        
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        //        let labelFrame = CGRect(x: 50, y: 100, width: 200, height: 50)
        //
        //        myLabel.frame = labelFrame
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.text = staticText
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.sizeToFit()
        myLabel.textAlignment = .center
        myLabel.font = .boldSystemFont(ofSize: 16)
        view.addSubview(myLabel)
        setupLabelConstraints(height: 0)
        
    }
    
    func setupLabelConstraints(height: CGFloat) {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        myLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
        //сделано тупо, но как прикрутить размер шрифта к высоте строки, не придумалa
        heightConstraint = myLabel.heightAnchor.constraint(equalToConstant: height)
        heightConstraint.isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    var counter = 1
    
    @objc func buttonIsTapped() {
        counter += 1
        if counter % 2 == 0 {
            view.layoutIfNeeded()
            UIView.animate(withDuration: 1) {
                self.heightConstraint.constant = 96
                self.view.layoutIfNeeded()
            }
        } else {
            view.layoutIfNeeded()
            UIView.animate(withDuration: 1) {
                self.heightConstraint.constant = 16
                self.view.layoutIfNeeded()
            }
        }
    }
}


// каждое нечетное нажатие должно увеличивать высоту лейбла на строку
// каждое четное нажатие должно увеличивать высоту лейбла на 5 строк
// нужна функция или цикл?
// в идеале должно быть определено число строк, начальная констрейнта высоты должна быть нулевой




