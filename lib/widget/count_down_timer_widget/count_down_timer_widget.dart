import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_view.dart';
import 'package:login_trainning_cnv/widget/count_down_timer_widget/count_down_timer_provider.dart';
import 'package:provider/provider.dart';

class CountDownTimerWidget extends StatefulWidget {
  final DateTime expiredDate;

  const CountDownTimerWidget({Key key, this.expiredDate}) : super(key: key);
  @override
  CountDownTimerWidgetState createState() => CountDownTimerWidgetState();
}

class CountDownTimerWidgetState
    extends BaseView<CountDownTimerWidget, CountDownTimerProvider> {
  @override
  CountDownTimerProvider initProverder() {
    return CountDownTimerProvider(this);
  }

  @override
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TweenAnimationBuilder<Duration>(
          duration: Duration(hours: 3),
          tween: Tween(
              begin: Duration(
                  hours: widget.expiredDate.hour == null
                      ? 0
                      : widget.expiredDate.hour),
              end: Duration.zero),
          onEnd: () {},
          builder: (BuildContext context, Duration value, Widget child) {
            // final hours = value.inHours;
            // final minutes = value.inMinutes % 60;
            // final seconds = value.inSeconds % 60;
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child:
                    Consumer<DurationNotifier>(builder: (context, duration, _) {
                  if (duration.value == null) {
                    return SizedBox();
                  } else
                    return (duration.value.inSeconds <= 0)
                        ? SizedBox()
                        : countDownTimerHotDeals(duration.value);
                }));
          }),
    );
  }

  countDownTimerHotDeals(Duration duration) {
    return Row(
      children: [
        countDownTimerItem((duration?.inHours ?? 0) % 24, true),
        countDownTimerItem((duration?.inMinutes ?? 0) % 60, true),
        countDownTimerItem((duration?.inSeconds ?? 0) % 60, false),
      ],
    );
  }

  countDownTimerItem(int timer, bool show) {
    return Row(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              timer < 10 ? '0' : '${timer ~/ 10}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              timer == 0 ? '0' : '${timer % 10}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        show
            ? Container(
                child: Text(
                  ' : ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
