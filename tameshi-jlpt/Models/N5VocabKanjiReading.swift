//
//  N5VocabKanjiReading.swift
//  tameshi-jlpt
//
//  Created by Jocelyn Boyd on 2/7/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

struct N5VocabKanjiReading: Codable, Hashable {
  
  let highlightedKanji: String
  let question: String
  let possibleAnswers: [Answer]
  var correctAnswer: Answer?
  
  struct Answer: Codable, Hashable {
    let text: String
  }
  
  static func shuffleQuestions() -> [N5VocabKanjiReading] {
    return vocabSectionOne
  }
  
  var rangeOfHighlightedKanji: NSRange {
    let range = question.range(of: highlightedKanji)!
    return NSRange(range, in: question)
  }

  
  static let vocabSectionOne =
    [N5VocabKanjiReading(highlightedKanji: "先週", question: "先週　デパートに　かいものに　いきました。", possibleAnswers: [Answer(text: "せんしゅう"), Answer(text: "ぜんしゅ"), Answer(text: "せんしゅ"), Answer(text: "ぜんしゅう")], correctAnswer: Answer(text: "せんしゅう")),
     N5VocabKanjiReading(highlightedKanji: "後", question: "ごはんの　後で　さんぽします。", possibleAnswers: [Answer(text: "あと"), Answer(text: "つぎ"), Answer(text: "うしろ"), Answer(text: "まえ")], correctAnswer: Answer(text: "あと")),
     N5VocabKanjiReading(highlightedKanji: "言って", question: "もう　いちど　言って　ください。", possibleAnswers: [Answer(text: "いって"), Answer(text: "きって"), Answer(text: "たって"), Answer(text: "まって")], correctAnswer: Answer(text: "言って")),
     N5VocabKanjiReading(highlightedKanji: "山", question: "ちかくに　山が　あります。", possibleAnswers: [Answer(text: "やま"), Answer(text: "かわ"), Answer(text: "いけ"), Answer(text: "うみ")], correctAnswer: Answer(text: "山")),
     N5VocabKanjiReading(highlightedKanji: "多い", question: "この　ホテルは　へやが　多いです。", possibleAnswers: [Answer(text: "おおい"), Answer(text: "さくない"), Answer(text: "せまい"), Answer(text: "ひろい")], correctAnswer: Answer(text: "多い")),
     N5VocabKanjiReading(highlightedKanji: "学校", question: "ともだちと　いっしょに　学校に　いきます。", possibleAnswers: [Answer(text: "がっこう"), Answer(text: "がこう"), Answer(text: "がこお"), Answer(text: "がっこお")], correctAnswer: Answer(text: "学校")),
     N5VocabKanjiReading(highlightedKanji: "六本", question: "えんぴつが　六本　あります。", possibleAnswers: [Answer(text: "ろっぽん"), Answer(text: "ろくぼん"), Answer(text: "ろくぽん"), Answer(text: "ろっぼん")], correctAnswer: Answer(text: "六本")),
     N5VocabKanjiReading(highlightedKanji: "新聞", question: "この　新聞は　いくらですか。", possibleAnswers: [Answer(text: "しんぶん"), Answer(text: "しんおん"), Answer(text: "しおん"), Answer(text: "しぶん")], correctAnswer: Answer(text: "新聞")),
     N5VocabKanjiReading(highlightedKanji: "安い", question: "この　カメラは　安いです。", possibleAnswers: [Answer(text: "やすい"), Answer(text: "たかい"), Answer(text: "おもい"), Answer(text: "かるい")], correctAnswer: Answer(text: "しぶん")),
     N5VocabKanjiReading(highlightedKanji: "外", question: "かさは　外に　あります。", possibleAnswers: [Answer(text: "そと"), Answer(text: "いえ"), Answer(text: "なか"), Answer(text: "にわ")], correctAnswer: Answer(text: "外")),
     
     N5VocabKanjiReading(highlightedKanji: "雨", question: "あしたは　雨ですか。", possibleAnswers: [Answer(text: "ゆき"), Answer(text: "はれ"), Answer(text: "くもり")], correctAnswer: Answer(text: "あめ")),
     N5VocabKanjiReading(highlightedKanji: "書いて", question: "きょうしつで　書いて　ください。", possibleAnswers: [Answer(text: "はいて"), Answer(text: "きいて"), Answer(text: "ひいて")], correctAnswer: Answer(text: "かいて")),
     N5VocabKanjiReading(highlightedKanji: "中", question: "しゃしんは　はこの　中に　あります。", possibleAnswers: [Answer(text: "そば"), Answer(text: "そと"), Answer(text: "よこ")], correctAnswer: Answer(text: "なか")),
     N5VocabKanjiReading(highlightedKanji: "小さい", question: "この　いすは　小さいです。", possibleAnswers: [Answer(text: "ちさい"), Answer(text: "しいさい"), Answer(text: "しさい")], correctAnswer: Answer(text: "ちいさい")),
     N5VocabKanjiReading(highlightedKanji: "火曜日", question: "あしたは　火曜日です。", possibleAnswers: [Answer(text: "どようび"), Answer(text: "すいようび"), Answer(text: "にちようび")], correctAnswer: Answer(text: "かようび")),
     N5VocabKanjiReading(highlightedKanji: "空", question: "きれいな　空ですね。", possibleAnswers: [Answer(text: "いえ"), Answer(text: "うみ"), Answer(text: "にわ")], correctAnswer: Answer(text: "そら")),
     N5VocabKanjiReading(highlightedKanji: "百人", question: "せいとは　百人　います。", possibleAnswers: [Answer(text: "びゃくびゃくにん"), Answer(text: "ひゃくじん"), Answer(text: "びゃく人じん")], correctAnswer: Answer(text: "ひゃくにん")),
     N5VocabKanjiReading(highlightedKanji: "魚", question: "魚が　たくさん　いますよ。", possibleAnswers: [Answer(text: "ねこ"), Answer(text: "とり"), Answer(text: "いぬ")], correctAnswer: Answer(text: "さかな")),
     N5VocabKanjiReading(highlightedKanji: "半分", question: "ぱんを　半分　ともだちに　あげました。", possibleAnswers: [Answer(text: "はんふん"), Answer(text: "ほんぶん"), Answer(text: "ほんふん")], correctAnswer: Answer(text: "はんぶん")),
     N5VocabKanjiReading(highlightedKanji: "間", question: "ぎんこうと　スーパーの　間に　ほそい　みちが　あります。", possibleAnswers: [Answer(text: "あいた"), Answer(text: "となり"), Answer(text: "どなり")], correctAnswer: Answer(text: "あいだ")),
     N5VocabKanjiReading(highlightedKanji: "三つ", question: "たまごを　三つ　とって　ください。", possibleAnswers: [Answer(text: "いつつ"), Answer(text: "さんつ"), Answer(text: "ごつ")], correctAnswer: Answer(text: "みっつ")),
       N5VocabKanjiReading(highlightedKanji: "元気", question: "きょうは　元気が　いいですね。", possibleAnswers: [Answer(text: "けんき"), Answer(text: "でんき"), Answer(text: "てんき")], correctAnswer: Answer(text: "げんき"))
  ]
}
