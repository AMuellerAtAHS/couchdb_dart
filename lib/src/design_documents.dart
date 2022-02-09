import 'interfaces/client_interface.dart';
import 'interfaces/design_documents_interface.dart';
import 'responses/design_documents_response.dart';

/// Class that contains methods that allow operate with design documents
class DesignDocuments implements DesignDocumentsInterface {
  /// Instance of connected client
  final ClientInterface _client;

  /// Create DesignDocument by accepting web-based or server-based client
  DesignDocuments(this._client);

  @override
  Future<DesignDocumentsResponse> designDocHeaders(String dbName, String ddocId,
      {Map<String, String> headers = const {},
      bool attachments = false,
      bool attEncodingInfo = false,
      List<String>? attsSince,
      bool conflicts = false,
      bool deletedConflicts = false,
      bool latest = false,
      bool localSeq = false,
      bool meta = false,
      dynamic openRevs,
      String? rev,
      bool revs = false,
      bool revsInfo = false}) async {
    final path = '$dbName/$ddocId?'
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
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> designDoc(
    String dbName,
    String ddocId, {
    Map<String, String> headers = const {},
    bool attachments = false,
    bool attEncodingInfo = false,
    List<String>? attsSince,
    bool conflicts = false,
    bool deletedConflicts = false,
    bool latest = false,
    bool localSeq = false,
    bool meta = false,
    dynamic openRevs,
    String? rev,
    bool revs = false,
    bool revsInfo = false,
  }) async {
    final path = '$dbName/$ddocId?'
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
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> insertDesignDoc(
    String dbName,
    String ddocId,
    Map<String, dynamic> body, {
    Map<String, String> headers = const {},
    String? rev,
    String? batch,
    bool newEdits = true,
  }) async {
    final path = '$dbName/$ddocId?'
        'new_edits=$newEdits'
        '&rev=${rev ?? ''}'
        '&batch=${batch ?? ''}';

    final result = await _client.put(path, reqHeaders: headers, body: body);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> deleteDesignDoc(
    String dbName,
    String ddocId,
    String rev, {
    Map<String, String> headers = const {},
    String? batch,
  }) async {
    final path = '$dbName/$ddocId?rev=$rev'
        '&batch=${batch ?? ''}';

    final result = await _client.delete(path, reqHeaders: headers);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> copyDesignDoc(
    String dbName,
    String ddocId, {
    Map<String, String> headers = const {},
    String? rev,
    String? batch,
  }) async {
    final path = '$dbName/$ddocId?'
        'rev=${rev ?? ''}'
        '&batch=${batch ?? ''}';

    final result = await _client.copy(path, reqHeaders: headers);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> attachmentInfo(
      String dbName, String ddocId, String attName,
      {Map<String, String> headers = const {}, String? rev}) async {
    final path = '$dbName/$ddocId/$attName?rev=${rev ?? ''}';

    final result = await _client.head(path, reqHeaders: headers);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> attachment(
      String dbName, String ddocId, String attName,
      {Map<String, String> headers = const {}, String? rev}) async {
    final path = '$dbName/$ddocId/$attName?rev=${rev ?? ''}';

    final result = await _client.get(path, reqHeaders: headers);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> uploadAttachment(
      String dbName, String ddocId, String attName, dynamic body,
      {Map<String, String> headers = const {}, String? rev}) async {
    final path = '$dbName/$ddocId/$attName?rev=${rev ?? ''}';

    final result = await _client.put(path, reqHeaders: headers, body: body);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> deleteAttachment(
      String dbName, String ddocId, String attName,
      {required String rev,
      Map<String, String> headers = const {},
      String? batch}) async {
    final path = '$dbName/$ddocId/$attName?rev=$rev'
        '&batch=${batch ?? ''}';

    final result = await _client.delete(path, reqHeaders: headers);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> designDocInfo(String dbName, String ddocId,
      {Map<String, String> headers = const {}}) async {
    final path = '$dbName/$ddocId/_info';

    final result = await _client.get(path, reqHeaders: headers);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeViewFunction(
      String dbName, String ddocId, String viewName,
      {bool conflicts = false,
      bool descending = false,
      dynamic endKey,
      String? endKeyDocId,
      bool? group = false,
      int? groupLevel,
      bool includeDocs = false,
      bool attachments = false,
      bool attEncodingInfo = false,
      bool inclusiveEnd = true,
      dynamic key,
      List<dynamic>? keys,
      int? limit,
      bool reduce = false, // for solving conflict with [conflicts]
      int skip = 0,
      bool sorted = true,
      bool stable = false,
      String? stale,
      dynamic startKey,
      String? startKeyDocId,
      String update = 'true',
      bool updateSeq = false,
      Map<String, String> headers = const {}}) async {
    String path;

    if (reduce == true) {
      path = '$dbName/$ddocId/_view/$viewName?'
          '&descending=$descending'
          '&endkey=${endKey ?? ''}'
          '&endkey_docid=${endKeyDocId ?? ''}'
          '&group=$group'
          '&group_level=${groupLevel ?? ''}'
          '&include_docs=$includeDocs'
          '&attachments=$attachments'
          '&att_encoding_info=$attEncodingInfo'
          '&inclusive_end=$inclusiveEnd'
          '&key=${key ?? ''}'
          '&keys=${keys ?? ''}'
          '&limit=${limit ?? ''}'
          '&reduce=$reduce'
          '&skip=$skip'
          '&sorted=$sorted'
          '&stable=$stable'
          '&stale=${stale ?? ''}'
          '&startkey=${startKey ?? ''}'
          '&startkey_docid=${startKeyDocId ?? ''}'
          '&update=$update'
          '&update_seq=$updateSeq';
    } else {
      path = '$dbName/$ddocId/_view/$viewName?'
          'conflicts=$conflicts'
          '&descending=$descending'
          '&endkey=${endKey ?? ''}'
          '&endkey_docid=${endKeyDocId ?? ''}'
          '&group=$group'
          '&group_level=${groupLevel ?? ''}'
          '&include_docs=$includeDocs'
          '&attachments=$attachments'
          '&att_encoding_info=$attEncodingInfo'
          '&inclusive_end=$inclusiveEnd'
          '&key=${key ?? ''}'
          '&keys=${keys ?? ''}'
          '&limit=${limit ?? ''}'
          '&reduce=$reduce'
          '&skip=$skip'
          '&sorted=$sorted'
          '&stable=$stable'
          '&stale=${stale ?? ''}'
          '&startkey=${startKey ?? ''}'
          '&startkey_docid=${startKeyDocId ?? ''}'
          '&update=$update'
          '&update_seq=$updateSeq';
    }

    final result = await _client.get(path, reqHeaders: headers);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeViewFunctionWithKeys(
      String dbName, String ddocId, String viewName,
      {required List<dynamic> keys,
      bool conflicts = false,
      bool descending = false,
      dynamic endKey,
      String? endKeyDocId,
      bool group = false,
      int? groupLevel,
      bool includeDocs = false,
      bool attachments = false,
      bool attEncodingInfo = false,
      bool inclusiveEnd = true,
      dynamic key,
      int? limit,
      bool reduce = false, // Reason is the same as above
      int skip = 0,
      bool sorted = true,
      bool stable = false,
      String? stale,
      dynamic startKey,
      String? startKeyDocId,
      String update = 'true',
      bool updateSeq = false,
      Map<String, String> headers = const {}}) async {
    String path;

    if (reduce == true) {
      path = '$dbName/$ddocId/_view/$viewName?'
          '&descending=$descending'
          '&endkey=${endKey ?? ''}'
          '&endkey_docid=${endKeyDocId ?? ''}'
          '&group=$group'
          '&group_level${groupLevel ?? ''}'
          '&include_docs=$includeDocs'
          '&attachments=$attachments'
          '&att_encoding_info=$attEncodingInfo'
          '&inclusive_end=$inclusiveEnd'
          '&key=${key ?? ''}'
          '&limit=${limit ?? ''}'
          '&reduce=$reduce'
          '&skip=$skip'
          '&sorted=$sorted'
          '&stable=$stable'
          '&stale=${stale ?? ''}'
          '&startkey=${startKey ?? ''}'
          '&startkey_docid=${startKeyDocId ?? ''}'
          '&update=$update'
          '&update_seq=$updateSeq';
    } else {
      path = '$dbName/$ddocId/_view/$viewName?'
          'conflicts=$conflicts'
          '&descending=$descending'
          '&endkey=${endKey ?? ''}'
          '&endkey_docid=${endKeyDocId ?? ''}'
          '&group=$group'
          '&group_level=${groupLevel ?? ''}'
          '&include_docs=$includeDocs'
          '&attachments=$attachments'
          '&att_encoding_info=$attEncodingInfo'
          '&inclusive_end=$inclusiveEnd'
          '&key=${key ?? ''}'
          '&limit=${limit ?? ''}'
          '&reduce=$reduce'
          '&skip=$skip'
          '&sorted=$sorted'
          '&stable=$stable'
          '&stale=${stale ?? ''}'
          '&startkey=${startKey ?? ''}'
          '&startkey_docid=${startKeyDocId ?? ''}'
          '&update=$update'
          '&update_seq=$updateSeq';
    }

    final body = <String, List<dynamic>>{'keys': keys};

    final result = await _client.post(path, reqHeaders: headers, body: body);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeViewQueries(String dbName,
      String ddocId, String viewName, List<dynamic> queries) async {
    final body = <String, List<dynamic>>{'queries': queries};

    final result = await _client.post('$dbName/$ddocId/_view/$viewName/queries',
        body: body);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeShowFunctionForNull(
      String dbName, String ddocId, String funcName,
      {String? format}) async {
    final result = await _client
        .get('$dbName/$ddocId/_show/$funcName?format=${format ?? ''}');
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeShowFunctionForDocument(
      String dbName, String ddocId, String funcName, String docId,
      {String? format}) async {
    final result = await _client
        .get('$dbName/$ddocId/_show/$funcName/$docId?format=${format ?? ''}');
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeListFunctionForView(
      String dbName, String ddocId, String funcName, String view,
      {String? format}) async {
    final result = await _client
        .get('$dbName/$ddocId/_list/$funcName/$view?format=${format ?? ''}');
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeListFunctionForViewFromDoc(
      String dbName,
      String ddocId,
      String funcName,
      String otherDoc,
      String view,
      {String? format}) async {
    final result = await _client.get(
        '$dbName/$ddocId/_list/$funcName/$otherDoc/$view?format=${format ?? ''}');
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeUpdateFunctionForNull(
      String dbName, String ddocId, String funcName, dynamic body) async {
    final result =
        await _client.post('$dbName/$ddocId/_update/$funcName', body: body);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> executeUpdateFunctionForDocument(
      String dbName,
      String ddocId,
      String funcName,
      String docId,
      dynamic body) async {
    final result = await _client.put('$dbName/$ddocId/_update/$funcName/$docId',
        body: body);
    return DesignDocumentsResponse.from(result);
  }

  @override
  Future<DesignDocumentsResponse> rewritePath(
    String dbName,
    String ddocId,
    String path,
  ) async {
    final result = await _client.put('$dbName/$ddocId/_rewrite/$path');
    return DesignDocumentsResponse.from(result);
  }
}
