import 'interfaces/client_interface.dart';
import 'interfaces/documents_interface.dart';
import 'responses/documents_response.dart';

/// Class that implements methods for create, read, update and delete documents within a database
class Documents implements DocumentsInterface {
  /// Instance of connected client
  final ClientInterface _client;

  /// Create Documents by accepting web-based or server-based client
  Documents(this._client);

  @override
  Future<DocumentsResponse> docInfo(
    String dbName,
    String docId, {
    Map<String, String> headers = const {},
    bool attachments = false,
    bool attEncodingInfo = false,
    List<String>? attsSince,
    bool conflicts = false,
    bool deletedConflicts = false,
    bool latest = false,
    bool localSeq = false,
    bool meta = false,
    Object? openRevs,
    String? rev,
    bool revs = false,
    bool revsInfo = false,
  }) async {
    final path = '$dbName/$docId?'
        'attachments=$attachments'
        '&att_encoding_info=$attEncodingInfo'
        '&atts_since=${attsSince ?? ''}'
        '&conflicts=$conflicts'
        '&deleted_conflicts=$deletedConflicts'
        '&latest=$latest'
        '&local_seq=$localSeq'
        '&meta=$meta'
        '&open_revs=${openRevs ?? ''}'
        '&rev=${rev ?? ''}'
        '&revs=$revs'
        '&revs_info=$revsInfo';

    final result = await _client.head(path, reqHeaders: headers);
    return DocumentsResponse.from(result);
  }

  @override
  Future<DocumentsResponse> doc(
    String dbName,
    String docId, {
    Map<String, String> headers = const {},
    bool attachments = false,
    bool attEncodingInfo = false,
    List<String>? attsSince,
    bool conflicts = false,
    bool deletedConflicts = false,
    bool latest = false,
    bool localSeq = false,
    bool meta = false,
    Object? openRevs,
    String? rev,
    bool revs = false,
    bool revsInfo = false,
  }) async {
    final path = '$dbName/$docId?'
        'attachments=$attachments'
        '&att_encoding_info=$attEncodingInfo'
        '&atts_since=${attsSince ?? ''}'
        '&conflicts=$conflicts'
        '&deleted_conflicts=$deletedConflicts'
        '&latest=$latest'
        '&local_seq=$localSeq'
        '&meta=$meta'
        '&open_revs=${openRevs ?? ''}'
        '&rev=${rev ?? ''}'
        '&revs=$revs'
        '&revs_info=$revsInfo';

    final result = await _client.get(path, reqHeaders: headers);
    return DocumentsResponse.from(result);
  }

  @override
  Future<DocumentsResponse> insertDoc(
    String dbName,
    String docId,
    Map<String, Object> body, {
    Map<String, String> headers = const {},
    String? rev,
    String? batch,
    bool newEdits = true,
  }) async {
    final path = '$dbName/$docId?'
        'new_edits=$newEdits'
        '&rev${rev ?? ''}'
        '&batch=${batch ?? ''}';

    final result = await _client.put(path, reqHeaders: headers, body: body);
    return DocumentsResponse.from(result);
  }

  @override
  Future<DocumentsResponse> deleteDoc(
    String dbName,
    String docId,
    String rev, {
    Map<String, String> headers = const {},
    String? batch,
  }) async {
    final path = '$dbName/$docId?'
        'rev=$rev'
        '&batch=${batch ?? ''}';

    final result = await _client.delete(path, reqHeaders: headers);
    return DocumentsResponse.from(result);
  }

  @override
  Future<DocumentsResponse> copyDoc(
    String dbName,
    String docId,
    String destinationId, {
    Map<String, String> headers = const <String, String>{},
    String? rev,
    String? destinationRev,
    String? batch,
  }) async {
    final path = '$dbName/$docId?'
        'rev=${rev ?? ''}'
        '&batch=${batch ?? ''}';

    final destination = destinationRev == null
        ? destinationId
        : '$destinationId?rev=$destinationRev';

    headers['Destination'] = destination;

    final result = await _client.copy(path, reqHeaders: headers);
    return DocumentsResponse.from(result);
  }

  @override
  Future<DocumentsResponse> attachmentInfo(
    String dbName,
    String docId,
    String attName, {
    Map<String, String> headers = const <String, String>{},
    String? rev,
  }) async {
    final path = '$dbName/$docId/$attName?rev=${rev ?? ''}';

    final result = await _client.head(path, reqHeaders: headers);
    return DocumentsResponse.from(result);
  }

  @override
  Future<DocumentsResponse> attachment(
    String dbName,
    String docId,
    String attName, {
    Map<String, String> headers = const <String, String>{},
    String? rev,
  }) async {
    final path = '$dbName/$docId/$attName?rev=${rev ?? ''}';

    final result = await _client.get(path, reqHeaders: headers);
    return DocumentsResponse.from(result);
  }

  @override
  Future<DocumentsResponse> uploadAttachment(
    String dbName,
    String docId,
    String attName,
    Object body, {
    Map<String, String> headers = const <String, String>{},
    String? rev,
  }) async {
    final path = '$dbName/$docId/$attName?rev=${rev ?? ''}';

    final result = await _client.put(path, reqHeaders: headers, body: body);
    return DocumentsResponse.from(result);
  }

  @override
  Future<DocumentsResponse> deleteAttachment(
    String dbName,
    String docId,
    String attName, {
    required String rev,
    Map<String, String> headers = const <String, String>{},
    String? batch,
  }) async {
    final path = '$dbName/$docId/$attName?'
        'rev=$rev'
        '&batch=${batch ?? ''}';

    final result = await _client.delete(path, reqHeaders: headers);
    return DocumentsResponse.from(result);
  }
}
