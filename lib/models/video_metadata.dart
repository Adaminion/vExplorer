class VideoMetadata {
  final String filename;
  final String filepath;
  final String? codec;
  final String? resolution;
  final double? fps;
  final String? duration;
  final String? bitrate;
  final String filesize;
  final DateTime? dateCreated;
  final DateTime? dateModified;
  final int? width;
  final int? height;
  final String? audioCodec;
  final String? videoCodec;

  VideoMetadata({
    required this.filename,
    required this.filepath,
    this.codec,
    this.resolution,
    this.fps,
    this.duration,
    this.bitrate,
    required this.filesize,
    this.dateCreated,
    this.dateModified,
    this.width,
    this.height,
    this.audioCodec,
    this.videoCodec,
  });

  Map<String, String> toDisplayMap() {
    return {
      'Filename': filename,
      'File Path': filepath,
      'File Size': filesize,
      if (codec != null) 'Codec': codec!,
      if (videoCodec != null) 'Video Codec': videoCodec!,
      if (audioCodec != null) 'Audio Codec': audioCodec!,
      if (resolution != null) 'Resolution': resolution!,
      if (width != null && height != null) 'Dimensions': '${width}x$height',
      if (fps != null) 'Frame Rate': '${fps!.toStringAsFixed(2)} fps',
      if (duration != null) 'Duration': duration!,
      if (bitrate != null) 'Bitrate': bitrate!,
      if (dateCreated != null) 'Date Created': dateCreated!.toString(),
      if (dateModified != null) 'Date Modified': dateModified!.toString(),
    };
  }
}
