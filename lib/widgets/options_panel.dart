import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class OptionsPanel extends StatelessWidget {
  const OptionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // File Extensions Section
              Text(
                'File Extensions',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  _buildExtensionChip(context, '.mp4', appState),
                  _buildExtensionChip(context, '.avi', appState),
                  _buildExtensionChip(context, '.mov', appState),
                  _buildExtensionChip(context, '.mkv', appState),
                  _buildExtensionChip(context, '.wmv', appState),
                  _buildExtensionChip(context, '.flv', appState),
                  _buildExtensionChip(context, '.webm', appState),
                  _buildExtensionChip(context, '.m4v', appState),
                  _buildExtensionChip(context, '.mpg', appState),
                  _buildExtensionChip(context, '.mpeg', appState),
                ],
              ),
              const Divider(height: 24),
              // Display Fields Section
              Text(
                'Display Information',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildDisplayOption(context, 'Filename', 'filename', appState),
              _buildDisplayOption(context, 'Codec', 'codec', appState),
              _buildDisplayOption(context, 'Resolution', 'resolution', appState),
              _buildDisplayOption(context, 'Frame Rate (FPS)', 'fps', appState),
              _buildDisplayOption(context, 'Duration', 'duration', appState),
              _buildDisplayOption(context, 'Bitrate', 'bitrate', appState),
              _buildDisplayOption(context, 'File Size', 'filesize', appState),
              _buildDisplayOption(context, 'Date Created', 'date_created', appState),
              _buildDisplayOption(context, 'Date Modified', 'date_modified', appState),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExtensionChip(BuildContext context, String extension, AppState appState) {
    final isSelected = appState.selectedExtensions.contains(extension);
    return FilterChip(
      label: Text(extension, style: const TextStyle(fontSize: 11)),
      selected: isSelected,
      onSelected: (_) => appState.toggleExtension(extension),
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _buildDisplayOption(
    BuildContext context,
    String label,
    String field,
    AppState appState,
  ) {
    final isEnabled = appState.displayedFields.contains(field);
    return CheckboxListTile(
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      value: isEnabled,
      onChanged: (_) => appState.toggleDisplayField(field),
      dense: true,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
