// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ui';

import 'package:better_one/core/utils/methods/methods.dart';

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
    kDebugPrint("_timer in start $_timer");
  }

  /// [stop] stop the action calling and stop timer without deleting the elabsed time
  void stop() {
    kDebugPrint("_timer in stop $_timer");
    if (_timer == null && _stopwatch.isRunning == false) {
      return;
    }
    _stopwatch.stop();
    _timer!.cancel();
    _timer = null;
    kDebugPrint("timer is stoped");
  }

  /// [reset] reset the timer to 0 counts and waiting for starting again
  void reset() {
    _stopwatch.reset();
    _noOfExecutes = 0;
    stop();
  }

  /// [resetAndStart] combine star and reset methods
  void resetAndStart() {
    reset();
    start();
  }

  @override
  String toString() {
    return 'PeriodicActionManager(_stopwatch: $_stopwatch, periodicDuration: $periodicDuration, action: $action)';
  }
}
