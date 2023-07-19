import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> getConnection() async {
  final connection = PostgreSQLConnection(
    'your_server_ip',
    5432,
    'your_database_name',
    username: 'your_username',
    password: 'your_password',
  );

  try {
    await connection.open();
    return connection;
  } catch (e) {
    print('Error connecting to the database: $e');
    rethrow; // Rethrow the exception to be handled in the calling function.
  }
}

Future<void> runDatabaseQuery() async {
  PostgreSQLConnection? connection;

  try {
    connection = await getConnection();

    // Database queries and operations...
  } catch (e) {
    print('Error: $e');
  } finally {
    // connection?.close();
    connection?.close();
  }
}
