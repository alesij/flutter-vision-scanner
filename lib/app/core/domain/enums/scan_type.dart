/// Enum representing the type of scan performed.
enum ScanType {
  /// Face detection scan.
  face('face'),

  /// Text recognition scan.
  text('text');

  /// The string value representing the scan type.
  final String value;

  const ScanType(this.value);

  /// Parse a string to a ScanType enum.
  /// Returns null if the string doesn't match any enum value.
  static ScanType? fromString(String? value) {
    if (value == null) return null;
    try {
      return ScanType.values.firstWhere((e) => e.value == value);
    } catch (e) {
      return null;
    }
  }

  /// Get a user-friendly display name for the scan type.
  String get displayName {
    switch (this) {
      case ScanType.face:
        return 'Face Detection';
      case ScanType.text:
        return 'Text Recognition';
    }
  }
}
