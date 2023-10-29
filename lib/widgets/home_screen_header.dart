import 'package:flutter/cupertino.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Icon(CupertinoIcons.camera),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(CupertinoIcons.envelope),
          ),
        ],
      ),
    );
  }
}
