# Flutter Floating Bottom Bar

A Flutter package providing a **floating bottom navigation bar widget** that reacts to scroll events. The widget can be used as a tab bar, bottom navigation bar, or any custom floating UI element. Supports Android, iOS, Web, Linux, macOS, and Windows platforms.

This repository contains:
1. **The package source** (`packages/flutter_floating_bottom_bar/`) - the actual BottomBar widget
2. **Example application** (root directory) - demonstrates package usage with TabBar integration  

**ALWAYS** reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the information here.

## ⚠️ Validation Status
**Note**: These instructions are based on repository analysis and Flutter best practices. Some commands may need adjustment based on actual network connectivity and environment setup. Always verify commands work in your environment before relying on them.

## Working Effectively

### Bootstrap and Setup
1. **Install Flutter SDK** (required for all development):
   - **Recommended**: Use snap on Ubuntu: `sudo snap install flutter --classic` -- takes 2-3 minutes. NEVER CANCEL. Set timeout to 5+ minutes.
   - **Alternative**: Download from https://flutter.dev/docs/get-started/install
   - **Alternative**: Use FVM with: `fvm use stable` (project uses stable channel as per `.fvmrc`)  
   - **Git clone method**: `git clone https://github.com/flutter/flutter.git -b stable --depth 1` then add to PATH
   - Add Flutter to PATH: `export PATH="$PATH:[PATH_TO_FLUTTER]/bin"`
   - Verify installation: `flutter doctor -v` -- takes 30-60 seconds

2. **Install System Dependencies**:
   - **Linux Desktop**: `sudo apt-get update && sudo apt-get install -y build-essential cmake pkg-config libgtk-3-dev curl unzip wget xz-utils git ninja-build clang` -- takes 3-5 minutes. NEVER CANCEL.
   - **Windows Desktop**: Visual Studio 2019 or later with "Desktop development with C++" workload
   - **macOS Desktop**: Xcode and CocoaPods (`sudo gem install cocoapods`)
   - **Android Development**: Android Studio with SDK (API level 28+) and emulator
   - **iOS Development**: Xcode (macOS only) with iOS SDK

3. **Project Dependencies**:
   - Root project: `flutter pub get` -- takes 30-90 seconds. NEVER CANCEL. Set timeout to 3+ minutes.
   - Package: `cd packages/flutter_floating_bottom_bar && flutter pub get` -- takes 30-90 seconds. NEVER CANCEL. Set timeout to 3+ minutes.

### Build Commands
- **Flutter Clean**: `flutter clean` -- takes 10-15 seconds. Run this first if encountering build issues.
- **Get Dependencies**: `flutter pub get` -- takes 30-60 seconds. NEVER CANCEL.
- **Build Android**: `flutter build apk` -- takes 3-5 minutes. NEVER CANCEL. Set timeout to 10+ minutes.
- **Build iOS**: `flutter build ios` -- takes 5-8 minutes. NEVER CANCEL. Set timeout to 15+ minutes.
- **Build Web**: `flutter build web` -- takes 2-4 minutes. NEVER CANCEL. Set timeout to 8+ minutes.
- **Build Linux**: `flutter build linux` -- takes 3-6 minutes. NEVER CANCEL. Set timeout to 10+ minutes.
- **Build macOS**: `flutter build macos` -- takes 4-7 minutes. NEVER CANCEL. Set timeout to 12+ minutes.
- **Build Windows**: `flutter build windows` -- takes 4-8 minutes. NEVER CANCEL. Set timeout to 15+ minutes.

### Run and Test Commands
- **Run Example App**: `flutter run` -- starts development server. Use `-d chrome` for web, `-d linux` for Linux desktop.
- **Hot Reload**: Press `r` in running app for hot reload, `R` for hot restart.
- **Run Tests**: `flutter test` -- takes 30-90 seconds. NEVER CANCEL. Set timeout to 3+ minutes.
- **Package Tests**: `cd packages/flutter_floating_bottom_bar && flutter test` -- takes 30-90 seconds. NEVER CANCEL.

### Code Quality and Validation
- **Analyze Code**: `flutter analyze` -- takes 30-60 seconds. ALWAYS run before committing.
- **Format Code**: `dart format .` -- takes 10-20 seconds. ALWAYS run before committing.
- **Check Package**: `cd packages/flutter_floating_bottom_bar && flutter packages pub publish --dry-run`

