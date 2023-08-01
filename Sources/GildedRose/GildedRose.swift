class GildedRose {
    var items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    func updateQuality() {
        items = items.map { $0.updated() }
    }
}
