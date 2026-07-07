import SwiftUI

enum Theme {
    static let background = Color(red: 0.05, green: 0.09, blue: 0.10)
    static let accent = Color(red: 0.16, green: 0.45, blue: 0.55)
    static let accentSecondary = Color(red: 0.55, green: 0.75, blue: 0.70)
    static let cardBackground = background.opacity(0.6)
    static let textPrimary = Color.white
    static let textSecondary = Color.white.opacity(0.65)

    static var titleFont: Font { .system(.title2, design: .serif).weight(.bold) }
    static var headlineFont: Font { .system(.headline, design: .rounded) }
    static var bodyFont: Font { .system(.body, design: .rounded) }
    static var captionFont: Font { .system(.caption, design: .rounded) }

    static let cardCornerRadius: CGFloat = 16
}
