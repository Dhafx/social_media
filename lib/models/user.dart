import 'post.dart';
import 'story.dart';

class User {
  final int id;
  final String profilePicture;
  final String username;
  final String name;
  final String bio;
  final int followers;
  final int following;
  final List<Post> posts;
  final List<User> followersList;
  final List<Story> stories;

  User({
    required this.id,
    required this.profilePicture,
    required this.username,
    required this.name,
    required this.bio,
    required this.followers,
    required this.following,
    required this.posts,
    required this.followersList,
    required this.stories,
  });
}
