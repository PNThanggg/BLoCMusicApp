extension DateTimeExtension on int {
  String formatToHHMMSS() {
    if (this != 0) {
      final int hours = this ~/ 3600;
      final int seconds = this % 3600;
      final int minutes = seconds ~/ 60;

      final String hoursStr = hours.toString().padLeft(2, '0');
      final String minutesStr = minutes.toString().padLeft(2, '0');
      final String secondsStr = (seconds % 60).toString().padLeft(2, '0');

      if (hours == 0) {
        return '$minutesStr:$secondsStr';
      }
      return '$hoursStr:$minutesStr:$secondsStr';
    } else {
      return '';
    }
  }

  int get yearFromEpoch => DateTime.fromMillisecondsSinceEpoch(this * 1000).year;
}
