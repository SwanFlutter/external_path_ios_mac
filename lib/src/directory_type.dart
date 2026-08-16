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
  dcim,
  documents,
  screenshots,
  audiobooks;

  /// Returns the DIRECTORY_ prefixed string expected by native platform code.
  /// For example, [DirectoryType.downloads] returns `"DIRECTORY_DOWNLOADS"`.
  String get value => 'DIRECTORY_${name.toUpperCase()}';
}

/// Enum definition for directory paths on the macOS platform.
enum MacDirectoryType {
  downloads,
  pictures,
  movies;

  /// Returns the DIRECTORY_ prefixed string expected by native platform code.
  /// For example, [MacDirectoryType.downloads] returns `"DIRECTORY_DOWNLOADS"`.
  String get value => 'DIRECTORY_${name.toUpperCase()}';
}
