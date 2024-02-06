
import 'package:photography_application_challenge_22/models/Collocation.dart';

class User {
  final String name;
  final String profilePicture;
  final String username;
  final int followers;
  final int following;
  final List<Collocation> collocation;

  User({required this.name, required this.profilePicture, required this.username, required this.followers, required this.following, required this.collocation});

}