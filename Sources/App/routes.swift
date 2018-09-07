import Vapor

public func routes(_ router: Router) throws {

    router.get("hello") { req in
        return "Hello, world!"
    }

    router.post("api", "acronyms") { req -> Future<Acronym> in
        return try req.content.decode(Acronym.self)
            .flatMap { acronym in
                return acronym.save(on: req)
        }
    }
}
