import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class Userdata {
  List <Userpost> userList = [
    Userpost(
      userimg: 'assets/rachel.jpg',
      username: 'Rachel Greene',
      time: '2 hrs ago',
      postcontent: 'What do you think of this dress?',
      postimg: 'assets/rachel_post.jpg',
      numshare: '5',
      comments: [],
      isLiked: true,
    ),
    Userpost(
      userimg: 'assets/ross.jpg',
      username: 'Ross Geller',
      time: '5 hrs ago',
      postcontent: 'Pivot!',
      postimg: 'assets/ross_post.jpg',
      numshare: '3',
      comments: [],
      isLiked: true,
    ),
    Userpost(
      userimg: 'assets/phoebe.jpg',
      username: 'Phoebe Buffay',
      time: '1 day ago',
      postcontent: 'Oh, my eyes! My eyes!',
      postimg: 'assets/phoebe_post.jpg',
      numshare: '10',
      comments: [],
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/chandler.jpg',
      username: 'Chandler Bing',
      time: '2 days ago',
      postcontent: 'That was perfection',
      postimg: 'assets/chandler_post.jpg',
      numshare: '12',
      comments: [],
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/monica.jpg',
      username: 'Monica Geller',
      time: '3 days ago',
      postcontent: 'I wanted it to look like Demi Moore',
      postimg: 'assets/monica_post.jpg',
      numshare: '15',
      comments: [],
      isLiked: true,
    ),
    Userpost(
      userimg: 'assets/joey.jpg',
      username: 'Joey Tribbiani',
      time: '1 week ago',
      postcontent: 'How you doin\'?',
      postimg: 'assets/joey_post.jpg',
      numshare: '20',
      comments: [],
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/ross.jpg', name: 'Ross Geller'),
    Friend(img: 'assets/rachel.jpg', name: 'Rachel Greene'),
    Friend(img: 'assets/monica.jpg', name: 'Monica Geller'),
    Friend(img: 'assets/chandler.jpg', name: 'Chandler Bing'),
    Friend(img: 'assets/joey.jpg', name: 'Joey Tribbiani'),
    Friend(img: 'assets/phoebe.jpg', name: 'Phoebe Buffay'),
  ];

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'assets/ross.jpg',
      commenterName: 'Ross Geller',
      commentTime: '1 hr ago',
      commentContent: 'Dinosaurs would love that!',
    ),
    Usercomment(
      commenterImg: 'assets/chandler.jpg',
      commenterName: 'Chandler Bing',
      commentTime: '2 hrs ago',
      commentContent: 'Could it BE anymore cool?',
    ),
    Usercomment(
      commenterImg: 'assets/phoebe.jpg',
      commenterName: 'Phoebe Buffay',
      commentTime: '3 hrs ago',
      commentContent: 'Smelly cat, smelly cat, what are they feeding you?',
    ),  
  ];

  Account myUserAccount = Account(
    name: 'Kaye Mayugba',
    email: 'kayemayugba730@gmail.com',
    img: 'assets/myimg.jpg',
    numFollowers: '7.2 Billion',
    numPosts: '1',
    numFollowing: '150',
    numFriends: '3000',
  );
}