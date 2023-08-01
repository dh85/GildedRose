class Item {
    let name: String
    var sellIn: Int
    var quality: Int

    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

extension Item: CustomStringConvertible {
    var description: String {
        "\(name), \(sellIn), \(quality)"
    }
}

class BaseItem: Item {
    func update() {
        age()
        degrade()
        saturate()
    }

    fileprivate func age() {
        sellIn -= 1
    }

    fileprivate func degrade() {
        quality -= sellIn < 0 ? 2 : 1
    }

    fileprivate func saturate() {
        if quality < 0 { quality = 0 }
        if quality > 50 { quality = 50 }
    }
}


class Brie: BaseItem {
    override func degrade() {
        quality += sellIn < 0 ? 2 : 1
    }
}


class Pass: BaseItem {
    override func degrade() {
        switch sellIn {
        case _ where sellIn < 0: quality = 0
        case _ where sellIn < 5: quality += 3
        case _ where sellIn < 10: quality += 2
        default: quality += 1
        }
    }
}


class Sulfuras: BaseItem {
    override func degrade() {}
    override func age() {}
    override func saturate() {}
}
