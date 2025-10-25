import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../models/app_state.dart';

class DirectoryBrowser extends StatelessWidget {
  const DirectoryBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return Column(
          children: [
            // Directory selection button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
                  if (selectedDirectory != null) {
                    appState.setCurrentDirectory(selectedDirectory);
                  }
                },
                icon: const Icon(Icons.folder_open),
                label: const Text('Select Directory'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
            ),
            // Current directory display
            if (appState.currentDirectory != null)
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.folder, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        appState.currentDirectory!,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh, size: 18),
                      onPressed: () => appState.refreshDirectory(),
                      tooltip: 'Refresh',
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            // Video files list
            Expanded(
              child: appState.videoFiles.isEmpty
                  ? Center(
                      child: Text(
                        appState.currentDirectory == null
                            ? 'Select a directory to browse video files'
                            : 'No video files found in this directory',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: appState.videoFiles.length,
                      itemBuilder: (context, index) {
                        final file = appState.videoFiles[index];
                        final filename = file.path.split(Platform.pathSeparator).last;
                        final isSelected = appState.selectedFile?.path == file.path;

                        return ListTile(
                          dense: true,
                          selected: isSelected,
                          leading: const Icon(Icons.videocam, size: 20),
                          title: Text(
                            filename,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            file.path.replaceFirst(appState.currentDirectory!, ''),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () => appState.selectFile(file),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
