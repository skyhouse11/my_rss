# Development Guide - my_rss

## Current Architecture

```
lib/
├── core/              # Shared utilities
│   └── helper/
├── data/              # Data layer (DB, APIs)
│   └── database/
│       ├── tables/    # Drift table definitions
│       └── daos/      # Data Access Objects
├── domain/            # Business logic (models)
│   └── models/
└── presentation/      # UI layer (🔴 MISSING - create this)
```

## Stack Explanation

### command_it
A state management library that wraps async operations in `Command` objects. Each command:
- Has input/output types
- Tracks loading state
- Caches results
- Handles errors

**Pattern in CategoryDao:**
```dart
late final Command<void, List<CategoryTableData>> getAllCategoriesCommand =
    Command.createAsyncNoParam(
      () async => select(categoryTable).get(),
      initialValue: [],
    );
```

### Drift
ORM for SQLite. Core concepts:
- **Tables**: Define schema (like `CategoryTable`)
- **DAOs**: Encapsulate queries (like `CategoryDao`)
- **Database**: Central class connecting everything

## Recommended Folder Structure

Create these missing folders:

```
lib/
├── core/
│   ├── di/                    # Dependency Injection setup
│   │   └── service_locator.dart
│   ├── extensions/            # Dart extensions
│   └── helper/
├── data/
│   ├── database/              # (existing)
│   ├── repositories/          # 🆕 Business logic adapters
│   │   ├── feed_repository.dart
│   │   ├── category_repository.dart
│   │   └── tag_repository.dart
│   └── services/              # 🆕 External services (RSS fetching, etc)
│       └── rss_service.dart
├── domain/
│   ├── models/                # (existing)
│   └── usecases/              # 🆕 High-level operations
│       ├── fetch_feed_usecase.dart
│       └── manage_categories_usecase.dart
└── presentation/              # 🆕 UI layer
    ├── screens/
    │   ├── home/
    │   ├── feeds/
    │   └── categories/
    ├── widgets/
    ├── providers/             # 🆕 State management (Commands, GetIt)
    │   ├── category_provider.dart
    │   ├── feed_provider.dart
    │   └── feed_item_provider.dart
    └── theme/
```

## Migration Strategy: Functions → Commands

### Current Pattern (Tag DAO - no commands)
```dart
Future<List<TagTableData>> getAllTags() => select(tagTable).get();
```

### Target Pattern (Category DAO - with commands)
```dart
late final Command<void, List<CategoryTableData>> getAllCategoriesCommand =
    Command.createAsyncNoParam(
      () async => select(categoryTable).get(),
      initialValue: [],
    );
```

## Step-by-Step Implementation Plan

### Phase 1: Setup (This week)
1. **Create DI/Service Locator**
   - `lib/core/di/service_locator.dart`
   - Register: `AppDatabase`, all DAOs
   ```dart
   final getIt = GetIt.instance;
   
   void setupServiceLocator() {
     getIt.registerSingleton<AppDatabase>(AppDatabase());
     getIt.registerSingleton<CategoryDao>(getIt<AppDatabase>().categoryDao);
   }
   ```

2. **Create Repository Layer**
   - `lib/data/repositories/category_repository.dart`
   - Wraps DAOs with Commands
   ```dart
   class CategoryRepository {
     late final getAllCommand = Command.createAsyncNoParam(
       () => _dao.getAllCategoriesCommand.run(),
     );
   }
   ```

3. **Create Presentation Providers**
   - `lib/presentation/providers/category_provider.dart`
   - Exposes Commands to UI

### Phase 2: UI Setup (Next)
1. Create `presentation/screens/` structure
2. Create basic app routing with AutoRoute
3. Update `main.dart` with DI initialization

### Phase 3: Feature Implementation
1. **Categories Feature**
   - List categories
   - Add/remove categories
   - Assign to feeds

2. **Feeds Feature**
   - Add/remove feeds
   - List by category
   - Auto-fetch

3. **Feed Items Feature**
   - Mark read/favorite
   - List per feed

## Command Pattern Best Practices

### 1. AsyncNoParam (no input)
```dart
late final Command<void, List<T>> getAllCommand =
    Command.createAsyncNoParam(
      () async => /* logic */,
      initialValue: [],
    );
```

### 2. AsyncSingleParam (single input)
```dart
late final Command<String, CategoryTableData> createCommand =
    Command.createAsyncSingleParam(
      (name) async => /* logic */,
    );
```

### 3. AsyncNoResult (mutation, no output)
```dart
late final Command<String, void> deleteCommand =
    Command.createAsyncNoResult(
      (id) async => /* logic */,
    );
```

### Usage in UI
```dart
// Execute and get result
await categoryProvider.createCommand.run('News');

// Subscribe to loading state
categoryProvider.getAllCommand.isRunning.listen(
  (isLoading) => setState(() {}),
);

// Get cached result
final items = categoryProvider.getAllCommand.value;
```

## Key Files to Create/Modify

### Must Create
- [ ] `lib/core/di/service_locator.dart` - DI setup
- [ ] `lib/data/repositories/base_repository.dart` - Base class (optional)
- [ ] `lib/data/repositories/category_repository.dart`
- [ ] `lib/presentation/providers/category_provider.dart`
- [ ] `lib/presentation/screens/home/home_screen.dart`

### Should Refactor
- [ ] `TagDao` - Add commands (mirrors CategoryDao)
- [ ] `FolderDao` - Add commands
- [ ] `FeedItemDao` - Add commands
- [ ] `main.dart` - Setup DI and routing

## Common Mistakes to Avoid

1. **Don't mix async patterns** - Use Command everywhere, not raw Futures
2. **Don't access DAOs directly from UI** - Use Repositories + Providers
3. **Don't forget GetIt registration** - Register all services early
4. **Don't mutate state** - Let Commands handle async operations
5. **Don't forget `late final`** - Commands are initialized lazily

## Testing Strategy

Commands are testable: mock the underlying Future
```dart
final mockCommand = Command.createAsyncNoParam(
  () async => [...],
);
```

## Next Immediate Actions

1. Create `lib/core/di/service_locator.dart`
2. Refactor `main.dart` to initialize DI
3. Create `lib/data/repositories/category_repository.dart`
4. Mirror this pattern for Tag and FolderDao
5. Create basic UI provider structure

---

**Learning Focus**: Commands abstract async complexity. They give you:
- Automatic loading states
- Error handling
- Result caching
- Reactive updates (via watch_it)
