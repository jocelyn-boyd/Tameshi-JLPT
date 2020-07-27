//
//  KanjiReadingViewController.swift
//  tameshi-jlpt
//
//  Created by Jocelyn Boyd on 2/16/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

class KanjiReadingViewController: UIViewController {
  
  var testItems = N5VocabKanjiReading.vocabSectionOne
  
  lazy var mylabel: UILabel = {
    let label = UILabel()
    label.text = "問題 １" //"Mondai 1"
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()
  
  
  lazy var KanjiReadingTableView: UITableView = {
    let table = UITableView()
//    table.separatorColor = .clear
    table.backgroundColor = UIColor.init(displayP3Red: 243/250, green: 239/250, blue: 235/250, alpha: 1)
    table.allowsSelection = false
    table.register(KanjiReadingCell.self, forCellReuseIdentifier: "KanjiReading")
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    view.backgroundColor = UIColor.init(displayP3Red: 243/250, green: 239/250, blue: 235/250, alpha: 1)
    view.backgroundColor = UIColor.white
    KanjiReadingTableView.delegate = self
    KanjiReadingTableView.dataSource = self
    constrainMyLabel()
    constrainMyTable()
    KanjiReadingTableView.rowHeight = UITableView.automaticDimension
  }
  
  func constrainMyLabel() {
    view.addSubview(mylabel)
    mylabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      mylabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      mylabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25)])
    
  }
  
  func constrainMyTable() {
    KanjiReadingTableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(KanjiReadingTableView)
    
    NSLayoutConstraint.activate([
      KanjiReadingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
      KanjiReadingTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      KanjiReadingTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      KanjiReadingTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
  }
  
}

extension KanjiReadingViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return testItems.count + 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = UITableViewCell()
      let test = Instruction.jPNInstructions.rawValue
      cell.textLabel?.text = test
      cell.textLabel?.numberOfLines = 3
//      cell.backgroundColor = UIColor.init(displayP3Red: 243/250, green: 239/250, blue: 235/250, alpha: 1)
      cell.backgroundColor = UIColor.white
      cell.isHighlighted = false
      return cell
    } else {
      guard let cell = KanjiReadingTableView.dequeueReusableCell(withIdentifier: "KanjiReading", for: indexPath) as? KanjiReadingCell else {return UITableViewCell()}
      
      let item = N5VocabKanjiReading.shuffleQuestions()[indexPath.row - 1]
      let shuffle = item.possibleAnswers.shuffled()
      
      let questionText = item.question
      let fontAttributes = UIFont.boldSystemFont(ofSize: 20)
      let underlineAttributes = NSUnderlineStyle.single.rawValue
      let attributedQuesText = NSMutableAttributedString(string: questionText)
      let attributes: [NSAttributedString.Key: Any] = [.font: fontAttributes, .underlineStyle: underlineAttributes]
      
      attributedQuesText.addAttributes(attributes, range: item.rangeOfHighlightedKanji)
      cell.questionLabel.attributedText = attributedQuesText
      cell.delegate = self
      
      cell.optionOneButton.setTitle(shuffle[0].text, for: .normal)
      cell.optionTwoButton.setTitle(shuffle[1].text, for: .normal)
      cell.optionThreeButton.setTitle(shuffle[2].text, for: .normal)
      cell.optionFourButton.setTitle(shuffle[3].text, for: .normal)
      
      
//      cell.backgroundColor = UIColor.init(displayP3Red: 243/250, green: 239/250, blue: 235/250, alpha: 1)
      cell.backgroundColor = UIColor.white
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //sticky header
    if scrollView.contentOffset.y < 0.0 {
      if let cell = KanjiReadingTableView.cellForRow(at: IndexPath(row: 0, section: 0)) {
        cell.frame.origin.y = scrollView.contentOffset.y
        let originalHeight:CGFloat = 125.0
        cell.frame.size.height = originalHeight + scrollView.contentOffset.y * (-1.0)
        //        print(cell.frame.size.height)
      }
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 125.0
    } else {
      return 200.0
    }
  }
    
}

extension KanjiReadingViewController: KanjiReadingCellDelegate {
  func didPushButton(at index: Int) {
    
//    testItems.selectedAnswer = testItems[cellIndex].possibleAnswers[index]
  }
  
  
}
