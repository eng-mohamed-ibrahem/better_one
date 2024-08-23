import 'dart:async';

import 'package:flutter/material.dart';

/// Timer debouncing.
///
/// Use this class to debounce the timer. It will call the function after a certain duration.
/// Example:
///
///```dart
///  TimerDebouncing debouncing = TimerDebouncing();
///   debouncing.call(() {
///     // do something
///   });
///   debouncing.reset();
///```

class TimerDebouncing {
  /// Timer debouncing.
  ///
  /// Use this class to debounce the timer. It will call the function after a certain duration.
  /// Example:
  ///
  ///```dart
  ///  TimerDebouncing debouncing = TimerDebouncing();
  ///   debouncing.call(() {
  ///     // do something
  ///   });
  ///   debouncing.reset();
  ///```
  /// or change the duration
  ///
  ///```dart
  ///  TimerDebouncing debouncing = TimerDebouncing(const Duration(milliseconds: 1000));
  ///   debouncing.call(() {
  ///     // do something
  ///   });
  ///   debouncing.reset();
  ///```

  TimerDebouncing({this.afterDuration = const Duration(milliseconds: 300)});

  /// [_timer] is the timer that will call the function after a certain duration.
  Timer? _timer;

  /// [afterDuration] is the duration after which the function will be called.
  final Duration afterDuration;

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  /// [call] is the function that will provide the action after the duration.
  ///
  /// [action] is the function that will be called after the duration.
  /// Example:
  /// ```dart
  ///   TimerDebouncing debouncing = TimerDebouncing();
  ///   debouncing.call(() {
  ///     // do something
  ///   });
  /// ```
  ///
  void call(VoidCallback action) {
    cancel();
    _timer = Timer(afterDuration, action);
  }

  void reset() {
    cancel();
  }
}
