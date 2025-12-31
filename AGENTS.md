# AGENTS.md - my_rss Development Guide

## Build & Development Commands

```bash
# Install/update dependencies
flutter pub get

# Code generation (Drift, Freezed, AutoRoute, JSON serialization)
# One-time build
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-rebuild on changes) - recommended for active development
flutter pub run build_runner watch --delete-conflicting-outputs

# Analyze code for lint violations
flutter analyze

# Format Dart code
dart format lib/

# Run app (default device/emulator)
flutter run

# Clean build artifacts
flutter clean
```

**Tip**: Set up automatic `build_runner watch` in Android Studio via Settings → Startup Tasks to avoid manual invocation.

## Architecture & Structure

**Layer Pattern**: Data (Drift DAOs) → Domain (Freezed Models) → Presentation (Providers & UI)

**Key Directories**:
- `lib/data/database/tables/` - Drift table definitions
- `lib/data/database/daos/` - Data Access Objects with Commands (command_it)
- `lib/domain/models/` - Freezed models (Feed, FeedItem, Folder)
- `lib/presentation/` - UI layer (create as needed)
- `lib/core/di/` - GetIt service locator & utilities

**Database**: SQLite via Drift (v2.30.0), supports type-safe queries, streaming results, transactions, and migrations. Tables: Feed, FeedItem, Category, Tag, Folder, FeedCategories, FeedTags

**State Management**: 
- `command_it` (v9.5.0) for reactive async operations with auto-loading/error states
- `listen_it` (v5.3.4) for ValueListenable operators and reactive collections
- `watch_it` (v2.4.1) for reactive UI updates (optional)
- `get_it` (v9.2.0) for dependency injection & service locator

**UI Framework**: ForUI (v0.17.0) for Material Design components with Dart hooks support

## Code Style Guidelines

- **Imports**: Relative imports for same package (`import 'package:my_rss/...'`)
- **Freezed Models**: Use `@freezed` for immutable data with `copyWith()`, value equality, and JSON support
  - Always use `part 'file.freezed.dart'` and `part 'file.g.dart'`
  - Include `fromJson()` factory for JSON serialization (via json_serializable)
- **Commands (command_it)**: All async operations should be Command objects
  - `Command.createAsyncNoParam<T>()` - no input, returns T
  - `Command.createAsync<T, P>()` - single parameter P, returns T
  - `Command.createAsyncNoResult<P>()` - mutations (no return value)
  - **Note**: API changed in v9.0.0: `execute()` → `run()`, `isExecuting` → `isRunning`, `canExecute` → `canRun`
  - Commands are ValueListenable—watch with `CommandBuilder` or ValueListenableBuilder
- **DAOs**: Define queries with fluent API where possible; use custom SQL only when needed
- **Error Handling**: Commands handle exceptions automatically—don't catch in DAOs. Route errors globally or locally with filters
- **Formatting**: `very_good_analysis` linting rules (see analysis_options.yaml)
- **Naming**: camelCase for variables/methods, PascalCase for classes, UPPER_SNAKE_CASE for constants
- **Generated Files**: Never manually edit .g.dart, .freezed.dart—they are auto-generated. Add to .gitignore if committing generated files separately

## Flutter Setup Tips

- **Dart SDK**: ^3.10.0 required
- **Hot Reload**: Use during development to see changes instantly (doesn't reset state for const values)
- **Performance**: Avoid expensive operations in `build()` methods; use const constructors where possible
- **Code Generation**: Enable auto-save in IDE to detect file changes for build_runner watch mode
