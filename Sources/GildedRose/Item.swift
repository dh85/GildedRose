class Item {
    var name: String
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
        name + ", " + String(sellIn) + ", " + String(quality)
    }
}
