# vExplorer

A Flutter desktop application for browsing and analyzing video files with detailed metadata extraction.

## Features

- **Video File Browser**: Browse directories and filter video files by extension
- **Detailed Metadata**: Extract and display comprehensive video information including:
  - Codec information (video and audio)
  - Resolution and dimensions
  - Frame rate (FPS)
  - Duration
  - Bitrate
  - File size
  - Creation and modification dates
- **Customizable Display**: Select which information to display
- **Multi-platform**: Works on macOS, Windows, and Linux
- **Three-Panel UI**:
  - Left top panel: Directory browser for navigating folders
  - Left bottom panel: Options for file extensions and display fields
  - Right panel: Video information display

## Requirements

- Flutter SDK (3.0.0 or higher)
- FFmpeg (for video metadata extraction)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/Adaminion/vExplorer.git
cd vExplorer
```

2. Install dependencies:
```bash
flutter pub get
```

3. Install FFmpeg:
   - **macOS**: `brew install ffmpeg`
   - **Windows**: Download from [ffmpeg.org](https://ffmpeg.org/download.html)
   - **Linux**: `sudo apt-get install ffmpeg`

## Running the Application

### macOS
```bash
flutter run -d macos
```

### Windows
```bash
flutter run -d windows
```

### Linux
```bash
flutter run -d linux
```

## Building for Release

### macOS
```bash
flutter build macos
```

The built application will be in `build/macos/Build/Products/Release/vexplorer.app`

### Windows
```bash
flutter build windows
```

### Linux
```bash
flutter build linux
```

## Usage

1. Click "Select Directory" to choose a folder containing video files
2. Video files will be listed in the directory browser based on selected extensions
3. Click on any video file to view its metadata
4. Use the Options panel to:
   - Enable/disable file extensions to filter
   - Select which metadata fields to display

## Supported Video Formats

- MP4 (.mp4)
- AVI (.avi)
- MOV (.mov)
- MKV (.mkv)
- WMV (.wmv)
- FLV (.flv)
- WebM (.webm)
- M4V (.m4v)
- MPG/MPEG (.mpg, .mpeg)

## License

MIT License
