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
    enum StoryError: Error {
        case badURL
    }

    static func register(_ router: Router) {
        router.get("/stories", getStories)
    }

    static func getStories(req: IncomingRequest, res: OutgoingResponse) async throws {
        guard let url = URL(string: "https://union.barstoolsports.com/v2/stories/latest?type=standard_post&page=1&limit25") else {
            throw StoryError.badURL
        }
        let fetchRequest = FetchRequest(url)
        let fetchResponse = try await fetch(fetchRequest)
        res.status(fetchResponse.status).send(fetchResponse.body)
        // try await res.status(.ok).send("stories")
    }
}