## Validation Scenarios

**CRITICAL**: After making any changes, ALWAYS run through these validation steps:

1. **Build Validation**: 
   - `flutter clean && flutter pub get && flutter analyze`
   - Build for at least one platform: `flutter build web` (fastest option)

2. **Functionality Testing**: 
   - Run the example app: `flutter run -d chrome` or `flutter run -d linux`
   - Test the floating bottom bar behavior:
     - Verify the bottom bar appears and floats correctly
     - Scroll the content to verify the bar hides/shows on scroll
     - Tap different tabs to verify tab switching works
     - Test the scroll-to-top icon functionality
     - Verify the floating action button (FAB) appears correctly

3. **Package Testing**:
   - Run package tests: `cd packages/flutter_floating_bottom_bar && flutter test`
   - Verify no breaking changes to public API

## Timing Expectations and Timeouts

**CRITICAL**: NEVER CANCEL builds or tests. Use these timeout values:

- `flutter pub get`: 2 minutes timeout
- `flutter build web`: 10 minutes timeout  
- `flutter build android`: 15 minutes timeout
- `flutter build ios`: 20 minutes timeout
- `flutter build linux/windows/macos`: 20 minutes timeout
- `flutter test`: 5 minutes timeout
- `flutter analyze`: 3 minutes timeout

## Project Architecture

### Package Structure
This project follows the Flutter package development pattern:
- **Root directory**: Contains example Flutter app demonstrating package usage
- **`packages/flutter_floating_bottom_bar/`**: Contains the actual package source code
- **Dual-purpose**: Can be run as an example app OR used as a package library

### Key Widget: BottomBar
The main widget is `BottomBar` which provides:
- Floating UI that reacts to scroll events  
- Customizable appearance (colors, borders, animations)
- Tab integration support
- Scroll-to-top functionality
- Cross-platform compatibility

### Example Integration Pattern
See `lib/main.dart` for the complete integration example:
```dart
BottomBar(
  child: TabBar(...), // Your floating content
  body: (context, controller) => TabBarView(...), // Main content  
  // Configuration options...
)
```

## Repository Files You Should Know

### Critical Files Always Check First:
- **`lib/main.dart`**: Example app demonstrating BottomBar usage with TabBar/TabBarView
- **`packages/flutter_floating_bottom_bar/lib/src/bottom_bar.dart`**: Main BottomBar widget implementation  
- **`packages/flutter_floating_bottom_bar/pubspec.yaml`**: Package metadata and dependencies
- **`pubspec.yaml`**: Root app dependencies (includes local path to package)

### Configuration Files:
- **`.fvmrc`**: Specifies Flutter stable channel for consistency
- **`analysis_options.yaml`**: Dart analysis rules using flutter_lints package
- **`pubspec.lock`**: Locked dependency versions (DO NOT manually edit)

### Platform Build Files:
- **`android/`**: Android-specific build configuration (Gradle)
- **`ios/`**: iOS-specific build configuration (Xcode)  
- **`web/`**: Web-specific configuration (index.html, manifest.json)
- **`linux/`**: Linux desktop build (CMake, GTK+3)
- **`macos/`**: macOS desktop build (Xcode)
- **`windows/`**: Windows desktop build (CMake, Visual Studio)

### Key Directories
- **`lib/`**: Example Flutter app demonstrating the floating bottom bar
  - `main.dart`: Main application with TabBar integration
  - `pages/infinite_list_page.dart`: Scrollable page implementation
- **`packages/flutter_floating_bottom_bar/`**: The actual package source
  - `lib/src/bottom_bar.dart`: Main BottomBar widget implementation  
  - `lib/src/bottom_bar_scroll_controller_provider.dart`: Scroll controller management
  - `test/`: Package-specific tests
- **Platform Directories**: `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/`
- **Build Files**: CMake files for desktop builds, Gradle for Android

### Important Files
- **`pubspec.yaml`**: Root project dependencies and Flutter app configuration
- **`packages/flutter_floating_bottom_bar/pubspec.yaml`**: Package dependencies and metadata
- **`.fvmrc`**: Specifies Flutter version (stable channel)
- **`analysis_options.yaml`**: Dart linter configuration using flutter_lints

