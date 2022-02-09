import 'package:couchdb/couchdb.dart';

import '../databases.dart';

/// Class that contains responses from `Databases` class
class DatabasesResponse {
  /// Creates instance of [DatabasesResponse]
  DatabasesResponse({
    required this.cluster,
    required this.compactRunning,
    required this.dbName,
    required this.diskFormatVersion,
    required this.docCount,
    required this.docDelCount,
    required this.purgeSeq,
    required this.sizes,
    required this.updateSeq,
    required this.ok,
    required this.id,
    required this.rev,
    required this.offset,
    required this.rows,
    required this.totalRows,
    required this.results,
    required this.docs,
    required this.warning,
    required this.executionStats,
    required this.bookmark,
    required this.result,
    required this.name,
    required this.indexes,
    required this.index,
    required this.selector,
    required this.opts,
    required this.limit,
    required this.skip,
    required this.fields,
    required this.range,
    required this.lastSeq,
    required this.pending,
    required this.admins,
    required this.members,
    required this.purged,
    required this.missedRevs,
    required this.revsDiff,
    required this.list,
    required this.shards,
    required this.shardRange,
    required this.nodes,
  });

  /// Returns response with fields that may be returned by `Databases`
  /// request methods
  DatabasesResponse.from(ApiResponse response)
      : this(
            cluster: (response.json['cluster'] as Map<String, dynamic>?)
                ?.map((k, v) => MapEntry<String, int>(k, v as int)),
            compactRunning: response.json['compact_running'] as bool,
            dbName:
                (response.json['db_name'] ?? response.json['dbname']) as String,
            diskFormatVersion: response.json['disk_format_version'] as int,
            docCount: response.json['doc_count'] as int,
            docDelCount: response.json['doc_del_count'] as int,
            purgeSeq: response.json['purge_seq'] as String,
            sizes: (response.json['sizes'] as Map<String, dynamic>?)
                ?.map((k, v) => MapEntry<String, int>(k, v as int)),
            updateSeq: response.json['update_seq'] as String,
            ok: response.json['ok'] as bool?,
            id: response.json['id'] as String?,
            rev: response.json['rev'] as String?,
            offset: response.json['offset'] as int?,
            rows: (response.json['rows'] as List<dynamic>?)
                ?.map((e) => e as Map<String, dynamic>)
                .toList(),
            totalRows: response.json['total_rows'] as int?,
            results: (response.json['results'] as List<dynamic>?)
                ?.map((e) => e as Map<String, dynamic>)
                .toList(),
            docs: (response.json['docs'] as List<dynamic>?)
                ?.map((e) => e as Map<String, dynamic>)
                .toList(),
            warning: response.json['warning'] as String?,
            executionStats:
                (response.json['execution_stats'] as Map<String, dynamic>?)
                    ?.map((k, v) => MapEntry<String, num>(k, v as num)),
            bookmark: response.json['bookmark'] as String?,
            result: response.json['result'] as String?,
            name: response.json['name'] as String?,
            indexes: (response.json['indexes'] as List<dynamic>?)
                ?.map((e) => e as Map<String, dynamic>)
                .toList(),
            index: response.json['index'] as Map<String, dynamic>?,
            selector: (response.json['selector'] as Map<String, dynamic>?)?.map(
                (k, v) => MapEntry<String, Map<String, dynamic>>(k, v as Map<String, dynamic>)),
            opts: response.json['opts'] as Map<String, dynamic>?,
            limit: response.json['limit'] as int?,
            skip: response.json['skip'] as int?,
            fields: response.json['fields'] is String ? <String>[response.json['fields'] as String] : (response.json['fields'] as List<dynamic>?)?.map((e) => e as String).toList(),
            range: response.json['range'] is Map<String, dynamic> ? (response.json['range'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v as List<dynamic>)) : null,
            lastSeq: response.json['last_seq'] as String?,
            pending: response.json['pending'] as int?,
            admins: (response.json['admins'] as Map<String, dynamic>?)?.map((k, v) => MapEntry<String, List<String>>(k, (v as List<dynamic>).map((e) => e as String).toList())),
            members: (response.json['members'] as Map<String, dynamic>?)?.map((k, v) => MapEntry<String, List<String>>(k, (v as List<dynamic>).map((e) => e as String).toList())),
            purged: (response.json['purged'] as Map<String, dynamic>?)?.map((k, v) => MapEntry<String, Map<String, List<String>>>(k, (v as Map<String, dynamic>).map((k, v) => MapEntry<String, List<String>>(k, (v as List<dynamic>).map((e) => e as String).toList())))),
            missedRevs: (response.json['missed_revs'] as Map<String, dynamic>?)?.map((k, v) => MapEntry<String, List<String>>(k, (v as List<dynamic>).map((e) => e as String).toList())),
            revsDiff: response.json.keys.every(RegExp('[a-z0-9-]{32,36}').hasMatch) ? response.json.map((k, v) => MapEntry<String, Map<String, List<String>>>(k, (v as Map<String, dynamic>).map((k, v) => MapEntry<String, List<String>>(k, (v as List<dynamic>).map((e) => e as String).toList())))) : null,
            list: (response.json['list'] as List<dynamic>?)?.map((e) => e as Map<String, dynamic>).toList(),
            shards: (response.json['shards'] as Map<String, dynamic>?)?.map((k, v) => MapEntry<String, List<String>>(k, (v as List<dynamic>).map((v) => v as String).toList())),
            shardRange: response.json['range'] is String? ? response.json['range'] as String? : null,
            nodes: (response.json['nodes'] as List<dynamic>?)?.map((v) => v as String).toList());

