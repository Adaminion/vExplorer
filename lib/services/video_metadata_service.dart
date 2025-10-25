import 'dart:io';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import '../models/video_metadata.dart';
import 'package:path/path.dart' as path;

class VideoMetadataService {
  static Future<VideoMetadata> extractMetadata(String filepath) async {
    final file = File(filepath);
    final filename = path.basename(filepath);
    final stats = await file.stat();
    final filesize = _formatFileSize(stats.size);

    try {
      // Use FFprobe to extract video metadata
      final session = await FFprobeKit.getMediaInformation(filepath);
      final information = session.getMediaInformation();

      if (information == null) {
        return VideoMetadata(
          filename: filename,
          filepath: filepath,
          filesize: filesize,
          dateCreated: stats.changed,
          dateModified: stats.modified,
        );
      }

      // Extract streams
      final streams = information.getStreams();
      Map<String, dynamic>? videoStream;
      Map<String, dynamic>? audioStream;

      for (var stream in streams) {
        final streamMap = stream.getAllProperties() as Map<String, dynamic>?;
        if (streamMap == null) continue;

        final codecType = streamMap['codec_type'] as String?;
        if (codecType == 'video' && videoStream == null) {
          videoStream = streamMap;
        } else if (codecType == 'audio' && audioStream == null) {
          audioStream = streamMap;
        }
      }

      // Extract metadata
      final duration = information.getDuration();
      final bitrate = information.getBitrate();
      
      String? videoCodec;
      String? audioCodec;
      int? width;
      int? height;
      double? fps;

      if (videoStream != null) {
        videoCodec = videoStream['codec_name'] as String?;
        width = videoStream['width'] as int?;
        height = videoStream['height'] as int?;
        
        // Calculate FPS
        final fpsString = videoStream['r_frame_rate'] as String?;
        if (fpsString != null && fpsString.contains('/')) {
          final parts = fpsString.split('/');
          if (parts.length == 2) {
            final num = double.tryParse(parts[0]);
            final den = double.tryParse(parts[1]);
            if (num != null && den != null && den != 0) {
              fps = num / den;
            }
          }
        }
      }

      if (audioStream != null) {
        audioCodec = audioStream['codec_name'] as String?;
      }

      final resolution = width != null && height != null ? '${width}x$height' : null;
      final durationStr = duration != null ? _formatDuration(duration) : null;
      final bitrateStr = bitrate != null ? _formatBitrate(bitrate) : null;

      return VideoMetadata(
        filename: filename,
        filepath: filepath,
        codec: videoCodec,
        resolution: resolution,
        fps: fps,
        duration: durationStr,
        bitrate: bitrateStr,
        filesize: filesize,
        dateCreated: stats.changed,
        dateModified: stats.modified,
        width: width,
        height: height,
        audioCodec: audioCodec,
        videoCodec: videoCodec,
      );
    } catch (e) {
      print('Error extracting metadata for $filepath: $e');
      return VideoMetadata(
        filename: filename,
        filepath: filepath,
        filesize: filesize,
        dateCreated: stats.changed,
        dateModified: stats.modified,
      );
    }
  }

  static String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  static String _formatDuration(String duration) {
    final seconds = double.tryParse(duration);
    if (seconds == null) return duration;

    final hours = (seconds / 3600).floor();
    final minutes = ((seconds % 3600) / 60).floor();
    final secs = (seconds % 60).floor();

    if (hours > 0) {
      return '${hours}h ${minutes}m ${secs}s';
    } else if (minutes > 0) {
      return '${minutes}m ${secs}s';
    } else {
      return '${secs}s';
    }
  }

  static String _formatBitrate(String bitrate) {
    final bps = int.tryParse(bitrate);
    if (bps == null) return bitrate;

    if (bps < 1000) return '$bps bps';
    if (bps < 1000000) return '${(bps / 1000).toStringAsFixed(2)} kbps';
    return '${(bps / 1000000).toStringAsFixed(2)} Mbps';
  }
}
