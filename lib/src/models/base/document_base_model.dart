import 'package:meta/meta.dart';

import '../../clients/base/couchdb_base_client.dart';
import '../../entities/db_response.dart';
import 'base_model.dart';

/// Class that define methods for create, read, update and delete documents within a database
abstract class DocumentBaseModel extends BaseModel {

  /// Create DocumentModel by accepting web-based or server-based client
  DocumentBaseModel(CouchDbBaseClient client): super(client);

  /// Returns the HTTP Headers containing a minimal amount of information about the specified document
  Future<DbResponse> docInfo(
    String dbName,
    String docId,
    {
      Map<String, String> headers,
      bool attachments = false,
      bool attEncodingInfo = false,
      List<String> attsSince,
      bool conflicts = false,
      bool deletedConflicts = false,
      bool latest = false,
      bool localSeq = false,
      bool meta = false,
      Object openRevs,
      String rev,
      bool revs = false,
      bool revsInfo = false
    }
  );

  /// Returns document by the specified [docId] from the specified [dbName]
  Future<DbResponse> getDoc(
    String dbName,
    String docId,
    {
      Map<String, String> headers,
      bool attachments = false,
      bool attEncodingInfo = false,
      List<String> attsSince,
      bool conflicts = false,
      bool deletedConflicts = false,
      bool latest = false,
      bool localSeq = false,
      bool meta = false,
      Object openRevs,
      String rev,
      bool revs = false,
      bool revsInfo = false
    }
  );


  Future<String> insertDoc(
    String dbName,
    String docId,
    {
      String rev,
      String batch,
      bool newEdits = true
    }
  );
  Future<String> deleteDoc(
    String dbName,
    String docId,
    String rev,
    {
      String batch
    }
  );
  Future<String> copyDoc(
    String dbName,
    String docId,
    {
      String rev,
      String batch
    }
  );
  Future<String> attachmentInfo(
    String dbName,
    String docId,
    String attName,
    {
      String rev
    }
  );
  Future<String> getAttachment(
    String dbName,
    String docId,
    String attName,
    {
      String rev
    }
  );
  Future<String> insertAttachment(
    String dbName,
    String docId,
    String attName,
    {
      String rev
    }
  );
  Future<String> deleteAttachment(
    String dbName,
    String docId,
    String attName,
    {
      @required String rev,
      String batch
    }
  );
}