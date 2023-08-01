struct GildedRose {
    let items: [Item]

    func updated() -> GildedRose {
        GildedRose(items: items.map { $0.updated() })
    }
}
