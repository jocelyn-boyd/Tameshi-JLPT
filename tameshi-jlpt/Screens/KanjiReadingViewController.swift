//
//  KanjiReadingViewController.swift
//  tameshi-jlpt
//
//  Created by Jocelyn Boyd on 2/16/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

class KanjiReadingViewController: UIViewController {
  // MARK: Internal Properties
  var testItems = N5VocabKanjiReading.vocabSectionOne
  
  //MARK: - UI Properties
  lazy var headerSectionLabel: UILabel = {
    let label = UILabel()
    label.text = "問題 １" // "Mondai 1"
    Utilities.setHeaderLabel(label)
    return label
  }()
  
  lazy var kanjiReadingTableView: UITableView = {
    let tableView = UITableView()
    tableView.allowsSelection = false
    tableView.register(KanjiReadingCell.self, forCellReuseIdentifier: KanjiReadingCell.reuseIdentifier)
    Utilities.setViewBackgroundColor(tableView)
    return tableView
  }()
  
  
  //MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    configureHeaderLabel()
    configureTableView()
  }
  
  
  //MARK: - Private Methods
  private  func configureViewController() {
    kanjiReadingTableView.delegate = self
    kanjiReadingTableView.dataSource = self
    
    kanjiReadingTableView.rowHeight = UITableView.automaticDimension
    
    Utilities.setViewBackgroundColor(view)
  }
  
  
  private func configureHeaderLabel() {
    view.addSubview(headerSectionLabel)
    headerSectionLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      headerSectionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerSectionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25)])
  }
  
  
  private func configureTableView() {
    view.addSubview(kanjiReadingTableView)
    kanjiReadingTableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      kanjiReadingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
      kanjiReadingTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      kanjiReadingTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      kanjiReadingTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
  }
}


//MARK: UITableViewDataSource
extension KanjiReadingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return testItems.count + 1
  }


  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = UITableViewCell()
      let test = Instruction.jPNInstructions.rawValue
      cell.textLabel?.text = test
      cell.textLabel?.numberOfLines = 3
      cell.backgroundColor = UIColor.white
      cell.isHighlighted = false
      
      return cell
    } else {
      guard let cell = kanjiReadingTableView.dequeueReusableCell(withIdentifier: KanjiReadingCell.reuseIdentifier, for: indexPath) as? KanjiReadingCell else {return UITableViewCell()}

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
      return cell
    }
  }
}


//MARK: UITableViewDelegate
extension KanjiReadingViewController: UITableViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    // Note: Sticky Header
    if scrollView.contentOffset.y < 0.0 {
      if let cell = kanjiReadingTableView.cellForRow(at: IndexPath(row: 0, section: 0)) {
        cell.frame.origin.y = scrollView.contentOffset.y
        let originalHeight:CGFloat = 125.0
        cell.frame.size.height = originalHeight + scrollView.contentOffset.y * (-1.0)
        // print(cell.frame.size.height)
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


//MARK: KanjiReadingCellDelegate
extension KanjiReadingViewController: KanjiReadingCellDelegate {
  //Note: Find out which question the user is on, so their answer can be correctly checked
  func didPushButton(sender: UIButton, at index: Int, for cellIndex: Int) {

    let position: CGPoint = sender.convert(.zero, to: self.kanjiReadingTableView)


    if let indexPath = self.kanjiReadingTableView.indexPathForRow(at: position) {
      print(position)

      if testItems[indexPath.row].correctAnswer?.text == testItems[cellIndex].possibleAnswers[index].text {
            //TODO: selected answer is correct OR incorrect
        print("correct answer")
      } else {
        print("not correct answer")
      }
    }
  }
}


