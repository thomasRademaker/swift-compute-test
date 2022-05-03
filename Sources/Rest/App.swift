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
        // let stories = try await fetchResponse.decode([Story].self)
        // try await res.status(fetchResponse.status).send(fetchResponse.body.jsonArray())
        // try await res.status(fetchResponse.status).send(fetchResponse.body.jsonObject())
        // try await res.status(.ok).send("stories")
        try await res.status(fetchResponse.status).send(fetchResponse.jsonArray())
    }
}

struct Story: Decodable {

    struct Author: Decodable {
        let id: Int
        let name: String
        let avatar: String
    }

    struct Thumbnail: Decodable {
        let raw: String
        let desktop: String
    }

    let id: Int
    let title: String
    let type: String
    let commentCount: Int
    let tags: [String]
    let date: Date
    let updatedAt: Date
    let slug: String
    let author: Author
    let thumbnail: Thumbnail
}
