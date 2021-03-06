import Vapor
import Fluent

public func routes(_ router: Router) throws {

    router.get("hello") { req in
        return "Hello, world!"
    }

    let acronymsController = AcronymsController()
    try router.register(collection: acronymsController)

    let usersController = UsersController()
    try router.register(collection: usersController)

    let categoriesController = CategoriesController()
    try router.register(collection: categoriesController)

    let websiteController = WebsiteController()
    try router.register(collection: websiteController)
}
