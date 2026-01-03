import 'package:command_it/command_it.dart';
import 'package:my_rss/data/database/daos/folder_dao.dart';
import 'package:my_rss/data/database/extensions/feed_table_data_x.dart';
import 'package:my_rss/data/database/extensions/folder_table_data_x.dart';
import 'package:my_rss/domain/models/feed.dart';
import 'package:my_rss/domain/models/folder.dart';

class FolderRepository {
  FolderRepository({required this.folderDao});
  final FolderDao folderDao;

  final ListNotifier<Folder> folders = ListNotifier<Folder>(data: []);

  late final loadFoldersCommand = Command.createAsyncNoParamNoResult(() async {
    folders.clear();

    final data = await folderDao.getAllFolders();
    for (final data in data) {
      folders.add(data.toFolder());
    }
  });

  late final addFolderCommand = Command.createAsyncNoResult(
    (Folder folder) async {
      await folderDao.createFolder(
        folder.title,
        parentId: folder.parentId,
      );
      loadFoldersCommand.run();
    },
  );

  late final deleteFolderCommand = Command.createAsyncNoResult(
    (Folder folder) async {
      await folderDao.deleteFolder(folder.id);
      loadFoldersCommand.run();
    },
  );

  late final getFeedsForFolderCommand = Command.createAsync(
    (String folderId) async {
      final feeds = await folderDao.getFeedsForFolder(folderId);
      return feeds.map((e) => e.toFeed()).toList();
    },
    initialValue: <Feed>[],
  );
}
