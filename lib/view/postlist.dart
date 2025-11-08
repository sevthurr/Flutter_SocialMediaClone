import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_clone/view/profileview.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';
import '../model/usercomment.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State <Postlist> {
  var nametxtStyle = GoogleFonts.poppins (fontSize: 16, fontWeight: FontWeight.bold);

  gotoPage (BuildContext context, dynamic page) {
    Navigator.of(context).push(MaterialPageRoute (builder: (context) => page));
  }

  void addComment(Userpost userPost, String commentContent) {
    setState(() {
      userPost.comments.add(Usercomment(
        commenterImg: widget.userdata.myUserAccount.img,
        commenterName: widget.userdata.myUserAccount.name,
        commentTime: 'Just now',
        commentContent: commentContent,
      ));
    });
  }

  void showCommentDialog(Userpost userPost) {
    TextEditingController commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Comment'),
          content: TextField(
            controller: commentController,
            decoration: const InputDecoration(hintText: 'Enter your comment'),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  addComment(userPost, commentController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Post'),
            ),
          ],
        );
      },
    );
  }

  Widget buttons (Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom (
          foregroundColor: (userPost.isLiked) ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            userPost.isLiked = (userPost.isLiked) ? false : true;
          });
        },

        icon: const Icon(Icons.thumb_up),
        label: const Text('Like'),
      ),
      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {
          showCommentDialog(userPost);
        },
        icon: const Icon(Icons.message),
        label: const Text('Comment'),
      ),

      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {},
        icon: const Icon(Icons.share),
        label: const Text('Share'),
      ),
    ],
  );
  Widget postCount(Userpost userPost) => Row (
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userPost.comments.length} Comments'),
      const Text (''),
      const SizedBox(width: 20),
      Text('${userPost.numshare} Shares'),
    ],
  );
  Widget postImage (Userpost userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.postimg),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );

  Widget postHeader (Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg)
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          Row(
            children: [
              Text('${userPost.time} . '),
              const Icon(Icons.people, size: 18),
            ],
          ),
        ],
      ),
    ],
  );

  Widget showPost(Userpost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(children: [Text(userPost.postcontent, style: nametxtStyle)]),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(userPost),
      displayComments(userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey)),
      const SizedBox(height: 15),
    ],
  );

  Widget displayComments(Userpost userPost) {
    if (userPost.comments.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: userPost.comments.map((comment) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(comment.commenterImg),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.commenterName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      comment.commentContent,
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      comment.commentTime,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.userdata.userList.map((userPost) {
        return InkWell (
          onTap: () {
            gotoPage(context, ProfileView(userPost: userPost));
          },
          child: showPost(userPost),
        );
      }).toList(),
    );
  }
}