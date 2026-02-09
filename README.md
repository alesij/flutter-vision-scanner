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

### Home

https://github.com/user-attachments/assets/2d7da648-ea38-4d6e-8e16-4ac1a51c5333

- Scan list (history)
- Item actions (view details / delete)
- Source selection dialog (camera / gallery)

### Processing - Saving result


https://github.com/user-attachments/assets/f339e72d-8887-4a23-8cd1-37b550ba594b


https://github.com/user-attachments/assets/90a04da6-6d32-4d93-98c9-36c1114c0561


- Processing state and progress
- Text recognition output
- Save scanned images
- Error handling

### Scan Result
<img width="300" height="600" alt="Simulator Screenshot - iPhone 15 Pro - 2026-02-09 at 23 25 35" src="https://github.com/user-attachments/assets/cd6d3f2c-49a5-45f8-b0b0-0ce3034cd84b" />
<img width="300" height="600" alt="Simulator Screenshot - iPhone 15 Pro - 2026-02-09 at 23 26 14" src="https://github.com/user-attachments/assets/66028da8-4cce-4bb5-af84-697ba2a9747b" />

- Text result with preview and PDF export
- Face result with original/filtered images
- Save result

### Scan Detail
<img width="300" height="600" alt="Simulator Screenshot - iPhone 15 Pro - 2026-02-09 at 23 24 05" src="https://github.com/user-attachments/assets/5ecfa1c0-83b2-4b7f-a016-f913e9939eb8" />
<img width="300" height="600" alt="Simulator Screenshot - iPhone 15 Pro - 2026-02-09 at 23 24 19" src="https://github.com/user-attachments/assets/7c4455a1-abc4-43fc-aed1-96f719b703fd" />

- Image preview
- Metadata (type, date, size)
- Open PDF (text only)
