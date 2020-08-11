//
//  KanjiReadingCell.swift
//  tameshi-jlpt
//
//  Created by Jocelyn Boyd on 2/16/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

protocol KanjiReadingCellDelegate: class {
  func didPushButton(sender: UIButton, at index: Int, for cellIndex: Int)
}


class KanjiReadingCell: UITableViewCell {
  
  // MARK: Internal Properties
  static let reuseIdentifier = String(describing: KanjiReadingCell.self)
  
  weak var delegate: KanjiReadingCellDelegate?
  var index: Int = 0
  
  // MARK: UI Properties
  lazy var questionLabel: UILabel = {
    let label = UILabel()
    Utilities.setQuestionLabel(label)
    return label
  }()
  
  lazy var optionOneButton: UIButton = {
    let button = UIButton()
    button.tag = 0
    button.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
    Utilities.setButton(button)
    return button
  }()
  
  lazy var optionTwoButton: UIButton = {
    let button = UIButton()
    button.tag = 1
    button.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
    Utilities.setButton(button)
    return button
  }()
  
  lazy var optionThreeButton: UIButton = {
    let button = UIButton()
    button.tag = 2
    button.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
    Utilities.setButton(button)
    return button
  }()
  
  lazy var optionFourButton: UIButton = {
    let button = UIButton()
    button.tag = 3
    button.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
    Utilities.setButton(button)
    return button
  }()
  
  
  // MARK: - Override Methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addsSubviews()
    configureQuesLabel()
    configureTopHorizontalStackView()
    configureBottomHorizontalStackView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  // MARK: - Methods
  @objc private func handleButtonTap(_ sender: UIButton) {
    delegate?.didPushButton(sender: sender, at: sender.tag, for: index)
  }
  
  
  private func addsSubviews() {
    contentView.addSubview(questionLabel)
    contentView.addSubview(optionOneButton)
    contentView.addSubview(optionTwoButton)
    contentView.addSubview(optionThreeButton)
    contentView.addSubview(optionFourButton)
  }
  
  
  func configureQuesLabel() {
    NSLayoutConstraint.activate([
      questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
      questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
      questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
  }
  
  func configureTopHorizontalStackView(){
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
  
  func configureBottomHorizontalStackView() {
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
}
