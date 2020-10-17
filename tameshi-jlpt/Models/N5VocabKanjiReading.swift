//
//  N5VocabKanjiReading.swift
//  tameshi-jlpt
//
//  Created by Jocelyn Boyd on 2/7/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import UIKit

struct N5VocabKanjiReading: Codable, Hashable {
    
    let id: Int
    let highlightedKanji: String
    let question: String
    let possibleAnswers: [Answer]
    var correctAnswer: Answer?
    
    struct Answer: Codable, Hashable {
        let text: String
    }
    
    //  static func shuffleQuestions() -> [N5VocabKanjiReading] {
    //    return vocabSectionOne
    //  }
    
    var rangeOfHighlightedKanji: NSRange {
        let range = question.range(of: highlightedKanji)!
        return NSRange(range, in: question)
    }
    
    
    static let vocabSectionOne =
        [N5VocabKanjiReading(id: 1,highlightedKanji: "先週", question: "先週　デパートに　かいものに　いきました。", possibleAnswers: [Answer(text: "せんしゅう"), Answer(text: "ぜんしゅ"), Answer(text: "せんしゅ"), Answer(text: "ぜんしゅう")], correctAnswer: Answer(text: "せんしゅう")),
         
         N5VocabKanjiReading(id: 2, highlightedKanji: "後", question: "ごはんの　後で　さんぽします。", possibleAnswers: [Answer(text: "あと"), Answer(text: "つぎ"), Answer(text: "うしろ"), Answer(text: "まえ")], correctAnswer: Answer(text: "あと")),
         
         N5VocabKanjiReading(id: 3, highlightedKanji: "言って", question: "もう　いちど　言って　ください。", possibleAnswers: [Answer(text: "いって"), Answer(text: "きって"), Answer(text: "たって"), Answer(text: "まって")], correctAnswer: Answer(text: "言って")),
         
         N5VocabKanjiReading(id: 4, highlightedKanji: "山", question: "ちかくに　山が　あります。", possibleAnswers: [Answer(text: "やま"), Answer(text: "かわ"), Answer(text: "いけ"), Answer(text: "うみ")], correctAnswer: Answer(text: "山")),
         
         N5VocabKanjiReading(id: 5, highlightedKanji: "多い", question: "この　ホテルは　へやが　多いです。", possibleAnswers: [Answer(text: "おおい"), Answer(text: "さくない"), Answer(text: "せまい"), Answer(text: "ひろい")], correctAnswer: Answer(text: "多い")),
         
         N5VocabKanjiReading(id: 6, highlightedKanji: "学校", question: "ともだちと　いっしょに　学校に　いきます。", possibleAnswers: [Answer(text: "がっこう"), Answer(text: "がこう"), Answer(text: "がこお"), Answer(text: "がっこお")], correctAnswer: Answer(text: "学校")),
         
         N5VocabKanjiReading(id: 7, highlightedKanji: "六本", question: "えんぴつが　六本　あります。", possibleAnswers: [Answer(text: "ろっぽん"), Answer(text: "ろくぼん"), Answer(text: "ろくぽん"), Answer(text: "ろっぼん")], correctAnswer: Answer(text: "六本")),
         
         N5VocabKanjiReading(id: 8, highlightedKanji: "新聞", question: "この　新聞は　いくらですか。", possibleAnswers: [Answer(text: "しんぶん"), Answer(text: "しんおん"), Answer(text: "しおん"), Answer(text: "しぶん")], correctAnswer: Answer(text: "新聞")),
         
         N5VocabKanjiReading(id: 9, highlightedKanji: "安い", question: "この　カメラは　安いです。", possibleAnswers: [Answer(text: "やすい"), Answer(text: "たかい"), Answer(text: "おもい"), Answer(text: "かるい")], correctAnswer: Answer(text: "しぶん")),
         
         N5VocabKanjiReading(id: 10, highlightedKanji: "外", question: "かさは　外に　あります。", possibleAnswers: [Answer(text: "そと"), Answer(text: "いえ"), Answer(text: "なか"), Answer(text: "にわ")], correctAnswer: Answer(text: "外")),
        ]
}
