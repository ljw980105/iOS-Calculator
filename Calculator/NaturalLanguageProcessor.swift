//
//  NaturalLanguageProcessor.swift
//  Calculator
//
//  Created by Jing Wei Li on 5/31/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

import Foundation

class NaturalLanguageProcessor{
    
    /**
     Contract: The word passed in should be a noun
     - parameter word: The word to test
     - returns: A boolean value indicating whether or not the word is plural
     */
    class func isWordSingular(_ word: String) -> Bool {
        let tagger = NSLinguisticTagger(tagSchemes:[.lemma], options: 0)
        let text = "Are there \(word)"
        var lastWord = ""
        tagger.string = text
        let range = NSRange(location:0, length: text.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.enumerateTags(in: range, unit: .word, scheme: .lemma, options: options) { tag, tokenRange, stop in
            if let lemma = tag?.rawValue {
                // Do something with each lemma
                lastWord = lemma
            }
        }
        return lastWord != word
    }
    
}
