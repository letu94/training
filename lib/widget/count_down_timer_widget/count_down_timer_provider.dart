import 'dart:async';

import 'package:login_trainning_cnv/base/base_notifier.dart';
import 'package:login_trainning_cnv/base/base_provider.dart';
import 'package:login_trainning_cnv/widget/count_down_timer_widget/count_down_timer_widget.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class CountDownTimerProvider extends BaseProvider<CountDownTimerWidgetState> {
  CountDownTimerProvider(CountDownTimerWidgetState state) : super(state) {
    init();
  }

  // HoursTimerNotifier hours = HoursTimerNotifier(0);
  // MinutesTimerNotifier minutes = MinutesTimerNotifier(0);
  // SecondsTimerNotifier seconds = SecondsTimerNotifier(0);
  DurationNotifier durationNotifier = DurationNotifier(null);


  // DurationNotifier durationNotifier = DurationNotifier(1);
  DateTime now = DateTime.now();
  Duration duration;
  Timer timer;
  // DateTime rest;

  @override
  List<BaseNotifier> initNotifiers() {
    return [durationNotifier];
  }

  init() {
    DateTime _rest = DateTime(
        now.year,
        now.month,
        now.day,
        state.widget.expiredDate.hour,
        state.widget.expiredDate.minute,
        state.widget.expiredDate.second);
    duration = _rest.difference(now);
    // durationNotifier.value = duration;
    // int hour = duration.inHours;
    // int minute = duration.inMinutes;
    // int second = duration.inSeconds;
    // if (hour <= 0) {
    //   hour = 0;
    // }
    timerDuration();
  }

  void timerDuration() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      duration = Duration(seconds: duration.inSeconds -1);
      durationNotifier.value = duration;
      // if(duration == 0){
        
      // }
      // hours = hours;
      // minutes = minutes;
    //   if(seconds.value > 0){
    //     seconds.value = seconds.value - 1;
    // } else {seconds.value = 59;}

    // if(seconds.value == 0){
    //   minutes.value = minutes.value - 1;
    // }
    // if(minutes.value == 00 && seconds.value == 0){
    //   hours.value = hours.value -1;
    //   minutes.value = 59;
    //   seconds.value = 59;
    // }
    }
    );
  }
}

class DurationNotifier extends BaseNotifier<Duration> {
  DurationNotifier(Duration value) : super(value);

  @override
  SingleChildWidget provider() {
    return ChangeNotifierProvider<DurationNotifier>(create: (_) => this);
  }
}

// class HoursTimerNotifier extends BaseNotifier<int> {
//   HoursTimerNotifier(int value) : super(value);

//   @override
//   SingleChildWidget provider() {
//     return ChangeNotifierProvider<HoursTimerNotifier>(create: (_) => this);
//   }
// }

// class MinutesTimerNotifier extends BaseNotifier<int> {
//   MinutesTimerNotifier(int value) : super(value);

//   @override
//   SingleChildWidget provider() {
//     return ChangeNotifierProvider<MinutesTimerNotifier>(create: (_) => this);
//   }
// }

// class SecondsTimerNotifier extends BaseNotifier<int> {
//   SecondsTimerNotifier(int value) : super(value);

//   @override
//   SingleChildWidget provider() {
//     return ChangeNotifierProvider<SecondsTimerNotifier>(create: (_) => this);
//   }
// }
