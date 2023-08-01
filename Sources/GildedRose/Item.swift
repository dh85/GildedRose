class Item {
    let name: String
    var sellIn: Int
    var quality: Int
    private let aging: () -> Int
    private let degradation: (Int, Int) -> Int
    private let saturation: (Int) -> Int

    init(
        name: String,
        sellIn: Int,
        quality: Int,
        aging: @escaping () -> Int = { 1 },
        degradation: @escaping (Int, Int) -> Int = { sellIn, _ in
            sellIn < 0 ? 2 : 1
        },
        saturation: @escaping (Int) -> Int = { quality in
            switch quality {
            case _ where quality < 0: return 0
            case _ where quality > 50: return 50
            default: return quality
            }
        }
    ) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.aging = aging
        self.degradation = degradation
        self.saturation = saturation
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


func Brie(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality, degradation: { sellIn, _ in
        sellIn < 0 ? -2 : -1
    })
}

func Pass(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality, degradation: { sellIn, quality in
        switch sellIn {
        case _ where sellIn < 0: return quality
        case _ where sellIn < 5: return -3
        case _ where sellIn < 10: return -2
        default: return -1
        }
    })
}

func Sulfuras(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality, aging: { 0 }, degradation: { _, _ in 0 }, saturation: { $0 })
}
