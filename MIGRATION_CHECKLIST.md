# Migration Checklist: Functions → Commands

## Phase 1: Setup ✅
- [x] Created `lib/core/di/service_locator.dart`
- [x] Created `lib/data/repositories/category_repository.dart` (example)
- [x] Created `lib/presentation/providers/category_provider.dart` (example)
- [ ] Update `main.dart` to call `setupServiceLocator()` before `runApp()`

## Phase 2: Complete Repository Layer
- [ ] Create `lib/data/repositories/tag_repository.dart`
- [ ] Create `lib/data/repositories/feed_repository.dart`
- [ ] Create `lib/data/repositories/feed_item_repository.dart`
- [ ] Create `lib/data/repositories/folder_repository.dart`

## Phase 3: Complete Provider Layer
- [ ] Create `lib/presentation/providers/tag_provider.dart`
- [ ] Create `lib/presentation/providers/feed_provider.dart`
- [ ] Create `lib/presentation/providers/feed_item_provider.dart`
- [ ] Create `lib/presentation/providers/folder_provider.dart`

## Phase 4: Refactor DAOs (Optional - makes them reusable)
Each DAO should expose Commands where appropriate:

### TagDao
- [ ] Add `getAllTagsCommand`
- [ ] Add `createTagCommand`
- [ ] Add `addTagToFeedCommand`
- [ ] Add `removeTagFromFeedCommand`
- [ ] Mirror CategoryDao pattern

### FolderDao
- [ ] Add folder-specific Commands
- [ ] Check current implementation first

### FeedItemDao
- [ ] Add `upsertCommand`
- [ ] Add `markReadCommand`
- [ ] Add `markFavoriteCommand`

## Phase 5: UI Implementation
- [ ] Create presentation screens structure
- [ ] Create basic widgets
- [ ] Wire up providers to UI
- [ ] Add AutoRoute navigation

## Key Patterns to Use

### Repository Pattern (Data Layer)
```dart
class XyzRepository {
  final XyzDao _dao;
  
  late final Command<InputType, OutputType> myCommand = 
      Command.createAsync...((input) => _dao.method(input));
}
```

### Provider Pattern (Presentation Layer)
```dart
class XyzProvider {
  late final XyzRepository _repository;
  
  Command<InputType, OutputType> get myCommand => 
      _repository.myCommand;
}
```

### UI Usage
```dart
// In widget
final provider = categoryProvider;
await provider.createCategoryCommand.run('News');
```

## Tips While Migrating

1. **Start with simple DAOs** - TagDao is simpler than FeedItemDao
2. **Keep Repository private** - Only expose Commands + methods
3. **One Command per use case** - Don't overload
4. **Default values** - Commands need `initialValue:` for list types
5. **Error handling** - Commands handle exceptions automatically
6. **Testing** - Mock the underlying DAO method, not the Command

## Common Errors & Fixes

| Error | Cause | Fix |
|-------|-------|-----|
| `late initialization error` | Command not awaited before use | Use `Command.run()` |
| `null reference` | Forgot `initialValue:` | Add `initialValue: []` or `initialValue: null` |
| `type mismatch` | Wrong Command type | Check `<InputType, OutputType>` |
| `class not registered` | GetIt not initialized | Call `setupServiceLocator()` in main |

## Files Modified/Created So Far
```
✅ lib/core/di/service_locator.dart (new)
✅ lib/data/repositories/category_repository.dart (new)
✅ lib/presentation/providers/category_provider.dart (new)
⏳ lib/main.dart (needs update)
```

## Next Immediate Action
Update `main.dart`:
```dart
import 'package:my_rss/core/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();  // Add this line
  runApp(const Application());
}
```
