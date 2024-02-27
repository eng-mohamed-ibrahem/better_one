class NotificationModel {
  int id;
  String title;
  String body;
  String? payload;

  NotificationModel({
    required this.title,
    required this.body,
    required this.id,
    this.payload,
  });

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, body: $body, payload: $payload)';
  }
}
