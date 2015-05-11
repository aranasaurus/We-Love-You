//
//  LoveMessage.swift
//  We Love You!
//
//  Created by Ryan Arana on 5/10/15.
//  Copyright (c) 2015 aranasaurus. All rights reserved.
//

import Foundation

struct LoveMessage {
    private enum Category: Int {
        case Alex, Both, Zack
        
        func name() -> String {
            switch self {
            case .Alex:
                return "Alex"
            case .Both:
                return "Both"
            case .Zack:
                return "Zack"
            }
        }
        
        func imageCount() -> Int {
            switch self {
            case .Alex:
                return 14
            case .Both:
                return 10
            case .Zack:
                return 15
            }
        }
        
        func randomImageName() -> String {
            let n = Int(arc4random_uniform(UInt32(self.imageCount())))
            
            return self.name() + String(n)
        }
        
        func randomMessage() -> String {
            let messages = [
                "Happy Mother's Day!",
                "You're the best!",
                "Thanks for being you.",
                "HUGS!!",
                "<3"
            ]
            
            let singularMessages = [
                "I love you!",
                "I love you, Mommy.",
                "I'm lucky to have you."
            ]
            
            let weMessages = [
                "We love you!",
                "We love you, Mommy.",
                "We're lucky to have you."
            ]
            
            let r = Int(arc4random_uniform(UInt32(messages.count + weMessages.count)))
            if r < messages.count {
                return messages[r]
            } else {
                switch self {
                case .Alex, .Zack:
                    return singularMessages[r - messages.count]
                default:
                    return weMessages[r - messages.count]
                }
            }
        }
        
        static func loveKindCount() -> Int {
            return 3
        }
        
        static func randomCategory() -> Category {
            let r = Int(arc4random_uniform(UInt32(self.loveKindCount())))
            return Category(rawValue: r)!
        }
    }

    let imageName: String
    let message: String

    init() {
        let c = Category.randomCategory()
        self.imageName = c.randomImageName()
        self.message = c.randomMessage()
    }

    init(message: String, imageName: String) {
        self.imageName = imageName
        self.message = message
    }
}