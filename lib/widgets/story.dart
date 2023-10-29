import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  final int index;

  const Story({
    super.key,
    required this.index,
  });

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          right: widget.index == 19 ? 16 : 8,
          left: widget.index == 0 ? 16 : 8,
        ),
        width: 73,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(2.0),
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
                width: 72,
                height: 72,
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
            const Text(
              'username',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
