import 'package:flutter/foundation.dart';
import 'dart:io';

class AppState extends ChangeNotifier {
  String? _currentDirectory;
  List<FileSystemEntity> _videoFiles = [];
  FileSystemEntity? _selectedFile;
  
  // Filter options
  Set<String> _selectedExtensions = {'.mp4', '.avi', '.mov', '.mkv', '.wmv', '.flv', '.webm'};
  
  // Display options
  Set<String> _displayedFields = {
    'filename',
    'codec',
    'resolution',
    'fps',
    'duration',
    'bitrate',
    'filesize',
    'date_created',
    'date_modified',
  };

  String? get currentDirectory => _currentDirectory;
  List<FileSystemEntity> get videoFiles => _videoFiles;
  FileSystemEntity? get selectedFile => _selectedFile;
  Set<String> get selectedExtensions => _selectedExtensions;
  Set<String> get displayedFields => _displayedFields;

  void setCurrentDirectory(String? path) {
    _currentDirectory = path;
    if (path != null) {
      _scanDirectory(path);
    }
    notifyListeners();
  }

  void _scanDirectory(String path) {
    try {
      final dir = Directory(path);
      if (!dir.existsSync()) return;

      final allFiles = dir.listSync(recursive: true);
      _videoFiles = allFiles.where((entity) {
        if (entity is! File) return false;
        final extension = entity.path.toLowerCase().substring(
          entity.path.lastIndexOf('.')
        );
        return _selectedExtensions.contains(extension);
      }).toList();

      _videoFiles.sort((a, b) => a.path.compareTo(b.path));
    } catch (e) {
      print('Error scanning directory: $e');
      _videoFiles = [];
    }
    notifyListeners();
  }

  void selectFile(FileSystemEntity? file) {
    _selectedFile = file;
    notifyListeners();
  }

  void toggleExtension(String extension) {
    if (_selectedExtensions.contains(extension)) {
      _selectedExtensions.remove(extension);
    } else {
      _selectedExtensions.add(extension);
    }
    if (_currentDirectory != null) {
      _scanDirectory(_currentDirectory!);
    }
    notifyListeners();
  }

  void toggleDisplayField(String field) {
    if (_displayedFields.contains(field)) {
      _displayedFields.remove(field);
    } else {
      _displayedFields.add(field);
    }
    notifyListeners();
  }

  void refreshDirectory() {
    if (_currentDirectory != null) {
      _scanDirectory(_currentDirectory!);
    }
  }
}
