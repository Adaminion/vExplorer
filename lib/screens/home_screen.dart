import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/directory_browser.dart';
import '../widgets/options_panel.dart';
import '../widgets/video_info_display.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('vExplorer - Video File Explorer'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Row(
        children: [
          // Left panel - narrow, split into two parts
          SizedBox(
            width: 350,
            child: Column(
              children: [
                // Top: Directory browser
                Expanded(
                  flex: 6,
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Icon(Icons.folder, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Directory Browser',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        const Expanded(child: DirectoryBrowser()),
                      ],
                    ),
                  ),
                ),
                // Bottom: Options
                Expanded(
                  flex: 4,
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Icon(Icons.settings, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Options',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        const Expanded(child: OptionsPanel()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Right panel - wider, video info display
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const Icon(Icons.video_library, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Video Information',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Consumer<AppState>(
                          builder: (context, appState, _) {
                            return Text(
                              '${appState.videoFiles.length} video(s) found',
                              style: Theme.of(context).textTheme.bodySmall,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  const Expanded(child: VideoInfoDisplay()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
