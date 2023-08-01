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
    }

    fileprivate func degrade() {
        if quality > 0 {
            quality -= 1
        }
        if sellIn < 0 && quality > 0 {
            quality -= 1
        }
    }

    fileprivate func age() {
        sellIn -= 1
    }
}


class Brie: BaseItem {
    override func degrade() {
        if quality < 50 {
            quality += 1
        }
        if sellIn < 0 && quality < 50 {
            quality += 1
        }
    }
}


class Pass: BaseItem {
    override func degrade() {
        if quality < 50 {
            quality += 1

            if sellIn < 10 && quality < 50 {
                quality += 1
            }

            if sellIn < 5 && quality < 50 {
                quality += 1
            }
        }
        if sellIn < 0 {
            quality = 0
        }
    }
}


class Sulfuras: BaseItem {
    override func degrade() {}
    override func age() {}
}
