# vExplorer Development Guide

## Project Structure

```
vexplorer/
├── lib/
│   ├── main.dart                    # Application entry point
│   ├── models/
│   │   ├── app_state.dart          # Application state management
│   │   └── video_metadata.dart     # Video metadata data model
│   ├── screens/
│   │   └── home_screen.dart        # Main screen with three-panel layout
│   ├── services/
│   │   └── video_metadata_service.dart  # FFmpeg integration
│   └── widgets/
│       ├── directory_browser.dart   # Directory navigation widget
│       ├── options_panel.dart       # Filter and display options
│       └── video_info_display.dart  # Metadata display widget
├── macos/                           # macOS platform files
├── windows/                         # Windows platform files
├── linux/                           # Linux platform files
└── test/                           # Test files
```

## Architecture

### State Management
The app uses `Provider` for state management. The `AppState` class maintains:
- Current directory path
- List of video files found
- Selected video file
- File extension filters
- Display field preferences

### Video Metadata Extraction
Video metadata is extracted using FFmpeg through the `ffmpeg_kit_flutter` package:
- Codec information (video and audio)
- Resolution and frame dimensions
- Frame rate calculation
- Duration, bitrate, file size
- File timestamps

### Three-Panel Layout
1. **Left Panel (Top)**: Directory Browser
   - Directory selection button
   - Current directory display
   - List of video files found
   
2. **Left Panel (Bottom)**: Options
   - File extension filter chips
   - Display field checkboxes

3. **Right Panel**: Video Information
   - Video file header
   - Metadata table with selected fields

## Key Features

### Directory Scanning
- Recursive directory traversal
- Extension-based filtering
- Real-time file list updates

### Metadata Extraction
- FFprobe integration for detailed analysis
- Stream detection (video and audio)
- Frame rate calculation from rational numbers
- Human-readable format conversion

### Customizable Display
- Toggle file extensions to filter
- Select which metadata fields to display
- Persistent selection state

## Development Workflow

### Adding New Video Formats
1. Add the extension to the options panel (widgets/options_panel.dart)
2. Add the extension to the default set in AppState (models/app_state.dart)

### Adding New Metadata Fields
1. Add the field to VideoMetadata model (models/video_metadata.dart)
2. Extract the field in VideoMetadataService (services/video_metadata_service.dart)
3. Add display option in OptionsPanel (widgets/options_panel.dart)
4. Add field mapping in VideoInfoDisplay (widgets/video_info_display.dart)

### Platform-Specific Changes
- **macOS**: Edit files in `macos/Runner/`
- **Windows**: Edit CMakeLists.txt in `windows/`
- **Linux**: Edit CMakeLists.txt in `linux/`

## Testing

Run tests with:
```bash
flutter test
```

### Test Coverage
- Widget tests for UI components
- App launch verification
- Options panel functionality

## Building

### Development Build
```bash
flutter run -d macos     # macOS
flutter run -d windows   # Windows
flutter run -d linux     # Linux
```

### Release Build
```bash
flutter build macos --release
flutter build windows --release
flutter build linux --release
```

## Dependencies

### Core Dependencies
- `provider`: State management
- `file_picker`: Directory selection
- `ffmpeg_kit_flutter`: Video metadata extraction
- `path`: Path manipulation

### Platform Dependencies
- FFmpeg must be installed on the system
- macOS 10.15 or higher
- Windows 10 or higher
- Linux with GTK 3.0

## Troubleshooting

### FFmpeg Not Found
Ensure FFmpeg is installed and in the system PATH:
- macOS: `brew install ffmpeg`
- Windows: Download from ffmpeg.org and add to PATH
- Linux: `sudo apt-get install ffmpeg`

### Permission Issues (macOS)
The app may need file system permissions. Grant access in:
System Preferences > Security & Privacy > Files and Folders

### Build Issues
1. Clean the build: `flutter clean`
2. Get dependencies: `flutter pub get`
3. Rebuild: `flutter build <platform>`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes with tests
4. Submit a pull request

## License

MIT License - See LICENSE file for details
