//
//  Emojis.swift
//  EmojiSave
//
//  Created by Akash Verma on 26/08/25.
//

import Foundation
struct Emoji:Codable{
    var symbol:String
    var name:String
    var description:String
    var usage:String
    
    static let archiveURL: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
        
    }()
    static func saveToFile(emojis:[Emoji]){
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(emojis) {
            try? data.write(to: archiveURL, options: .noFileProtection)
        }
    }
    static func loadFromFile() -> [Emoji]? {
        guard let data = try? Data(contentsOf: archiveURL) else { return nil }
        let decoder = PropertyListDecoder()
        return try? decoder.decode([Emoji].self, from: data)
    }
    static func sampleEmojis() -> [Emoji] {
        return [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A face with hearts for eyes.", usage: "love of something"),
            Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap.", usage: "safety"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "large"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "food"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "chance"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "A stack of books.", usage: "studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A broken red heart.", usage: "sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue Z’s.", usage: "tired")
        ]
    }

}
