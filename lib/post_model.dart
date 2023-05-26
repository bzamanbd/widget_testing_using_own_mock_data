class PostModel {
  final int id;
  final String title, body;

  PostModel({required this.id, required this.title, required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data.addAll({'id': id});
    data.addAll({'title': title});
    data.addAll({'body': body});
    return data;
  }
}
