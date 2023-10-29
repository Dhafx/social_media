import 'comment.dart';

class Post {
  final int id;
  final int userId;
  final String imageUrl;
  final String videoUrl;
  final String caption;
  final int likes;
  final List<Comment> comments;
  final String location;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.videoUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.location,
    required this.timestamp,
  });
}
