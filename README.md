# Flutter Vision Scanner

Flutter mobile app for scanning and managing documents/images with a processing
pipeline, text recognition, and scan history.

## Project parameters

- Flutter: 3.38.9 (stable)
- Dart: 3.10.8
- Android min SDK: defined via flutter.minSdkVersion
	(configured in android/app/build.gradle.kts)
- iOS min SDK: 15.5 (Podfile)

## Run (debug)

1) Install dependencies: flutter pub get
2) Start in debug on simulator or physical device: flutter run
	 - Optional: flutter run -d <device_id>

## Run in release on physical device (if debug has issues)

A VS Code configuration is available to launch in release on a specific device.

1) Get the device id: flutter devices
2) Open .vscode/launch.json and set deviceId to the desired ID
3) In VS Code: Run and Debug → Flutter (Release - Device)

## Core technologies

- Flutter + Material 3 (custom dark theme)
- GetX for routing, DI, and state management
- Google ML Kit (text recognition, face detection)
- OpenCV (opencv_dart) for the image processing pipeline
- image_picker for camera/gallery acquisition
- sqflite + path_provider for local persistence
- pdf + open_file for export and file opening

## Architectural principles

- Feature-first: each feature is isolated in binding/controller/presentation
- GetX Bindings for controller lazy-loading
- Reactive state with Rx and UI updates via Obx
- Centralized theme with colorScheme/textTheme usage

## Key features

- Acquire images from camera or gallery
- Image processing with a dedicated pipeline
- Text recognition and face detection
- Save results to local history
- Scan detail with preview and metadata
- PDF export for text scans

## Screens and screen recordings

### Home

#### Screen recording

- Scan list (history)
- Item actions (view details / delete)
- Source selection dialog (camera / gallery)

### Processing

#### Screen recording

- Processing state and progress
- Text recognition output
- Error handling

### Scan Result

#### Screen recording

- Text result with preview and PDF export
- Face result with original/filtered images
- Save result

### Scan Detail

#### Screen recording

- Image preview
- Metadata (type, date, size)
- Open PDF (text only)
