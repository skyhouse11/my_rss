# Quick Start: Understanding the Architecture

## What You Have
- **Flutter** app for RSS feed management
- **Drift** database with tables for feeds, items, categories, tags, folders
- **DAOs** (Data Access Objects) that query the database
- **command_it** library for reactive state management

## What's Missing
- **Repositories** - Wrap DAOs in Commands
- **Providers** - Expose Repositories to UI
- **Screens/Widgets** - The actual UI

## The 3-Layer Pattern

```
┌─────────────────────────────────┐
│     PRESENTATION LAYER          │
│  (Screens, Widgets, Providers)  │
└──────────────┬──────────────────┘
               │ uses
┌──────────────▼──────────────────┐
│     BUSINESS LOGIC LAYER        │
│  (Repositories, UseCases)       │
└──────────────┬──────────────────┘
               │ uses
┌──────────────▼──────────────────┐
│       DATA LAYER                │
│  (DAOs, Database)               │
└─────────────────────────────────┘
```

## Your Task (Phase by Phase)

### ✅ Phase 1: DONE
You now have:
1. DI setup in `lib/core/di/service_locator.dart`
2. Example Repository in `lib/data/repositories/category_repository.dart`
3. Example Provider in `lib/presentation/providers/category_provider.dart`
4. Updated `main.dart` with DI initialization

### 🔄 Phase 2: Next Week (Repeat for all DAOs)
Create repositories + providers for:
- Tags
- Feeds
- Feed Items
- Folders

Just copy the CategoryRepository/CategoryProvider pattern

### 🎨 Phase 3: UI (After repositories done)
Create actual screens and wire them up

## File to Look At First
**`lib/data/repositories/category_repository.dart`**

This shows:
- How to wrap DAO methods in Commands
- Command types: `AsyncNoParam`, `AsyncSingleParam`, `AsyncNoResult`
- How to pass through non-command methods

## The Command Types You'll Use

```dart
// No input, returns list
Command<void, List<T>> getAllCommand = 
  Command.createAsyncNoParam(() async => dao.getAll());

// Single input (String), no return
Command<String, void> createCommand = 
  Command.createAsyncNoResult((name) => dao.create(name));

// Single input, returns single item
Command<String, T> getCommand = 
  Command.createAsyncSingleParam((id) => dao.get(id));

// Complex input (use record or class)
Command<({String a, String b}), void> complexCommand =
  Command.createAsyncNoResult((data) => dao.doSomething(data.a, data.b));
```

## In UI (When You Get There)

```dart
class CategoryWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final provider = categoryProvider;
    
    // Execute command
    final result = useFuture(
      useMemoized(() => provider.getAllCategoriesCommand.run())
    );
    
    // Get cached value
    final categories = provider.getAllCategoriesCommand.value ?? [];
    
    // Watch loading state
    final isLoading = watchIt(() => provider.getAllCategoriesCommand.isRunning);
    
    return isLoading
      ? CircularProgressIndicator()
      : ListView(children: categories.map(/* build widget */));
  }
}
```

## Learning Resources in This Project

1. **CategoryDao** - Already has Commands (study this)
2. **TagDao** - Doesn't have Commands yet (migrate this first)
3. **CategoryRepository** - Wrapping pattern (template for others)
4. **CategoryProvider** - Exposing to UI (template for others)

## Testing the Setup

```bash
# Check compilation
flutter pub get
flutter analyze

# Run the app
flutter run

# If it starts without errors, your DI setup works!
```

## Tips for Learning

1. **Copy-paste CategoryRepository** to understand the pattern
2. **Modify for TagRepository** by changing class names
3. **Don't memorize** - understand why each piece is there
4. **Commands abstract async** - so you don't have to think about Future callbacks
5. **Repositories are adapters** - they adapt DAOs to Command interface

## Questions to Ask Yourself

- [ ] Do I understand why we need Repositories?
- [ ] Do I know the difference between Command types?
- [ ] Can I write a Repository from a DAO?
- [ ] Can I write a Provider from a Repository?
- [ ] Can I explain why this is better than raw Futures?

If no to any, re-read DEVELOPMENT_GUIDE.md and ask clarifying questions.

---

**Next Action**: Read `lib/data/repositories/category_repository.dart` line by line and understand it. Then create `tag_repository.dart` by copying and adapting it.
