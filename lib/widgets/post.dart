import 'package:flutter/cupertino.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xFF9B2282),
                            Color(0xFFEEA863),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1727273/pexels-photo-1727273.jpeg?auto=compress&cs=tinysrgb&w=600'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          child: const Text(
                            'username',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        const Text(
                          'location',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(CupertinoIcons.ellipsis_vertical),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: ClipRRect(
              child: Image.network(
                'https://images.pexels.com/photos/4310975/pexels-photo-4310975.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(CupertinoIcons.heart),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(CupertinoIcons.chat_bubble),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(CupertinoIcons.paperplane),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(CupertinoIcons.bookmark),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 74,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1727273/pexels-photo-1727273.jpeg?auto=compress&cs=tinysrgb&w=600'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/1727273/pexels-photo-1727273.jpeg?auto=compress&cs=tinysrgb&w=600'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/1727273/pexels-photo-1727273.jpeg?auto=compress&cs=tinysrgb&w=600'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 42,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/1727273/pexels-photo-1727273.jpeg?auto=compress&cs=tinysrgb&w=600'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(text: 'Liked by '),
                      TextSpan(
                        text: 'username',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: '12K more',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: 'username',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                    text:
                        'this is the caasdhsagd jashgdhjasgdja hjasdfhgasfd jasdghasdfghasd asdfgfasgdfa sadgfadsas hasfdghasdf',
                  ),
                ],
              ),
            ),
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
