//
//  CardsResponse.swift
//  pokemon-ajaib
//
//  Created by Hansel Matthew on 20/03/23.
//

import Foundation

// MARK: - CardsResponse
struct CardsResponse: Codable {
    let data: [Cards]
    let page, pageSize, count, totalCount: Int
}

// MARK: - Datum
struct Cards: Codable {
    let id, name: String?
    let supertype: String?
    let subtypes: [String]?
    let level: String?
    let hp: String?
    let types: [String]?
    let flavorText: String?
    let images: CardImages?
//    let attacks: [Attack]?
//    let weaknesses, resistances: [Resistance]?
//    let retreatCost: [RetreatCost]?
//    let convertedRetreatCost: Int?
//    let datumSet: CardSet
//    let number, artist: String
//    let rarity: Rarity?
//    let nationalPokedexNumbers: [Int]
//    let legalities: Legalities
 
//    let tcgplayer: Tcgplayer?
//    let cardmarket: Cardmarket?
//    let evolvesFrom: String?
//    let abilities: [Ability]?
//    let evolvesTo: [String]?

//    let rules: [String]?
//    let regulationMark: String?

//    enum CodingKeys: String, CodingKey {
//        case id, name, supertype, subtypes, level, hp, types, attacks, weaknesses, resistances, retreatCost, convertedRetreatCost
//        case datumSet = "set"
//        case number, artist, rarity, nationalPokedexNumbers, legalities, images, tcgplayer, cardmarket, evolvesFrom, abilities, evolvesTo, flavorText, rules, regulationMark
//    }
}

// MARK: - Attack
struct Attack: Codable {
    let name: String?
    let cost: [String]?
    let convertedEnergyCost: Int?
    let damage, text: String?
}

// MARK: - Ability
struct Ability: Codable {
    let name, text: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case ability = "Ability"
    case pokéBody = "Poké-Body"
    case pokéPower = "Poké-Power"
    case pokémonPower = "Pokémon Power"
}



enum RetreatCost: String, Codable {
    case colorless = "Colorless"
    case darkness = "Darkness"
    case dragon = "Dragon"
    case fighting = "Fighting"
    case fire = "Fire"
    case grass = "Grass"
    case lightning = "Lightning"
    case metal = "Metal"
    case psychic = "Psychic"
    case water = "Water"
}

// MARK: - Cardmarket
struct Cardmarket: Codable {
    let url: String
    let updatedAt: UpdatedAt
    let prices: [String: Double]
}

enum UpdatedAt: String, Codable {
    case the20230316 = "2023/03/16"
}

// MARK: - Set
struct CardSet: Codable {
    let id, name: String
    let series: Series
    let printedTotal, total: Int
    let legalities: Legalities
    let ptcgoCode: String?
    let releaseDate, updatedAt: String
    let images: SetImages
}

// MARK: - SetImages
struct SetImages: Codable {
    let symbol, logo: String
}

// MARK: - Legalities
struct Legalities: Codable {
    let unlimited: Expanded
    let expanded, standard: Expanded?
}

enum Expanded: String, Codable {
    case legal = "Legal"
}

enum Series: String, Codable {
    case base = "Base"
    case blackWhite = "Black & White"
    case diamondPearl = "Diamond & Pearl"
    case eCard = "E-Card"
    case ex = "EX"
    case gym = "Gym"
    case heartGoldSoulSilver = "HeartGold & SoulSilver"
    case neo = "Neo"
    case other = "Other"
    case platinum = "Platinum"
    case pop = "POP"
    case sunMoon = "Sun & Moon"
    case swordShield = "Sword & Shield"
    case xy = "XY"
}

// MARK: - DatumImages
struct CardImages: Codable {
    let small, large: String?
}

enum Rarity: String, Codable {
    case common = "Common"
    case promo = "Promo"
    case rare = "Rare"
    case rareHolo = "Rare Holo"
    case rareHoloEX = "Rare Holo EX"
    case rareHoloGX = "Rare Holo GX"
    case rareHoloV = "Rare Holo V"
    case rareUltra = "Rare Ultra"
    case uncommon = "Uncommon"
}

// MARK: - Resistance
struct Resistance: Codable {
    let type: RetreatCost
    let value: String
}

enum Subtype: String, Codable {
    case basic = "Basic"
    case ex = "EX"
    case gx = "GX"
    case mega = "MEGA"
    case restored = "Restored"
    case sp = "SP"
    case stage1 = "Stage 1"
    case stage2 = "Stage 2"
    case tagTeam = "TAG TEAM"
    case teamPlasma = "Team Plasma"
    case v = "V"
}

enum Supertype: String, Codable {
    case pokémon = "Pokémon"
}

// MARK: - Tcgplayer
struct Tcgplayer: Codable {
    let url: String
    let updatedAt: UpdatedAt
    let prices: Prices
}

// MARK: - Prices
struct Prices: Codable {
    let holofoil, reverseHolofoil, normal, the1StEditionHolofoil: The1_StEditionHolofoil?
    let unlimitedHolofoil: The1_StEditionHolofoil?

    enum CodingKeys: String, CodingKey {
        case holofoil, reverseHolofoil, normal
        case the1StEditionHolofoil = "1stEditionHolofoil"
        case unlimitedHolofoil
    }
}

// MARK: - The1_StEditionHolofoil
struct The1_StEditionHolofoil: Codable {
    let low, mid, high: Double
    let market, directLow: Double?
}
