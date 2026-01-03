import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';
import 'package:my_rss/data/database/tables/folder_table.dart';

part 'folder_dao.g.dart';

@DriftAccessor(tables: [FolderTable, FeedTable])
class FolderDao extends DatabaseAccessor<AppDatabase> with _$FolderDaoMixin {
  FolderDao(AppDatabase db) : super(db);

  Future<List<FolderTableData>> getAllFolders() => select(folderTable).get();

  Future<void> createFolder(String title, {String? parentId}) async {
    await into(folderTable).insert(
      FolderTableCompanion.insert(title: title, parentId: Value(parentId)),
    );
  }

  Future<List<FeedTableData>> getFeedsForFolder(String folderId) async {
    return (select(feedTable)..where((f) => f.folderId.equals(folderId))).get();
  }

  Future<void> moveFeedToFolder(String feedId, String? folderId) async {
    await (update(feedTable)..where((f) => f.id.equals(feedId))).write(
      FeedTableCompanion(folderId: Value(folderId)),
    );
  }

  Future<List<FolderTableData>> getChildren(String parentId) async {
    return (select(
      folderTable,
    )..where((f) => f.parentId.equals(parentId))).get();
  }

  Future<void> deleteFolder(String folderId) async {
    await (delete(folderTable)..where((f) => f.id.equals(folderId))).go();
  }
}
