import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../models/app_state.dart';
import '../models/video_metadata.dart';
import '../services/video_metadata_service.dart';

class VideoInfoDisplay extends StatefulWidget {
  const VideoInfoDisplay({super.key});

  @override
  State<VideoInfoDisplay> createState() => _VideoInfoDisplayState();
}

class _VideoInfoDisplayState extends State<VideoInfoDisplay> {
  VideoMetadata? _metadata;
  bool _isLoading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final selectedFile = appState.selectedFile;

        // Load metadata when file selection changes
        if (selectedFile != null && selectedFile is File) {
          if (_metadata?.filepath != selectedFile.path) {
            _loadMetadata(selectedFile.path);
          }
        } else {
          _metadata = null;
        }

        if (selectedFile == null) {
          return const Center(
            child: Text(
              'Select a video file to view its information',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        if (_isLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Extracting video metadata...'),
              ],
            ),
          );
        }

        if (_error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: $_error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _loadMetadata(selectedFile.path),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (_metadata == null) {
          return const Center(child: Text('No metadata available'));
        }

        return _buildMetadataDisplay(appState);
      },
    );
  }

  Widget _buildMetadataDisplay(AppState appState) {
    if (_metadata == null) return const SizedBox();

    final displayMap = _metadata!.toDisplayMap();
    final displayedFields = appState.displayedFields;

    // Filter based on selected display options
    final filteredEntries = displayMap.entries.where((entry) {
      final key = entry.key.toLowerCase().replaceAll(' ', '_');
      
      // Map display names to field keys
      if (entry.key == 'Filename' && displayedFields.contains('filename')) return true;
      if (entry.key == 'File Path' && displayedFields.contains('filename')) return true;
      if ((entry.key == 'Codec' || entry.key == 'Video Codec' || entry.key == 'Audio Codec') 
          && displayedFields.contains('codec')) return true;
      if ((entry.key == 'Resolution' || entry.key == 'Dimensions') 
          && displayedFields.contains('resolution')) return true;
      if (entry.key == 'Frame Rate' && displayedFields.contains('fps')) return true;
      if (entry.key == 'Duration' && displayedFields.contains('duration')) return true;
      if (entry.key == 'Bitrate' && displayedFields.contains('bitrate')) return true;
      if (entry.key == 'File Size' && displayedFields.contains('filesize')) return true;
      if (entry.key == 'Date Created' && displayedFields.contains('date_created')) return true;
      if (entry.key == 'Date Modified' && displayedFields.contains('date_modified')) return true;
      
      return false;
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Video file header
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.videocam, size: 48),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _metadata!.filename,
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _metadata!.filepath,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Metadata table
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Video Metadata',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                if (filteredEntries.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('No fields selected for display. Enable options in the left panel.'),
                  )
                else
                  Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    children: filteredEntries.map((entry) {
                      return TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            child: Text(
                              '${entry.key}:',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                            child: Text(
                              entry.value,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _loadMetadata(String filepath) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final metadata = await VideoMetadataService.extractMetadata(filepath);
      if (mounted) {
        setState(() {
          _metadata = metadata;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }
}
