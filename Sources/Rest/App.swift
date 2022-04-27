import Compute
import Foundation

@main
struct App {
    static func main() async throws {
        NFLPlayersRoutes.register(router)
        try await onIncomingRequest(router.run)
    }

    static let router = Router()
}

struct NFLPlayersRoutes {
    static func register(_ router: Router) {
        router.get("/players")
    }

    static func getPlayers(req: IncomingRequest, res: OutgoingResponse) async throws {
        try await res.status(.ok).send("players")
    }
}
