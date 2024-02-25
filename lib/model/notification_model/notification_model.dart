class NotificationModel {
  int id;
  String title;
  String body;
  String? payload;

  NotificationModel({
    required this.title,
    required this.body,
    int? id,
    this.payload,
  }) : id = id ?? DateTime.now().millisecond;
  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, body: $body, payload: $payload)';
  }
}
