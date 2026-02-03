# Flutter Vision Scanner - AI Coding Agent Instructions

## Project Overview
**flutter_vision_scanner** is a Flutter mobile application for document/image scanning. It uses **GetX** for state management and routing, follows a **feature-first architecture**, and uses **Material 3** dark theme with custom color scheme.

## Architecture & Structure

### Feature-First Organization
```
lib/app/
├── core/              # Shared utilities across features
│   ├── theme/        # AppTheme, color scheme, Material 3 styling
│   └── services/     # Currently empty; place shared services here
├── features/         # Independent feature modules
│   ├── home/         # Main scan list & history (GetxController pattern)
│   └── capture/      # Image source selection (partially implemented)
├── routes/           # Navigation & routing
│   ├── app_routes.dart    # Route constants (abstract Routes class)
│   └── app_pages.dart     # GetPage definitions with Bindings
└── app.dart          # Root GetMaterialApp widget
```

### Key Architectural Patterns

**GetX Dependency Injection & Bindings:**
- Use `Binding` classes to declare dependencies lazy-loaded by GetX
- Example: [HomeBinding](lib/app/features/home/binding/home_binding.dart) uses `Get.lazyPut<HomeController>()`
- Add new routes with `GetPage` in [app_pages.dart](lib/app/routes/app_pages.dart)

**State Management:**
- Controllers extend `GetxController` with reactive properties (`.obs`)
- Example: [HomeController](lib/app/features/home/controller/home_controller.dart) manages `isLoading` and `recentScans` observables
- Use `Obx(() => ...)` in UI to react to state changes

**Material 3 Dark Theme:**
- Custom `ColorScheme` in [app_theme.dart](lib/app/core/theme/app_theme.dart) defines all colors centrally
- Always reference `Theme.of(context).colorScheme` instead of hardcoding colors
- Uses custom dark palette (primary: `#FF4D6D`, secondary: `#7C5CFF`)

## Critical Developer Workflows

### Build & Run
```bash
flutter pub get              # Install dependencies
flutter run                  # Run on default device
flutter run -d <device_id>  # Run on specific device
```

### Code Quality
```bash
flutter analyze              # Lint per analysis_options.yaml
dart fix --apply           # Auto-fix linting issues
```

### Dependencies
- **GetX 4.7.3** – Routing, state management, dependency injection
- **cupertino_icons** – Icon pack
- **flutter_lints** – Enforced linter rules (see analysis_options.yaml)

**Note:** Riverpod analyzer plugin is configured but riverpod package not installed (likely removed or planned for future use).

## Project-Specific Conventions

### Naming Conventions
- **Files:** snake_case (e.g., `home_controller.dart`, `choose_source_sheet.dart`)
- **Classes:** PascalCase; private classes use `_Prefix` (e.g., `_ActionTile`)
- **Variables/Methods:** camelCase
- **Constants:** ALL_CAPS for Material color values

### UI/Widget Patterns
- Reusable dialogs/sheets as stateless classes (see [ChooseSourceDialog](lib/app/features/capture/presentation/choose_source_sheet.dart))
- Extract private widgets with `_` prefix within same file if used only locally
- Use `Theme.of(context).colorScheme` + `Theme.of(context).textTheme` for all styling
- Prefer `GetView<T>` for pages that need controller access

### Linting Rules (Non-Negotiable)
From [analysis_options.yaml](analysis_options.yaml):
- **always_use_package_imports** – No relative imports; use package: imports
- **require_trailing_commas** – All multi-line constructs must have trailing commas
- **avoid_print** – Never use `print()` (use logging framework instead)
- **prefer_final_locals** – Declare local variables as `final` unless reassigned
- **public_member_api_docs** – Currently disabled (public_member_api_docs: false)

## Integration Points & Data Flow

### Routing Flow
1. `App` initializes with `GetMaterialApp(initialRoute: Routes.home)`
2. [app_pages.dart](lib/app/routes/app_pages.dart) maps routes to pages + Bindings
3. Controllers lazy-load via Bindings when page is instantiated
4. Navigation: `Get.toNamed(Routes.routeName)` or `Get.back()`

### Capture Feature (Partial Implementation)
- `HomePage` FAB triggers modal bottom sheet with [ChooseSourceDialog](lib/app/features/capture/presentation/choose_source_sheet.dart)
- Dialog has two options: **Camera** and **Gallery**
- TODO comments indicate missing implementation for actual image capture

### State Persistence
- Currently: No persistence layer
- TODO: `HomeController.loadRecentScans()` needs database/storage integration
- Future: Add ScanRecord model + repository pattern for data access

## Common Tasks

### Adding a New Feature
1. Create `lib/app/features/<feature_name>/{binding,controller,presentation}/`
2. Create controller extending `GetxController` with observables
3. Create Binding class in binding/ directory
4. Add route to [app_routes.dart](lib/app/routes/app_routes.dart) and page to [app_pages.dart](lib/app/routes/app_pages.dart)
5. Add page widget in presentation/ extending `GetView<ControllerName>`

### Adding a Reusable Component
- Place in `lib/app/core/` with subdirectory matching component type (widgets/, services/, etc.)
- If UI widget, follow ChooseSourceDialog pattern with `@immutable` annotations

### Color/Theme Changes
- Modify [app_theme.dart](lib/app/core/theme/app_theme.dart) ColorScheme
- Redeploy; changes automatically propagate via `Theme.of(context)`

## Known Limitations & TODOs
- Image capture/gallery picking not yet implemented
- No persistence layer (storage/database)
- Services directory empty – add platform-specific services as needed
- `riverpod_lint` plugin configured but riverpod not used (legacy config)
