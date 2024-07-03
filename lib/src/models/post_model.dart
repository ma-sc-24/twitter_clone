class PostModel {
  String name;
  String username;
  String description;
  String profilePhoto;
  String time;

  PostModel({
    required this.name,
    required this.username,
    required this.description,
    required this.profilePhoto,
    required this.time,
  });

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        name: json["name"],
        username: json["username"],
        description: json["description"],
        profilePhoto: json["profilePhoto"],
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "username": username,
        "description": description,
        "profilePhoto": profilePhoto,
        "time": time,
      };
}
