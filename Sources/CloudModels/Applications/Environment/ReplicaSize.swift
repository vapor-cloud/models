public enum ReplicaSize {
    case free
    case hobby
    case small
    case medium
    case large
    case xlarge
}

extension ReplicaSize: NodeConvertible {
    public init(node: Node) throws {
        switch node.string ?? "" {
        case "free":
            self = .free
        case "hobby":
            self = .hobby
        case "small":
            self = .small
        case "medium":
            self = .medium
        case "large":
            self = .large
        case "xlarge":
            self = .xlarge
        default:
            throw NodeError.unableToConvert(
                input: node,
                expectation: "ReplicaSize",
                path: []
            )
        }
    }
    
    public var string: String {
        switch self {
        case .free:
            return "free"
        case .hobby:
            return "hobby"
        case .small:
            return "small"
        case .medium:
            return "medium"
        case .large:
            return "large"
        case .xlarge:
            return "xlarge"
        }
    }
    
    public func makeNode(in context: Context?) throws -> Node {
        return Node(string)
    }
}

extension ReplicaSize {
    public static var all: [ReplicaSize] {
        return [.free, .hobby, .small, .medium, .large, .xlarge]
    }
}
