//
//  HeroStats.swift
//  requestAPI
//
//  Created by Hy Horng on 9/25/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import Foundation
struct HeroStats: Decodable  {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
