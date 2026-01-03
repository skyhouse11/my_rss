import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/domain/models/folder.dart';

extension FolderTableDataX on FolderTableData {
  Folder toFolder() {
    return Folder(
      title: title,
      id: id,
      parentId: parentId,
    );
  }
}