  /// Holds cluster's info
  final Map<String, int>? cluster;

  /// Is true if the database compaction routine is operating on this database
  ///
  /// Returns by [Databases.dbInfo]
  final bool compactRunning;

  /// Holds the name of the database
  final String dbName;

  /// The version of the physical format used for the data when it
  /// is stored on disk
  final int diskFormatVersion;

  /// A count of the documents in the specified database
  final int docCount;

  /// Number of deleted documents
  final int docDelCount;

  /// An opaque string that describes the purge state of the database
  ///
  /// Do not rely on this string for counting the number of purge operations.
  final String purgeSeq;

  /// Sizes info returned by [Databases.dbInfo]
  final Map<String, int>? sizes;

  /// An opaque string that describes the state of the database
  ///
  /// Do not rely on this string for counting the number of updates.
  final String updateSeq;

  /// Holds operation status. Available in case of success
  final bool? ok;

  /// Holds document ID
  final String? id;

  /// Holds revision info
  final String? rev;

  /// Holds counts of documents skipped by search?
  final int? offset;

  /// List of documents returned by search
  final List<Map<String, dynamic>?>? rows;

  /// Holds total number of documents returned by search
  final int? totalRows;

  /// Holds result objects - one for each query
  ///
  /// Returned by [Databases.queriesDocsFrom], [Databases.bulkDocs],
  /// [Databases.changesIn]
  final List<Map<String, dynamic>>? results;

  /// Holds documents matching the search
  final List<Map<String, dynamic>>? docs;

  /// Holds execution warnings
  final String? warning;

  /// Execution statistics info
  final Map<String, num>? executionStats;

  /// An opaque string used for paging
  final String? bookmark;

  /// Flag to show whether the index was created or one already exists.
  /// Can be “created” or “exists”
  final String? result;

  /// Holds name of the index created
  final String? name;

  /// Holds array of index definitions
  final List<Map<String, dynamic>>? indexes;

  /// Index used to fulfill the query
  final Map<String, dynamic>? index;

  /// Holds query selector used
  final Map<String, Map<String, dynamic>>? selector;

  /// Holds query options used
  final Map<String, dynamic>? opts;

  /// Holds limit parameter used
  ///
  /// Returns by [Databases.purgedInfosLimit], [Databases.explain]
  final int? limit;

  /// Holds skip parameter used
  final int? skip;

  /// Fields to be returned by the query
  final List<String>? fields;

  /// Range parameters passed to the underlying view
  final Map<String, List<dynamic>>? range;

  /// Last change update sequence info
  final String? lastSeq;

  /// Count of remaining items in the feed
  final int? pending;

  /// Holds list of users and/or roles that have admin rights
  final Map<String, List<String>>? admins;

  /// Holds list of users and/or roles that have member rights
  final Map<String, List<String>>? members;

  /// Mapping of document ID to list of purged revisions
  final Map<String, Map<String, List<String>>>? purged;

  /// Holds mapping of document ID to list of missed revisions
  final Map<String, List<String>>? missedRevs;

  /// Holds revs diffs for specified document
  ///
  /// Returns by [Databases.revsDiff]
  final Map<String, Map<String, List<String>>>? revsDiff;

  /// List of some objects (if JSON itself is list)
  ///
  /// Returned by [Databases.insertBulkDocs]
  final List<Map<String, dynamic>>? list;

  /// Mapping of shard ranges to individual shard replicas on each
  /// node in the cluster
  final Map<String, List<String>>? shards;

  /// The shard range in which the document is stored
  final String? shardRange;

  ///  List of nodes serving a replica of the shard
  final List<String>? nodes;
}
