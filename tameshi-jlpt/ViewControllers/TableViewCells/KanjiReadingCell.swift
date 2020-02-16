//
//  KanjiReadingCell.swift
//  tameshi-jlpt
//
//  Created by Jocelyn Boyd on 2/16/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

class KanjiReadingCell: UITableViewCell {
  
  lazy var questionLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.numberOfLines = 1
    label.lineBreakMode = .byWordWrapping
    label.allowsDefaultTighteningForTruncation = true
    label.textAlignment = .natural
    return label
  }()
  
  lazy var optionOneButton: UIButton = {
    let button = UIButton()
    button.setTitle("One", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 2
    return button
  }()
  
  lazy var optionTwoButton: UIButton = {
    let button = UIButton()
    button.setTitle("Two", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 2
    return button
  }()
  
  lazy var optionThreeButton: UIButton = {
    let button = UIButton()
    button.setTitle("Three", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 2
    return button
  }()
  
  lazy var optionFourButton: UIButton = {
    let button = UIButton()
    button.setTitle("Four", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 2
    return button
  }()
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func contrainElements() {
    contentView.addSubview(questionLabel)
    contentView.addSubview(optionOneButton)
    contentView.addSubview(optionTwoButton)
    contentView.addSubview(optionThreeButton)
    contentView.addSubview(optionFourButton)
    
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    optionOneButton.translatesAutoresizingMaskIntoConstraints = false
    optionTwoButton.translatesAutoresizingMaskIntoConstraints = false
    optionThreeButton.translatesAutoresizingMaskIntoConstraints = false
    optionFourButton.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func labelItem() {
    NSLayoutConstraint.activate([
      questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
      questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
      questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
  }
  
  func optionButtonsTopSet(){
    let stackView = UIStackView(arrangedSubviews: [optionOneButton,optionTwoButton])
    stackView.axis = .horizontal
    stackView.spacing = 50
    stackView.distribution = .fillEqually
    contentView.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 25),
      stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 50),
      stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -50)
    ])
  }
  
  func optionButtonsBottomSet() {
    let stackView = UIStackView(arrangedSubviews: [optionThreeButton, optionFourButton])
    stackView.axis = .horizontal
    stackView.spacing = 50
    stackView.distribution = .fillEqually
    contentView.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: optionOneButton.bottomAnchor, constant: 10),
      stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 50),
      stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -50)])
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contrainElements()
    labelItem()
    optionButtonsTopSet()
    optionButtonsBottomSet()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
