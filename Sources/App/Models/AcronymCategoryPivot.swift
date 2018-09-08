import Foundation
import FluentPostgreSQL

final class AcronymCategoryPivot: PostgreSQLUUIDPivot, ModifiablePivot {

    var id: UUID?
    var acronymId: Acronym.ID
    var categoryId: Category.ID

    typealias Left = Acronym
    typealias Right = Category

    static let leftIDKey: LeftIDKey = \.acronymId
    static let rightIDKey: RightIDKey = \.categoryId

    init(_ acronym: Acronym, _ category: Category) throws {
        self.acronymId = try acronym.requireID()
        self.categoryId = try category.requireID()
    }
}

extension AcronymCategoryPivot: Migration {
    static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        return Database.create(self, on: connection) { builder in
            try addProperties(to: builder)
            builder.reference(from: \.acronymId, to: \Acronym.id, onDelete: .cascade)
            builder.reference(from: \.categoryId, to: \Category.id, onDelete: .cascade)
        }
    }
}
