// String formatDuration(int minutes) {
//   final duration = Duration(minutes: minutes);
//   final hours = duration.inHours;
//   final minutesRemainder = duration.inMinutes.remainder(60);
//
//   return '$hours hrs $minutesRemainder min';
// }
String formatDuration(int seconds) {
  final duration = Duration(seconds: seconds);
  final hours = duration.inHours;
  final minutesRemainder = duration.inMinutes.remainder(60);
  if (hours == 0) {
    return '$minutesRemainder min';
  }
  if (minutesRemainder == 0) {
    return '$hours hrs';
  }
  if (hours == 1) {
    return '$hours hr $minutesRemainder min';
  }
  return '$hours hrs $minutesRemainder min';
}
