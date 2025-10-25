# vExplorer UI Design

This document describes the visual layout and design of vExplorer.

## Application Layout

### Overall Structure
The application uses a three-panel horizontal layout:

```
+----------------------------------------------------------+
|  vExplorer - Video File Explorer                         |
+----------------------------------------------------------+
|                                                          |
|  +------------------+  +------------------------------+  |
|  | Directory        |  | Video Information            |  |
|  | Browser          |  |                              |  |
|  |                  |  | +-------------------------+  |  |
|  | [Select Dir]     |  | | Video File Header       |  |  |
|  | Current: /path   |  | | Icon + Filename         |  |  |
|  |                  |  | | Full path               |  |  |
|  | ✓ video1.mp4     |  | +-------------------------+  |  |
|  |   video2.avi     |  |                              |  |
|  |   video3.mov     |  | +-------------------------+  |  |
|  |                  |  | | Video Metadata          |  |  |
|  |                  |  | | Filename: video1.mp4    |  |  |
|  +------------------+  | | Codec: H.264            |  |  |
|  | Options          |  | | Resolution: 1920x1080   |  |  |
|  |                  |  | | Frame Rate: 30.00 fps   |  |  |
|  | File Extensions  |  | | Duration: 5m 23s        |  |  |
|  | [.mp4] [.avi]    |  | | Bitrate: 2.5 Mbps       |  |  |
|  | [.mov] [.mkv]    |  | | File Size: 98.5 MB      |  |  |
|  |                  |  | | Date Created: ...       |  |  |
|  | Display Info     |  | | Date Modified: ...      |  |  |
|  | ☑ Filename       |  | +-------------------------+  |  |
|  | ☑ Codec          |  |                              |  |
|  | ☑ Resolution     |  |                              |  |
|  | ☑ Frame Rate     |  |                              |  |
|  +------------------+  +------------------------------+  |
|                                                          |
+----------------------------------------------------------+
```

### Left Panel (350px wide)

#### Top Section: Directory Browser (60% height)
- **Header**: "Directory Browser" with folder icon
- **Select Directory Button**: Full-width elevated button
- **Current Directory Display**: Shows selected path with refresh button
- **Video Files List**: 
  - Each item shows video camera icon
  - Filename prominently displayed
  - Relative path as subtitle
  - Selected item is highlighted
  - Scrollable list

#### Bottom Section: Options Panel (40% height)
- **Header**: "Options" with settings icon
- **File Extensions Section**:
  - Title: "File Extensions"
  - Filter chips for each extension (.mp4, .avi, .mov, etc.)
  - Selected chips are highlighted
  - Wrapped layout for multiple rows
  
- **Display Information Section**:
  - Title: "Display Information"
  - Checkbox list for each metadata field
  - Compact layout with small text
  - Fields include:
    - Filename
    - Codec
    - Resolution
    - Frame Rate (FPS)
    - Duration
    - Bitrate
    - File Size
    - Date Created
    - Date Modified

### Right Panel (Flexible width, expands to fill space)

#### Header
- **Title**: "Video Information" with video library icon
- **File Count**: Shows number of video files found (e.g., "42 video(s) found")

#### Content Area

**When No File Selected**:
- Centered message: "Select a video file to view its information"

**When Loading**:
- Centered spinner with text: "Extracting video metadata..."

**When File Selected**:
1. **Video File Header Card**:
   - Large video camera icon (48px)
   - Filename in large text
   - Full file path in small text
   
2. **Metadata Card**:
   - Section title: "Video Metadata"
   - Two-column table layout:
     - Left column: Bold labels (e.g., "Codec:")
     - Right column: Values (e.g., "H.264")
   - Only shows fields that are:
     - Available in the video file
     - Enabled in the display options
   - Scrollable if content is long

## Color Scheme

### Dark Theme (Default)
- **Background**: Dark grey (#121212)
- **Surface**: Elevated dark grey (#1E1E1E)
- **Primary**: Blue (#2196F3)
- **Text**: White/Light grey (#E0E0E0)
- **Dividers**: Dark grey (#424242)

### UI Elements
- **Cards**: Elevated with subtle shadow
- **Buttons**: Material Design elevated buttons
- **Chips**: Material Design filter chips
- **Checkboxes**: Material Design checkboxes
- **List Items**: Highlight on selection with primary color

## Typography

- **App Title**: Title Large, Bold
- **Section Headers**: Title Medium, Bold
- **File Names**: Body Medium
- **File Paths**: Body Small, Muted
- **Metadata Labels**: Body Medium, Bold
- **Metadata Values**: Body Medium
- **Options Text**: Body Small

## Interactions

### Directory Browser
- Click "Select Directory" → Opens native directory picker
- Click video file → Displays metadata in right panel
- Click refresh icon → Re-scans current directory

### Options Panel
- Click extension chip → Toggles filter on/off
- Click checkbox → Toggles field display on/off
- Changes apply immediately

### Video Information
- Automatically updates when file is selected
- Shows loading state during metadata extraction
- Displays error state if extraction fails

## Responsive Behavior

- Minimum window width: 800px
- Minimum window height: 600px
- Left panel: Fixed at 350px
- Right panel: Expands to fill remaining space
- Both panels have internal scrolling if content overflows

## Accessibility

- High contrast in dark theme
- Clear visual hierarchy
- Interactive elements have appropriate sizes
- Icons supplement text labels
- Loading states provide feedback
