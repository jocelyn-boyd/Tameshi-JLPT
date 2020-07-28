//
//  N5VocabKanjiReading.swift
//  tameshi-jlpt
//
//  Created by Jocelyn Boyd on 2/7/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

struct N5VocabKanjiReading {
  
  let highlightedKanji: String
  let question: String
  let possibleAnswers: [Answer]
  var selectedAnswer: Answer?
  
  struct Answer {
    let text: String
    let option: Option
  }
  
  // remove
  enum Option {
    case correct
    case incorrect
  }
  
  static func shuffleQuestions() -> [N5VocabKanjiReading] {
    return vocabSectionOne
  }
  
  var rangeOfHighlightedKanji: NSRange {
    let range = question.range(of: highlightedKanji)!
    return NSRange(range, in: question)
  }

  
  static let vocabSectionOne =
    [N5VocabKanjiReading(highlightedKanji: "先週", question: "先週　デパートに　かいものに　いきました。", possibleAnswers: [Answer(text: "せんしゅう", option: .correct), Answer(text: "ぜんしゅ", option: .incorrect), Answer(text: "せんしゅ", option: .incorrect), Answer(text: "ぜんしゅう", option: .incorrect)], selectedAnswer: Answer(text: "せんしゅう", option: .correct)),
     N5VocabKanjiReading(highlightedKanji: "後", question: "ごはんの　後で　さんぽします。", possibleAnswers: [Answer(text: "あと", option: .correct), Answer(text: "つぎ", option: .incorrect), Answer(text: "うしろ", option: .incorrect), Answer(text: "まえ", option: .incorrect)]),
     N5VocabKanjiReading(highlightedKanji: "言って", question: "もう　いちど　言って　ください。", possibleAnswers: [Answer(text: "いって", option: .correct), Answer(text: "きって", option: .incorrect), Answer(text: "たって", option: .incorrect), Answer(text: "まって", option: .incorrect)]),
     N5VocabKanjiReading(highlightedKanji: "山", question: "ちかくに　山が　あります。", possibleAnswers: [Answer(text: "やま", option: .correct), Answer(text: "かわ", option: .incorrect), Answer(text: "いけ", option: .incorrect), Answer(text: "うみ", option: .incorrect)]),
     N5VocabKanjiReading(highlightedKanji: "多い", question: "この　ホテルは　へやが　多いです。", possibleAnswers: [Answer(text: "おおい", option: .correct), Answer(text: "さくない", option: .incorrect), Answer(text: "せまい", option: .incorrect), Answer(text: "ひろい", option: .incorrect)]),
     N5VocabKanjiReading(highlightedKanji: "学校", question: "ともだちと　いっしょに　学校に　いきます。", possibleAnswers: [Answer(text: "がっこう", option: .correct), Answer(text: "がこう", option: .incorrect), Answer(text: "がこお", option: .incorrect), Answer(text: "がっこお", option: .incorrect)]),
     N5VocabKanjiReading(highlightedKanji: "六本", question: "えんぴつが　六本　あります。", possibleAnswers: [Answer(text: "ろっぽん", option: .correct), Answer(text: "ろくぼん", option: .incorrect), Answer(text: "ろくぽん", option: .incorrect), Answer(text: "ろっぼん", option: .incorrect)]),
     N5VocabKanjiReading(highlightedKanji: "新聞", question: "この　新聞は　いくらですか。", possibleAnswers: [Answer(text: "しんぶん", option: .correct), Answer(text: "しんおん", option: .incorrect), Answer(text: "しおん", option: .incorrect), Answer(text: "しぶん", option: .incorrect)]),
     N5VocabKanjiReading(highlightedKanji: "安い", question: "この　カメラは　安いです。", possibleAnswers: [Answer(text: "やすい", option: .correct), Answer(text: "たかい", option: .incorrect), Answer(text: "おもい", option: .incorrect), Answer(text: "かるい", option: .incorrect)]),
     N5VocabKanjiReading(highlightedKanji: "外", question: "かさは　外に　あります。", possibleAnswers: [Answer(text: "そと", option: .correct), Answer(text: "いえ", option: .incorrect), Answer(text: "なか", option: .incorrect), Answer(text: "にわ", option: .incorrect)])]
}
