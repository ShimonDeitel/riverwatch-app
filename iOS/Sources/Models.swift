import Foundation

struct LogEntry: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var spot: String
    var clarity: String
    var notes: String
    var date: Date = Date()
}
