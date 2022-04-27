import Compute
import Foundation

@main
struct App {
    static func main() async throws {
        StoryRoutes.register(router)
        try await onIncomingRequest(router.run)
    }

    static let router = Router()
}

struct StoryRoutes {
    static func register(_ router: Router) {
        router.get("/stories", getStories)
    }

    static func getStories(req: IncomingRequest, res: OutgoingResponse) async throws {
        try await res.status(.ok).send("stories")
    }
}
