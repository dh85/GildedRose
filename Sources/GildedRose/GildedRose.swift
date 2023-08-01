class GildedRose {
    var items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    func updateQuality() {
        for item in items {
            guard let item = item as? BaseItem else {
                fatalError("Cannot call Item")
            }
            item.update()

        }
    }
}
