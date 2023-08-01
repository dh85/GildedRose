class Item {
    let name: String
    var sellIn: Int
    var quality: Int

    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }

    func update() {
        sellIn -= aging()
        quality = saturation(quality: quality - degradation(sellIn: sellIn, quality: quality))
    }

    fileprivate func aging() -> Int { 1 }

    fileprivate func degradation(sellIn: Int, quality: Int) -> Int {
        sellIn < 0 ? 2 : 1
    }

    fileprivate func saturation(quality: Int) -> Int {
        switch quality {
        case _ where quality < 0: return 0
        case _ where quality > 50: return 50
        default: return quality
        }
    }
}

extension Item: CustomStringConvertible {
    var description: String {
        "\(name), \(sellIn), \(quality)"
    }
}


class Brie: Item {
    override func degradation(sellIn: Int, quality: Int) -> Int {
        sellIn < 0 ? -2 : -1
    }
}


class Pass: Item {
    override func degradation(sellIn: Int, quality: Int) -> Int {
        switch sellIn {
        case _ where sellIn < 0: return quality
        case _ where sellIn < 5: return -3
        case _ where sellIn < 10: return -2
        default: return -1
        }
    }
}


class Sulfuras: Item {
    override func aging() -> Int { 0 }
    override func degradation(sellIn: Int, quality: Int) -> Int { 0 }
    override func saturation(quality: Int) -> Int { quality }
}
