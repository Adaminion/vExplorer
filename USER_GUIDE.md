# User Guide for vExplorer

## Welcome to vExplorer!

vExplorer is a desktop application designed specifically for video file enthusiasts who need detailed information about their video files. Whether you're organizing a video library, verifying file specifications, or just curious about video properties, vExplorer makes it easy.

## Getting Started

### First Launch

1. **Start the application**
   - macOS: Double-click `vexplorer.app`
   - Windows: Double-click `vexplorer.exe`
   - Linux: Run `./vexplorer` from terminal

2. **Grant permissions** (if prompted)
   - The app needs access to read files from your file system
   - On macOS, you may need to grant permissions in System Preferences

### Understanding the Interface

The vExplorer window is divided into three main sections:

#### Left Panel - Top: Directory Browser
This is where you navigate and select video files.

- **Select Directory Button**: Click to choose a folder containing videos
- **Current Directory Path**: Shows which folder you're currently browsing
- **Refresh Button**: Updates the file list if files have been added/removed
- **Video Files List**: Shows all video files found in the selected directory

#### Left Panel - Bottom: Options
Customize how vExplorer works.

- **File Extensions**: Choose which video formats to include in the scan
  - Click on extension chips to enable/disable them
  - Blue/highlighted chips are active
  
- **Display Information**: Choose which metadata to show
  - Check boxes next to fields you want to see
  - Uncheck to hide fields you don't need

#### Right Panel: Video Information
Displays detailed information about the selected video.

- **Video File Header**: Shows the filename and full path
- **Metadata Table**: Shows all enabled information fields

## Basic Workflow

### 1. Select a Directory

Click the **"Select Directory"** button in the directory browser. Navigate to a folder containing video files and select it.

**Example**: `/Users/yourname/Movies/Vacation Videos`

### 2. Browse Video Files

The directory browser will now show all video files found in that directory (including subdirectories). Files are listed with:
- A video camera icon
- The filename
- The relative path from the selected directory

**Tip**: The scan is recursive, so it finds videos in all subdirectories too!

### 3. Select a Video File

Click on any video file in the list. The file will be highlighted, and the right panel will start loading its metadata.

### 4. View Metadata

The metadata panel shows comprehensive information:

- **Filename**: The name of the video file
- **File Path**: Complete path to the file
- **File Size**: Size in human-readable format (MB, GB)
- **Codec**: Video codec (e.g., H.264, H.265, VP9)
- **Video Codec**: Specific video encoding format
- **Audio Codec**: Audio encoding format (e.g., AAC, MP3)
- **Resolution**: Video resolution (e.g., 1920x1080)
- **Dimensions**: Width x Height in pixels
- **Frame Rate**: Frames per second (e.g., 30.00 fps)
- **Duration**: Length of the video
- **Bitrate**: Data rate (e.g., 2.5 Mbps)
- **Date Created**: When the file was created
- **Date Modified**: When the file was last modified

## Customizing Your View

### Filtering by File Type

Only interested in MP4 files? Here's how:

1. Go to the **Options** panel (left, bottom)
2. Under **File Extensions**, click to disable all chips except `.mp4`
3. Click the refresh button in the directory browser
4. Now only MP4 files will be shown

**Supported Formats**:
- .mp4 (MPEG-4)
- .avi (Audio Video Interleave)
- .mov (QuickTime Movie)
- .mkv (Matroska Video)
- .wmv (Windows Media Video)
- .flv (Flash Video)
- .webm (WebM)
- .m4v (iTunes Video)
- .mpg / .mpeg (MPEG Video)

### Choosing What Information to Display

Want to see only codec and resolution? Here's how:

1. Go to the **Options** panel
2. Under **Display Information**, uncheck all boxes
3. Check only **Codec** and **Resolution**
4. The metadata panel will now show only these fields

**Available Fields**:
- Filename
- Codec
- Resolution
- Frame Rate (FPS)
- Duration
- Bitrate
- File Size
- Date Created
- Date Modified

## Common Tasks

### Task 1: Find All 4K Videos

1. Select your videos directory
2. Look at the **Resolution** field for each file
3. 4K videos typically show: 3840x2160

**Tip**: You can quickly scan through files by clicking each one and checking the resolution.

### Task 2: Check Video Codecs

1. Enable **Video Codec** in Display Information
2. Select a video file
3. Look for the codec name (e.g., "h264", "hevc", "vp9")

