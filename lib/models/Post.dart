
import 'package:photography_application_challenge_22/models/User.dart';

class Post {
  final User? user;
  final String location;
  final String dateAgo;
  final List<String> photos;
  final List<String>? relatedPhotos;

  Post({required this.location, required this.dateAgo, required this.photos, this.relatedPhotos, this.user});
}