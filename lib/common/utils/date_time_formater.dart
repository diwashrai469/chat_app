import 'package:intl/intl.dart';

class DateAndTimeFormater {
  String formatDateOfIntToDaysHourMinSec(int timestamp) {
    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      final difference = now - timestamp;
      final seconds = (difference / 1000).floor();
      final minutes = (difference / 60000).floor();
      final hours = (difference / 3600000).floor();
      final days = (difference / (3600000 * 24)).floor();

      if (days >= 1) {
        final format = NumberFormat('###,###');
        return '${format.format(days)} days';
      } else if (hours >= 1) {
        final format = NumberFormat('###,###');
        return '${format.format(hours)} hr';
      } else if (minutes >= 1) {
        final format = NumberFormat('###,###');
        return '${format.format(minutes)} min';
      } else if (seconds >= 1) {
        final format = NumberFormat('###,###');
        return '${format.format(seconds)} sec';
      } else {
        return 'now';
      }
    } catch (e) {
      return 'long ago';
    }
  }

  String formatDateOfStringToDaysHourMinSec(String dateString) {
    try {
      DateTime now = DateTime.now();

      DateTime dateTime = DateTime.parse(dateString);
      Duration difference = now.difference(dateTime);
      if (difference.inDays > 0) {
        return '${difference.inDays} days ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hr ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} min ago';
      } else if (difference.inSeconds > 0) {
        return '${difference.inSeconds} sec ago';
      } else {
        return "just now";
      }
    } catch (e) {
      return "just now";
    }
  }

  String formatDateTohourAndMinute(int date) {
    int hours = date ~/ 3600;
    int minutes = (date % 3600) ~/ 60;
    String timeString = '';

    if (hours > 0) {
      timeString += '$hours Hr ';
    }

    if (minutes > 0) {
      timeString += '$minutes m';
    }

    return timeString.trim();
  }

  String formatDateTohourMinuteSecond(int date) {
    int hours = date ~/ 3600;
    int remainingSecondsAfterHours = date % 3600;
    int minutes = remainingSecondsAfterHours ~/ 60;
    int remainingSeconds = remainingSecondsAfterHours % 60;
    String timeString = '';

    if (hours > 0) {
      timeString += '$hours Hr ';
    }

    if (minutes > 0) {
      timeString += '$minutes Min ';
    }

    if (remainingSeconds > 0) {
      timeString += '$remainingSeconds Sec';
    }

    return timeString.trim();
  }

  String formatDateStringInDayMonthAndYear(String inputDateString) {
    DateTime dateTime = DateTime.parse(inputDateString);
    final DateFormat dateFormat = DateFormat(
      "dd MMMM yyyy",
    );
    String formattedDate = dateFormat.format(dateTime.toLocal());
    return formattedDate;
  }

  String formatDateStringInYearMonthDay(String inputDateString) {
    DateTime dateTime = DateTime.parse(inputDateString);
    final DateFormat dateFormat = DateFormat(
      "yyyy-MM-dd",
    );
    String formattedDate = dateFormat.format(dateTime.toLocal());
    return formattedDate;
  }

  String formatDateStringInDayMonthAndYearwithShortMonth(
      String inputDateString) {
    DateTime dateTime = DateTime.parse(inputDateString);
    final DateFormat dateFormat = DateFormat(
      "dd MMM yyyy",
    );
    String formattedDate = dateFormat.format(dateTime.toLocal());
    return formattedDate;
  }

//time
  String formatTimeToAmPm(DateTime dateTime) {
    String period = dateTime.hour < 12 ? 'AM' : 'PM';
    int hour = dateTime.hour % 12;
    hour = (hour == 0) ? 12 : hour;

    return '$hour:${dateTime.minute.toString().padLeft(2, '0')} $period';
  }

  //time in string
  String formatTimeToAmPmFromString(String timeString) {
    DateTime dateTime = DateTime.parse(timeString).toLocal();
    String period = dateTime.hour < 12 ? 'AM' : 'PM';
    int hour = dateTime.hour % 12;
    hour = (hour == 0) ? 12 : hour;

    return '$hour:${dateTime.minute.toString().padLeft(2, '0')} $period';
  }

//gretting with local time

  String getGreeting() {
    DateTime now = DateTime.now().toLocal();
    int hour = now.hour;

    return (hour >= 0 && hour < 12) ? 'Good Morning' : 'Good Evening';
  }
}
