//
//  SampleData.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 16/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation

struct SampleData {
    
    static let categories:[[String:Any]] = [
        ["name" : "Sports", "identifier" : 1, "image" : "ic_sports"],
        ["name" : "Health & Wellness", "identifier" : 2, "image" : "ic_health"],
        ["name" : "Food", "identifier" : 3, "image" : "ic_food"],
        ["name" : "Concerts & Shows", "identifier" : 4, "image" : "ic_concerts"],
        ["name" : "Outdoors", "identifier" : 5, "image" : "ic_outdoors"]
    ]
    
    static let events:[Int32:[[String:Any]]] = [
        1 : [
            ["name" : "IPL 2018", "identifier" : 1, "image" : "ic_ipl", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"],
            ["name" : "Basketball Challenge", "identifier" : 2, "image" : "ic_basketball", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"],
            ["name" : "Premier Badminton League", "identifier" : 3, "image" : "ic_badminton", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"]
        ],
        2 : [
            ["name" : "Yogaasans Program", "identifier" : 4, "image" : "ic_yoga", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"],
            ["name" : "Art of Living", "identifier" : 5, "image" : "ic_art", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"],
            ["name" : "Aging With Grace", "identifier" : 6, "image" : "ic_aging", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"]
        ],
        3 : [
            ["name" : "Great Indian Food Festival", "identifier" : 7, "image" : "ic_great_food", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"],
            ["name" : "National Street Food Festival", "identifier" : 8, "image" : "ic_national_food", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"],
            ["name" : "Bengaluru Food Fete", "identifier" : 9, "image" : "ic_bengaluru_food", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"]
        ],
        4 : [
            ["name" : "Sunburn 2018", "identifier" : 10, "image" : "ic_sunburn", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"],
            ["name" : "EDM Concert", "identifier" : 11, "image" : "ic_edm", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date(), "price" : "\u{20B9} 5,999"],
            ["name" : "Punjabi By Heart", "identifier" : 12, "image" : "ic_punjabi", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date()]
        ],
        5 : [
            ["name" : "Himalayan Treks", "identifier" : 13, "image" : "ic_trek", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date()],
            ["name" : "Cauvery River Trail", "identifier" : 14, "image" : "ic_cauvery", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date()],
            ["name" : "Summer Pool Party", "identifier" : 15, "image" : "ic_pool", "details" : "Enjoy the thrill & excitment of flying like a bird", "time" : Date()]
        ]
    ]
}
