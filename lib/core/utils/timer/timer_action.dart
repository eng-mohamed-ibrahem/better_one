import 'dart:async';
import 'dart:ui';

/// [TimerAction] is a class to manage the timer
///
/// used to execute the function periodically
/// with capability to stop and reset the timer
///
///
/// [periodicDuration] is the duration of the timer
///
/// [action] is the function to be executed when the timer is triggered
///
///
class TimerAction {
  /// [TimerAction] is a class to manage the timer
  ///
  /// used to execute the function periodically
  /// with capability to stop and reset the timer
  ///
  ///
  /// [periodicDuration] is the duration of the timer
  ///
  /// [action] is the function to be executed when the timer is triggered
  ///
  ///
  TimerAction({
    this.periodicDuration = const Duration(seconds: 1),
    required this.action,
  }) {
    _stopwatch = Stopwatch();
  }
  late final Stopwatch _stopwatch;
  Timer? _timer;
  final Duration periodicDuration;
  final VoidCallback action;
  Duration get elapsed => _stopwatch.elapsed;

  void start() {
    if (_stopwatch.isRunning) {
      return;
    }
    _stopwatch.start();
    _timer = Timer.periodic(
      periodicDuration,
      (timer) {
        if (_stopwatch.isRunning) {
          action();
        } else {
          _timer?.cancel();
          _timer = null;
        }
      },
    );
  }

  void stop() {
    _stopwatch.stop();
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    _stopwatch.reset();
    _timer?.cancel();
    _timer = null;
  }

  void resetAndStart() {
    reset();
    start();
  }
}
