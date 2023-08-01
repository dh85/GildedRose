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
        foo1()
        age()
        foo3()
    }

    fileprivate func foo1() {
        if quality > 0 {
            quality -= 1
        }
    }

    fileprivate func age() {
        sellIn -= 1
    }

    fileprivate func foo3() {
        if sellIn < 0 && quality > 0 {
            quality -= 1
        }
    }
}


class Brie: BaseItem {
    override func foo1() {
        if quality < 50 {
            quality += 1
        }
    }

    override func foo3() {
        if sellIn < 0 {
            if quality < 50 {
                quality += 1
            }
        }
    }
}


class Pass: BaseItem {
    override func foo1() {
        if quality < 50 {
            quality += 1

            if sellIn < 11 && quality < 50 {
                quality += 1
            }

            if sellIn < 6 && quality < 50 {
                quality += 1
            }
        }
    }

    override func foo3() {
        if sellIn < 0 {
            quality = 0
        }
    }
}


class Sulfuras: BaseItem {
    override func foo1() {}
    override func age() {}
    override func foo3() {}
}