**Common Codecs**:
- H.264 (AVC): Most common, good compatibility
- H.265 (HEVC): Better compression, newer devices
- VP9: Used by YouTube and WebM
- AV1: Newest, best compression

### Task 3: Verify Frame Rates

1. Enable **Frame Rate** in Display Information
2. Select video files
3. Check the FPS value

**Common Frame Rates**:
- 24 fps: Cinema standard
- 30 fps: Standard video
- 60 fps: Smooth motion
- 120 fps or higher: Slow motion source

### Task 4: Sort by File Size

Currently, files are sorted alphabetically by path. To see file sizes:

1. Enable **File Size** in Display Information
2. Click through files to compare sizes
3. The size is shown in human-readable format (KB, MB, GB)

### Task 5: Check Multiple Directories

To browse a different directory:

1. Click **"Select Directory"** again
2. Choose a new folder
3. The file list updates automatically

**Tip**: The app remembers your filter and display settings between directory changes.

## Tips and Tricks

### Faster Scanning

- If you have a large directory, consider:
  - Selecting a more specific subdirectory
  - Disabling uncommon file extensions
  - Closing other applications to free up resources

### Accurate Metadata

- The metadata is extracted directly from video files using FFmpeg
- If metadata is missing, the video file might be corrupted or use an unusual format
- Some fields may be empty if the video container doesn't include that information

### Keyboard Navigation

- Use Tab to move between UI elements
- Use arrow keys to navigate the file list (when focused)
- Press Enter to select a file (when focused on file list)

### Refreshing the List

If you've added or removed video files while vExplorer is open:

1. Click the refresh icon (↻) next to the directory path
2. The file list will update automatically

### Handling Errors

If you see "Error extracting metadata":

1. Verify FFmpeg is installed (`ffmpeg -version` in terminal)
2. Try opening the video in a media player to verify it works
3. Check the troubleshooting guide (TROUBLESHOOTING.md)

## Privacy and Security

### What vExplorer Does:
- ✅ Reads video files from directories you select
- ✅ Extracts technical metadata using FFmpeg
- ✅ Stores your filter and display preferences locally

### What vExplorer Does NOT Do:
- ❌ Upload any files or data to the internet
- ❌ Modify or delete your video files
- ❌ Track your usage or collect analytics
- ❌ Access files outside selected directories

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| Cmd/Ctrl + Q | Quit application |
| Cmd/Ctrl + W | Close window |
| Cmd/Ctrl + R | Refresh file list |
| Tab | Navigate between UI elements |
| Arrow Keys | Navigate file list |
| Enter | Select focused file |

## Performance

### File Scanning Speed
- Small directories (< 100 files): Instant
- Medium directories (100-1000 files): 1-5 seconds
- Large directories (1000+ files): 5-30 seconds

### Metadata Extraction Speed
- Small videos (< 100 MB): < 1 second
- Medium videos (100-500 MB): 1-3 seconds
- Large videos (> 500 MB): 3-10 seconds

**Note**: First extraction may be slower as FFmpeg initializes.

## Frequently Asked Questions

### Q: Can vExplorer play videos?
**A**: No, vExplorer is designed to view metadata only. Use a media player like VLC to play videos.

### Q: Can I edit video metadata?
**A**: No, vExplorer is read-only. It doesn't modify video files.

### Q: Does it work with other media files?
**A**: vExplorer is optimized for video files. It may work with some audio files, but that's not the primary focus.

### Q: Can I export the metadata to a file?
**A**: This feature is not currently available but may be added in future versions.

### Q: Why is some metadata missing?
**A**: Not all video files contain all metadata. Some formats or encoding tools don't include certain fields.

### Q: Can I use vExplorer commercially?
**A**: Yes! vExplorer is MIT licensed and free to use for any purpose.

## Getting Help

If you need assistance:

1. Check the **TROUBLESHOOTING.md** guide
2. Review the **DEVELOPMENT.md** for technical details
3. Open an issue on GitHub: https://github.com/Adaminion/vExplorer/issues

## Credits

vExplorer uses the following open-source technologies:

- **Flutter**: UI framework by Google
- **FFmpeg**: Video processing and metadata extraction
- **Provider**: State management for Flutter
- **File Picker**: Cross-platform file selection

Thank you for using vExplorer! We hope it helps you manage and understand your video files better.
