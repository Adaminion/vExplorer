# Troubleshooting Guide for vExplorer

## Common Issues and Solutions

### Installation Issues

#### Flutter SDK Not Found
**Problem**: `flutter: command not found`

**Solution**:
1. Install Flutter SDK from https://flutter.dev/docs/get-started/install
2. Add Flutter to your PATH:
   ```bash
   export PATH="$PATH:`pwd`/flutter/bin"
   ```
3. Verify installation: `flutter doctor`

#### FFmpeg Not Installed
**Problem**: Video metadata extraction fails or returns empty values

**Solution**:
- **macOS**: 
  ```bash
  brew install ffmpeg
  ```
- **Windows**: 
  1. Download from https://ffmpeg.org/download.html
  2. Extract to a folder (e.g., C:\ffmpeg)
  3. Add to PATH in System Environment Variables
- **Linux**:
  ```bash
  sudo apt-get update
  sudo apt-get install ffmpeg
  ```

Verify installation:
```bash
ffmpeg -version
```

### Build Issues

#### Dependencies Not Resolved
**Problem**: `Error: Package not found` or similar errors

**Solution**:
```bash
flutter clean
flutter pub get
flutter pub upgrade
```

#### macOS Build Fails
**Problem**: Xcode or CocoaPods errors

**Solution**:
```bash
cd macos
pod install
cd ..
flutter build macos
```

#### Windows Build Fails
**Problem**: CMake or Visual Studio errors

**Solution**:
1. Ensure Visual Studio 2019 or later is installed
2. Install "Desktop development with C++" workload
3. Rebuild:
   ```bash
   flutter clean
   flutter build windows
   ```

#### Linux Build Fails
**Problem**: GTK or CMake errors

**Solution**:
```bash
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev
flutter clean
flutter build linux
```

### Runtime Issues

#### No Video Files Found
**Problem**: Directory scanner doesn't find any video files

**Possible Causes**:
1. Selected directory doesn't contain video files
2. Video file extensions are not in the filter list
3. Insufficient permissions to read the directory

**Solution**:
1. Verify the directory contains video files
2. Check that the file extension is enabled in Options panel
3. Grant file system access permissions (macOS: System Preferences > Security & Privacy)

#### Metadata Extraction Fails
**Problem**: Video information shows only filename and file size

**Possible Causes**:
1. FFmpeg not installed or not in PATH
2. Video file is corrupted
3. Unsupported video format

**Solution**:
1. Verify FFmpeg is installed: `ffmpeg -version`
2. Try opening the video in a media player to verify it's valid
3. Check if the codec is supported by FFmpeg

#### Slow Performance
**Problem**: App is slow when scanning large directories

**Solution**:
1. Avoid scanning directories with thousands of files
2. Use more specific directory selections
3. Disable unneeded file extensions in the Options panel

#### Permission Denied Errors (macOS)
**Problem**: "Operation not permitted" when accessing directories

**Solution**:
1. Open System Preferences > Security & Privacy > Privacy
2. Select "Files and Folders" or "Full Disk Access"
3. Add vExplorer to the allowed applications
4. Restart the application

### UI Issues

#### Window Too Small
**Problem**: UI elements are cramped or cut off

**Solution**:
- Resize the window to at least 1024x768
- The left panel is fixed at 350px wide
- The right panel expands to fill remaining space

#### Text Overflow
**Problem**: Long filenames or paths are cut off

**Solution**:
- Hover over items to see tooltips (if implemented)
- Widen the window for more space
- Check the full path in the metadata display

#### Dark Theme Issues
**Problem**: Prefer light theme

**Solution**:
Currently, the app uses a dark theme by default. To change this, modify the `ThemeData` in `lib/main.dart`:
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,  // Change to light
  ),
  useMaterial3: true,
),
```

## Getting Help

If you encounter an issue not covered here:

1. Check the [GitHub Issues](https://github.com/Adaminion/vExplorer/issues)
2. Search for similar problems
3. Create a new issue with:
   - Your operating system and version
   - Flutter version (`flutter --version`)
   - FFmpeg version (`ffmpeg -version`)
   - Steps to reproduce the issue
   - Error messages or screenshots

## Debugging Tips

### Enable Verbose Logging
Run the app with verbose output:
```bash
flutter run -v -d macos
```

### Check Console Output
Watch for error messages in the terminal/console where you launched the app.

### Verify FFmpeg Integration
Test FFmpeg independently:
```bash
ffmpeg -i /path/to/video.mp4
```

This should display detailed information about the video file.

### Flutter Doctor
Check your development environment:
```bash
flutter doctor -v
```

This will identify missing dependencies or configuration issues.
