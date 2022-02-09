import 'package:couchdb/couchdb.dart';

Future<void> main() async {
  final client =
      CouchDbClient.fromString('http://anna:secret@192.168.0.211:5984');
  final dbs = Databases(client);

  try {
    final dbInfo = await dbs.dbInfo('hello-world');
    print(dbInfo.dbName);
  } on CouchDbException catch (e) {
    print(e);
  }
}
