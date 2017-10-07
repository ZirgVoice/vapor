import Async

/// Types conforming to this protocol can be used
/// as a Fluent database connection for executing queries.
public protocol DatabaseConnection {
    /// Executes the supplied query on the database connection.
    /// The returned future will be completed when the query is complete.
    /// Results will be outputed through the query's output stream.
    func execute<M, I: InputStream, D: Decodable>(
        query: Query<M>,
        into stream: I
    ) -> Future<Void> where I.Input == D
}
