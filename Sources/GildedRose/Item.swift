struct Item {
    let name: String
    let sellIn: Int
    let quality: Int
    var aging: () -> Int = { 1 }
    var degradation: (Int, Int) -> Int = { sellIn, _ in
        sellIn < 0 ? 2 : 1
    }
    var saturation: (Int) -> Int = { quality in
        switch quality {
        case _ where quality < 0: return 0
        case _ where quality > 50: return 50
        default: return quality
        }
    }
    
    func updated() -> Item {
        let sellIn = sellIn - aging()
        let quality = saturation(quality - degradation(sellIn, quality))
        return Item(
            name: name,
            sellIn: sellIn,
            quality: quality,
            aging: aging,
            degradation: degradation,
            saturation: saturation
        )
    }
}

extension Item: CustomStringConvertible {
    var description: String {
        "\(name), \(sellIn), \(quality)"
    }
}
