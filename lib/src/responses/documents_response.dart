import 'package:couchdb/couchdb.dart';

import '../documents.dart';

/// Class that contains responses from `Documents` class
class DocumentsResponse {
  /// Creates instance of [DocumentsResponse]
  DocumentsResponse({
    required this.doc,
    required this.ok,
    required this.id,
    required this.rev,
    this.attachment,
    required this.conflicts,
    required this.deleted,
    required this.deletedConflicts,
    required this.localSeq,
    required this.revsInfo,
    required this.revisions,
  });

  DocumentsResponse.from(ApiResponse response)
      : this(
            doc: response.json,
            ok: response.json['ok'] as bool,
            id: (response.json['_id'] ?? response.json['id']) as String,
            rev: (response.json['_rev'] ?? response.json['rev']) as String,
            attachment: response.json['_attachments'] ?? response.raw,
            conflicts: (response.json['_conflicts'] as List<dynamic>)
                .map((e) => e as String)
                .toList(),
            deleted: response.json['_deleted'] as bool,
            deletedConflicts:
                (response.json['_deleted_conflicts'] as List<dynamic>)
                    .map((e) => e as String)
                    .toList(),
            localSeq: response.json['_local_seq'] as String,
            revsInfo: (response.json['_revs_info'] as List<dynamic>)
                .map((e) => e as Map<String, dynamic>)
                .toList(),
            revisions: response.json['_revisions'] as Map<String, dynamic>);

  /// Holds document object
  ///
  /// May contain:
  /// - `_id` (string) – Document ID
  /// - `_rev` (string) – Revision MVCC token
  /// - `_deleted` (boolean) – Deletion flag. Available if document was removed
  /// - `_attachments` (object) – Attachment’s stubs. Available if document has any attachments
  /// - `_conflicts` (array) – List of conflicted revisions. Available if requested with `conflicts=true` query parameter
  /// - `_deleted_conflicts` (array) – List of deleted conflicted revisions. Available if requested with `deleted_conflicts=true` query parameter
  /// - `_local_seq (string)` – Document’s update sequence in current database. Available if requested with `local_seq=true` query parameter
  /// - `_revs_info (array)` – List of objects with information about local revisions and their status. Available if requested with `open_revs` query parameter
  /// - `_revisions (object)` – List of local revision tokens without. Available if requested with `revs=true` query parameter
  ///
  /// This properties are listed separately in [DocumentsResponse] and you can get them directly.
  ///
  /// Returns by [Documents.doc]
  final Map<String, dynamic> doc;

  /// Holds operation status. Available in case of success
  final bool ok;

  /// Holds document ID
  final String id;

  /// Holds revision info of document
  final String rev;

  /// Attachment's raw data
  final dynamic attachment;

  /// List of conflicted revisions
  final List<String> conflicts;

  /// Deletion flag. Available if document was removed
  final bool deleted;

  /// List of deleted conflicted revisions
  final List<String> deletedConflicts;

  /// Document’s update sequence in current database
  final String localSeq;

  /// List of objects with information about local revisions and their status
  final List<Map<String, dynamic>> revsInfo;

  /// List of local revision tokens without
  final Map<String, dynamic> revisions;
}
