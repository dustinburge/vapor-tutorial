@testable import App
import FluentPostgreSQL

extension User {
    static func create(name: String = "Luke", username: String = "lukes", on connection: PostgreSQLConnection) throws -> User {
        let user = User(name: name, username: username)
        return try user.save(on: connection).wait()
    }
}

extension Acronym {
    static func create(short: String = "til", long: String = "today i learned", user: User? = nil, on connection: PostgreSQLConnection) throws -> Acronym {
        let acronymUser = try user ?? User.create(on: connection)
        let acronym = Acronym(short: short, long: long, userId: acronymUser.id!)
        return try acronym.save(on: connection).wait()
    }
}

extension App.Category {
    static func create(name: String = "random", on connection: PostgreSQLConnection) throws -> App.Category {
        let category = Category(name: name)
        return try category.save(on: connection).wait()
    }
}
