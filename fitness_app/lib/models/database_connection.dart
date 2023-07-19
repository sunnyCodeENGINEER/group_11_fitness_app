import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> getConnection() async {
  final connection = PostgreSQLConnection(
    'your_server_ip',
    5432,
    'your_database_name',
    username: 'your_username',
    password: 'your_password',
  );

  await connection.open();

  return connection;
}

Future<void> runDatabaseQuery() async {
  PostgreSQLConnection? connection;

  try {
    connection = await getConnection();

    // Example query: Select data from a table
    final results = await connection.query('SELECT * FROM "Exercise"');
    for (var row in results) {
      // Process each row
      print(row);
    }

    // Add more queries as needed...

  } catch (e) {
    print('Error: $e');
  } finally {
    connection?.close();
  }
}