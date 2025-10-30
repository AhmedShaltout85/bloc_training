class PostModel {
  final String title;
  final String body;
  final int userId;
  final int id;

  PostModel({
    required this.title,
    required this.body,
    required this.userId,
    required this.id,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'userId': userId,
      'id': id,
    };
  }

  PostModel copyWith({
    String? title,
    String? body,
    int? userId,
    int? id,
  }) {
    return PostModel(
      title: title ?? this.title,
      body: body ?? this.body,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }
}
