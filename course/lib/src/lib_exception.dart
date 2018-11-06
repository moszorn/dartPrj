
class AppException implements Exception {
  final String reason;
  AppException([this.reason]);
  String toString() => reason == null ? 'Application Exception':reason;
}