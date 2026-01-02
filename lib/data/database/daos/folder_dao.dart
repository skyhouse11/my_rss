import 'package:command_it/command_it.dart';
import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';
import 'package:my_rss/data/database/tables/folder_table.dart';

part 'folder_dao.g.dart';

typedef CreateFolderData = ({String title, String? parentId});
typedef MoveFeedToFolderData = ({String feedId, String? folderId});

@DriftAccessor(tables: [FolderTable, FeedTable])
class FolderDao extends DatabaseAccessor<AppDatabase> with _$FolderDaoMixin {
  FolderDao(AppDatabase db) : super(db);

  late final getAllFoldersCommand = Command.createAsyncNoParam(
    () async => select(folderTable).get(),
    initialValue: <FolderTableData>[],
  );

  late final createFolderCommand = Command.createAsyncNoResult<CreateFolderData>(
    (data) async => into(folderTable).insert(
      FolderTableCompanion.insert(title: data.title, parentId: Value(data.parentId)),
    ),
  );

  late final getFeedsForFolderCommand = Command.createAsync(
    (String folderId) async => (select(feedTable)..where((f) => f.folderId.equals(folderId))).get(),
    initialValue: <FeedTableData>[],
  );

  late final moveFeedToFolderCommand = Command.createAsyncNoResult<MoveFeedToFolderData>(
    (data) async => (update(feedTable)..where((f) => f.id.equals(data.feedId))).write(
      FeedTableCompanion(folderId: Value(data.folderId)),
    ),
  );

  late final getChildrenCommand = Command.createAsync(
    (String parentId) async => (select(folderTable)..where((f) => f.parentId.equals(parentId))).get(),
    initialValue: <FolderTableData>[],
  );
}
