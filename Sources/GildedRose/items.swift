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

func Conjured(name: String, sellIn: Int, quality: Int) -> Item {
    Item(name: name, sellIn: sellIn, quality: quality, degradation: { sellIn, _ in
        sellIn < 0 ? 4 : 2
    })
}
