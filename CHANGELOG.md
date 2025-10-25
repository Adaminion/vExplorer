# Changelog

All notable changes to vExplorer will be documented in this file.

## [1.0.0] - 2025-10-25

### Added
- Initial release of vExplorer
- Three-panel desktop UI layout:
  - Directory browser for navigating folders
  - Options panel for filtering and display customization
  - Video information panel for metadata display
- Video file scanning and filtering by extension
- Support for multiple video formats:
  - MP4, AVI, MOV, MKV, WMV, FLV, WebM, M4V, MPG, MPEG
- Comprehensive video metadata extraction:
  - Video and audio codec information
  - Resolution and frame dimensions
  - Frame rate (FPS)
  - Duration
  - Bitrate
  - File size
  - Creation and modification dates
- Customizable display options:
  - Toggle file extensions to filter
  - Select which metadata fields to display
- Desktop platform support:
  - macOS (10.15+)
  - Windows (10+)
  - Linux (GTK 3.0+)
- FFmpeg integration for robust metadata extraction
- Dark theme UI using Material Design 3
- Comprehensive documentation:
  - README with usage instructions
  - DEVELOPMENT guide for contributors
  - Widget tests for UI verification

### Technical Details
- Flutter 3.0+ compatibility
- Provider state management
- FFprobe for video analysis
- File picker for directory selection
- Responsive three-panel layout
