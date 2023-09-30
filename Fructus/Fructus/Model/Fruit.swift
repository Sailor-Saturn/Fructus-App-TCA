import SwiftUI
import Dependencies

// MARK: - FRUITS DATA MODEL
public struct Fruit: Identifiable, Equatable {
    public let id: UUID
    public var title: String
    public var headline: String
    public var image: String
    public var gradientColors: [Color]
    public var description: String
    public var nutrition: [String]
}
