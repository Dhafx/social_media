import 'dart:convert';

Follow followerFromJson(String str) => Follow.fromJson(json.decode(str));

String followerToJson(Follow data) => json.encode(data.toJson());

class Follow {
  String id;
  String username;
  String fullName;
  String profilePicUrl;
  bool isPrivate;
  bool isVerified;

  Follow({
    required this.id,
    required this.username,
    required this.fullName,
    required this.profilePicUrl,
    required this.isPrivate,
    required this.isVerified,
  });

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        id: json["id"],
        username: json["username"],
        fullName: json["full_name"],
        profilePicUrl: json["profile_pic_url"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "full_name": fullName,
        "profile_pic_url": profilePicUrl,
        "is_private": isPrivate,
        "is_verified": isVerified,
      };
}
