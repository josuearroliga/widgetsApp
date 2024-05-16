import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//We create this class to
class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

//This is what each element inside the pageview should have
  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final List<SlideInfo> slides = [
  SlideInfo(
      title: 'Deliverys geniales',
      caption: 'Duis commodo nisi esse commodo consectetur.',
      imageUrl: 'assests/1.png'),
  SlideInfo(
      title: 'Deliverys version dos',
      caption: 'Duis commodo nisi esse commodo consectetur.',
      imageUrl: 'assests/2.png'),
  SlideInfo(
      title: 'Ya no son deliverys',
      caption: 'Duis commodo nisi esse commodo consectetur.',
      imageUrl: 'assests/13png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: PageView(
        children: slides
            .map(
              (slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl),
            )
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
