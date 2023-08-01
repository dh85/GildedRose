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

        if name != "Sulfuras, Hand of Ragnaros" {
            sellIn = sellIn - 1
        }

        if sellIn < 0 {
            if name != "Aged Brie" {
                if name != "Backstage passes to a TAFKAL80ETC concert" {
                    if quality > 0 {
                        if name != "Sulfuras, Hand of Ragnaros" {
                            quality = quality - 1
                        }
                    }
                } else {
                    quality = quality - quality
                }
            } else {
                if quality < 50 {
                    quality = quality + 1
                }
            }
        }
    }

    fileprivate func foo1() {
        if quality > 0 {
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
}


class Sulfuras: BaseItem {
    override func foo1() {}
}
