class OfflineVideo {
  final String id;
  final String title;
  final String url; // URL of the m3u8 playlist
  final String downloadPath; // Path to the downloaded video file
  final DownloadStatus downloadStatus; // Downloaded, Downloading, NotDownloaded

  OfflineVideo({
    required this.id,
    required this.title,
    required this.url,
    required this.downloadPath,
    required this.downloadStatus,
  });
}

enum DownloadStatus { Downloaded, Downloading, NotDownloaded }
