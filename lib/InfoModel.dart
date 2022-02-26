import 'dart:html';

import 'comment.dart';
class InfoModel {
  final String username;
  final String imgProfile;
  final String imgPost;
  final String detail;
/*  final String nameCmt;
  final String text;*/
  List<comment> cm /*= [comment(username: 'mudeng', text: 'น่ารักจัง ขอไลน์หน่อยค่ะ'), comment(username: 'bobo', text: 'หิว')]*/;
  // addComment(nameCmt, text);
  //final comment c;
  InfoModel({
    required this.username,
    required this.imgProfile,
    required this.imgPost,
    required this.detail,
    required this.cm,
    /* required this.nameCmt,
    required this.text,*/

  });

  void addComment(String user, String t){
    cm.add(comment(username: '${user}',text: '${t}'));
  }
}