## Common Development Workflows

### Quick Start Development Sequence
```bash
# Setup (run once)
flutter doctor -v
flutter pub get
cd packages/flutter_floating_bottom_bar && flutter pub get && cd ../..

# Development cycle (repeat)
flutter analyze                    # Check code quality
flutter run -d chrome             # Run example app in browser  
# Make changes, test with hot reload (r)
flutter test                       # Run tests
dart format .                      # Format code before commit
```

### Full Build Validation Sequence  
```bash
# Clean and rebuild everything (use when things break)
flutter clean
flutter pub get
cd packages/flutter_floating_bottom_bar && flutter pub get && cd ../..
flutter analyze
flutter test
flutter build web                  # Fastest build for validation
```

### Package Development Workflow
When modifying the package (`packages/flutter_floating_bottom_bar/`):
1. Edit package source in `packages/flutter_floating_bottom_bar/lib/src/`
2. Update exports in `packages/flutter_floating_bottom_bar/lib/flutter_floating_bottom_bar.dart`
3. Update example in `lib/main.dart` to demonstrate changes
4. Add/update tests in `packages/flutter_floating_bottom_bar/test/`
5. Run: `cd packages/flutter_floating_bottom_bar && flutter test && cd ../..`
6. Run: `flutter run` to test example app integration

### Adding New Features to Package
1. **Core Widget Changes**: Edit `packages/flutter_floating_bottom_bar/lib/src/bottom_bar.dart`
   - The main `BottomBar` StatefulWidget with 30+ customization properties
   - Uses `BackToTopIconBuilder` typedef for custom scroll-to-top icons
   - Manages scroll behavior with `BottomBarScrollControllerProvider`

2. **API Surface Updates**: Update `packages/flutter_floating_bottom_bar/lib/flutter_floating_bottom_bar.dart`
   - Controls what classes/functions are exported from package
   - Currently exports: `BottomBar` and `BottomBarScrollControllerProvider`

3. **Example Integration**: Update `lib/main.dart` 
   - Shows TabBar integration with `BottomBar`
   - Uses `InfiniteListPage` for scrollable content demonstration
   - Demonstrates color theming and animation configuration

4. **Testing**: Add tests in `packages/flutter_floating_bottom_bar/test/`
   - Currently contains placeholder test structure
   - Tests should validate widget behavior, scroll interactions, animation

### Code Patterns in This Project

**BottomBar Widget Pattern**:
```dart
BottomBar(
  child: Widget,                    // Your floating content (TabBar, etc)
  body: (context, controller) =>    // Content with provided ScrollController
    Widget,                         
  // 20+ customization properties for appearance/behavior
)
```

**ScrollController Integration**:
- The `body` function provides a `ScrollController` 
- Must be used on scrollable widgets for hide/show behavior
- Example: `ListView.builder(controller: controller, ...)`

**Testing Changes**
1. **Package tests**: `cd packages/flutter_floating_bottom_bar && flutter test` -- takes 30-90 seconds
2. **Root tests**: `flutter test` -- takes 30-90 seconds  
3. **Manual validation**: `flutter run -d chrome` and test:
   - Scroll content to verify bar hides/shows
   - Tap tabs to verify tab switching
   - Test scroll-to-top icon functionality
   - Check animations and transitions

### Common Issues and Solutions
- **Build failures**: Run `flutter clean && flutter pub get` first -- takes 1-2 minutes total
- **Hot reload not working**: Use hot restart (`R`) or restart the app completely  
- **Tests not finding widgets**: Ensure test files are in correct directories and properly named
- **Package import errors**: Verify path in root `pubspec.yaml` points to correct package directory: `flutter_floating_bottom_bar: path: packages/flutter_floating_bottom_bar`
- **Desktop build failures**: Ensure platform dependencies installed (CMake, GTK+3 for Linux; Visual Studio for Windows; Xcode for macOS)
- **Flutter SDK download issues**: Try alternative installation methods if network connectivity to storage.googleapis.com fails
- **Permission errors on Linux**: Use `sudo` for system-wide package installation commands
- **Dart SDK corruption**: Remove `~/.pub-cache` and `flutter/bin/cache` directories, then re-run `flutter pub get`

