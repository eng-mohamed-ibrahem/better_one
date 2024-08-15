import 'dart:ui';

enum TaskStatus {
  done(Color(0xFF4AAF50)),
  inprogress(Color.fromRGBO(33, 150, 243, 1)),
  paused(Color.fromRGBO(255, 193, 7, 1)), //#FFC107 , #FF9800
  created(Color.fromRGBO(255, 152, 0, 1));

  final Color color;
  const TaskStatus(this.color);
}
