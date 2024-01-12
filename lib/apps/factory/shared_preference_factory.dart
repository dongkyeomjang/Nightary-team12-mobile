import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceFactory {
  static SharedPreferences? _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
    // _instance!.remove("nickname");
  }

  static SharedPreferences get instance => _instance!;

  static void setAlarmTime(int hour, int minute) async {
    _instance!.setInt(AlarmTime.hour.name, hour);
    _instance!.setInt(AlarmTime.minute.name, minute);
  }

  static Map<AlarmTime, int> getAlarmTime() {
    return {
      AlarmTime.hour: _instance!.getInt(AlarmTime.hour.name) ?? 0,
      AlarmTime.minute: _instance!.getInt(AlarmTime.minute.name) ?? 0,
    };
  }

  static void setTargetSleepTime(
      int startHour, int startMinute, int endHour, int endMiute) async {
    _instance!.setInt(TargetSleepTime.startHour.name, startHour);
    _instance!.setInt(TargetSleepTime.startMinute.name, startMinute);
    _instance!.setInt(TargetSleepTime.endHour.name, endHour);
    _instance!.setInt(TargetSleepTime.endMinute.name, endMiute);
  }

  static Map<TargetSleepTime, int> getTargetSleepTime() {
    return {
      TargetSleepTime.startHour:
          _instance!.getInt(TargetSleepTime.startHour.name) ?? 0,
      TargetSleepTime.startMinute:
          _instance!.getInt(TargetSleepTime.startMinute.name) ?? 0,
      TargetSleepTime.endHour:
          _instance!.getInt(TargetSleepTime.endHour.name) ?? 0,
      TargetSleepTime.endMinute:
          _instance!.getInt(TargetSleepTime.endMinute.name) ?? 0,
    };
  }
}

enum TargetSleepTime {
  startHour,
  startMinute,
  endHour,
  endMinute,
}

enum AlarmTime {
  hour,
  minute,
}