## Network and Installation Troubleshooting

If you encounter network issues downloading Flutter or Dart dependencies:

1. **Flutter SDK Installation Issues**:
   - Try snap installation: `sudo snap install flutter --classic`  
   - Or git clone: `git clone https://github.com/flutter/flutter.git -b stable --depth 1`
   - Verify network access to storage.googleapis.com and github.com

2. **Pub Package Download Issues**:
   - Clear pub cache: `dart pub cache clean` or `rm -rf ~/.pub-cache`
   - Use alternative pub servers if available
   - Check firewall/proxy settings

3. **Build Tool Download Issues**:
   - Manually install system dependencies via package manager
   - Verify access to required download mirrors

## Quick Reference Commands and Expected Outputs

### Repository Statistics
- **Total Dart files**: 7 files (~720 lines of Dart code)
- **Platforms supported**: 6 (Android, iOS, Web, Linux, macOS, Windows)  
- **Main components**: Example app + Flutter package

### Directory Structure Reference
```
flutter-floating-bottom-bar/
├── .fvmrc                     # Flutter version (stable)
├── .github/                   # Copilot instructions
├── .vscode/                   # VS Code settings
├── lib/                       # Example Flutter app
│   ├── main.dart             # Main app with BottomBar + TabBar integration  
│   └── pages/                # InfiniteListPage for scrollable content
├── packages/
│   └── flutter_floating_bottom_bar/  # The actual package
│       ├── lib/src/          # Package source (BottomBar widget)
│       ├── test/             # Package tests
│       └── pubspec.yaml      # Package metadata
├── android/                   # Android build configuration  
├── ios/                      # iOS build configuration
├── web/                      # Web build configuration
├── linux/                    # Linux desktop (CMake)
├── macos/                    # macOS desktop (Xcode) 
├── windows/                  # Windows desktop (CMake)
├── test/                     # Root app tests
├── screenshots/              # Demo GIFs (1.gif, 2.gif, 3.gif)
├── pubspec.yaml              # Root app dependencies
└── analysis_options.yaml     # Dart linting rules
```

### Common Command Outputs

**Flutter Doctor** (successful):
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, on Linux, locale en_US.UTF-8)
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web  
[✓] Linux toolchain - develop for Linux desktop
[✓] VS Code (version x.x.x)
[✓] Connected device (3 available)
[✓] Network resources
```

**Flutter Analyze** (successful):
```
Analyzing flutter-floating-bottom-bar...
No issues found!
```

**Flutter Test** (successful):
```
Running "flutter packages test" in packages/flutter_floating_bottom_bar...
No tests ran.
```
*Note: Tests are currently commented out in test files*

- **FVM Support**: Project configured for stable Flutter channel via `.fvmrc`
- **IDE Integration**: Compatible with VS Code, Android Studio, IntelliJ IDEA  
- **Hot Reload**: Supported for rapid development iteration
- **Multi-platform**: Test desktop platforms on respective operating systems
- **Package Development**: Uses local path dependency for development


## Development Environment Notes

- **FVM Support**: Project configured for stable Flutter channel via `.fvmrc`
- **IDE Integration**: Compatible with VS Code, Android Studio, IntelliJ IDEA  
- **Hot Reload**: Supported for rapid development iteration (press 'r' in terminal)
- **Multi-platform**: Test desktop platforms on respective operating systems  
- **Package Development**: Uses local path dependency for development workflow
- **Code Quality**: Uses flutter_lints package for consistent Dart/Flutter code style

## Package Publishing Information (Reference Only)

This package is published as `flutter_floating_bottom_bar` on pub.dev:
- **Current version**: Check `packages/flutter_floating_bottom_bar/pubspec.yaml`
- **Publish command**: `cd packages/flutter_floating_bottom_bar && dart pub publish`
- **Dry run first**: `cd packages/flutter_floating_bottom_bar && dart pub publish --dry-run`
- **Requirements**: Package must pass analysis, tests, and have proper documentation

---

**Important**: This is a Flutter package development project. Always validate changes work in both:
1. The example app (run with `flutter run`)  
2. As an importable package (test integration in other projects)

When in doubt, run the full validation sequence and test the example app functionality manually.