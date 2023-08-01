struct Item {
    fileprivate let name: String
    fileprivate let sellIn: Int
    fileprivate let quality: Int
    fileprivate var aging: () -> Int = { 1 }
    fileprivate var degradation: (Int, Int) -> Int = { sellIn, _ in
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

func makeItem(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality)
}

func makeBrie(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality, degradation: { sellIn, _ in
        sellIn < 0 ? -2 : -1
    })
}

func makePass(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality, degradation: { sellIn, quality in
        switch sellIn {
        case _ where sellIn < 0: return quality
        case _ where sellIn < 5: return -3
        case _ where sellIn < 10: return -2
        default: return -1
        }
    })
}

func makeSulfuras(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality, aging: { 0 }, degradation: { _, _ in 0 }, saturation: { $0 })
}

func makeConjured(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality, degradation: { sellIn, _ in
        sellIn < 0 ? 4 : 2
    })
}
