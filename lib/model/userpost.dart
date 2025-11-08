import 'usercomment.dart';

class Userpost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numshare;
  List<Usercomment> comments;
  bool isLiked;

  Userpost ({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numshare,
    this.comments = const [],
    this.isLiked = false,
  });
}