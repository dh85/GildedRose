class GildedRose {
    var items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    func updateQuality() {
        for item in items {
            item.update()
        }
    }
}
