/// Enum definition for directory paths on the iOS platform.
enum DirectoryType {
  downloads,
  music,
  podcasts,
  ringtones,
  alarms,
  notifications,
  pictures,
  movies,
  dim,
  documents,
  screenshots,
  audiobooks;

  /// Returns the string representation of the permission type (e.g., "downloads").
  String get value => name;
}

/// Enum definition for directory paths on the macOS platform.
enum MacDirectoryType {
  downloads,
  pictures,
  movies;

  /// Returns the string representation of the permission type (e.g., "downloads").
  String get value => name;
}
