import XCTest
@testable import Riverwatch

final class StoreTests: XCTestCase {
    var store: Store!

    override func setUp() {
        super.setUp()
        store = Store()
        store.entries = []
    }

    func testAddEntryIncreasesCount() {
        let before = store.entries.count
        store.add(LogEntry(spot: "Test", clarity: "Value", notes: "Note"))
        XCTAssertEqual(store.entries.count, before + 1)
    }

    func testNewestEntryInsertedFirst() {
        store.add(LogEntry(spot: "First", clarity: "A", notes: ""))
        store.add(LogEntry(spot: "Second", clarity: "B", notes: ""))
        XCTAssertEqual(store.entries.first?.spot, "Second")
    }

    func testCanAddMoreWhenUnderLimit() {
        XCTAssertTrue(store.canAddMore)
    }

    func testCannotAddMoreWhenAtFreeLimit() {
        for i in 0..<Store.freeTierLimit {
            store.add(LogEntry(spot: "Item \(i)", clarity: "V", notes: ""))
        }
        XCTAssertFalse(store.canAddMore)
    }

    func testAddBeyondLimitIsNoOp() {
        for i in 0..<Store.freeTierLimit {
            store.add(LogEntry(spot: "Item \(i)", clarity: "V", notes: ""))
        }
        let countAtLimit = store.entries.count
        store.add(LogEntry(spot: "Overflow", clarity: "V", notes: ""))
        XCTAssertEqual(store.entries.count, countAtLimit)
    }

    func testDeleteAtOffsetsRemovesEntry() {
        store.add(LogEntry(spot: "ToDelete", clarity: "V", notes: ""))
        store.delete(at: IndexSet(integer: 0))
        XCTAssertTrue(store.entries.isEmpty)
    }

    func testUpdateEntryModifiesExisting() {
        store.add(LogEntry(spot: "Original", clarity: "V", notes: ""))
        var entry = store.entries[0]
        entry.spot = "Updated"
        store.update(entry)
        XCTAssertEqual(store.entries[0].spot, "Updated")
    }

    func testFreeTierLimitExceedsSeedCount() {
        XCTAssertGreaterThan(Store.freeTierLimit, 3)
    }
}
