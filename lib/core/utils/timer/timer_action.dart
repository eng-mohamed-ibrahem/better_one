import 'dart:async';

import 'package:flutter/foundation.dart';

/// Manages periodic actions.
///
/// This class provides a way to execute a function periodically.
/// The timer can be started, stopped, and reset.
///
/// [periodicDuration] is the duration of the timer
///
/// [action] is the function to be executed when the timer is triggered
/// and every periodicDuration
///
class PeriodicActionManager {
  /// Creates a new `PeriodicActionManager`.
  ///
  /// [periodicDuration] is the duration of the timer
  ///
  /// [action] is the function to be executed when the timer is triggered
  /// and every periodicDuration
  ///
  PeriodicActionManager({
    this.periodicDuration = const Duration(seconds: 1),
    required this.action,
  }) {
    _stopwatch = Stopwatch();
  }
  late final Stopwatch _stopwatch;
  Timer? _timer;

  /// [periodicDuration] the duration when [action] is called
  final Duration periodicDuration;

  /// [action] the executed action
  final VoidCallback action;

  /// [elapsed] elapsed time from the the begining after press *start* button
  Duration get elapsed => _stopwatch.elapsed;

  /// [_noOfExecutes] number of action executed or called
  int _noOfExecutes = 0;

  int get noOfExecutes => _noOfExecutes;

  /// start the timer with calling [action] after [periodicDuration]
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
          _noOfExecutes++;
        }
      },
    );
  }

  /// [stop] stop the action calling and stop timer without deleting the elabsed time
  void stop() {
    if (_timer == null) {
      return;
    }
    _stopwatch.stop();
    _timer!.cancel();
    _timer = null;
  }

  /// [reset] reset the timer to 0 counts and waiting for starting again
  void reset() {
    _stopwatch.reset();
    _noOfExecutes = 0;
    stop();
  }

  /// [resetAndStart] combine start and reset methods
  void resetAndStart() {
    reset();
    start();
  }

  @override
  String toString() {
    return 'PeriodicActionManager(_stopwatch: $_stopwatch, elapsed: ${_stopwatch.elapsed} ,status: ${_stopwatch.isRunning} ,periodicDuration: $periodicDuration, action: $action, _noOfExecutes: $_noOfExecutes, _timer: $_timer)';
  }
}
