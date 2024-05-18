import 'package:animate_do/animate_do.dart';
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

//TODO:We create this list so we can then create a map builder that will create a different page for all the items inside this list. After that we create what we want to see in a sepparate stl widget and we call it from the Pageview map builder so it iterates to all the items inside this list.

final List<SlideInfo> slides = [
  SlideInfo(
      title: 'Deliverys geniales',
      caption: 'Duis commodo nisi esse commodo consectetur.',
      imageUrl: 'assets/1.png'),
  SlideInfo(
      title: 'Deliverys version dos',
      caption: 'Duis commodo nisi esse commodo consectetur.',
      imageUrl: 'assets/2.png'),
  SlideInfo(
      title: 'Ya no son deliverys',
      caption: 'Duis commodo nisi esse commodo consectetur.',
      imageUrl: 'assets/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pagePosition = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pagePosition.addListener(() {
      final page = pagePosition.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pagePosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Skip'),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: pagePosition,
            children: slides
                .map(
                  (slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl),
                )
                .toList(),
          ),
          endReached == true
              ? Positioned(
                  bottom: 40,
                  right: 30,
                  child: FadeInRight(
                    duration: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
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
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final textStyle2 = Theme.of(context).textTheme.bodyMedium;
    /////////
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: textStyle,
          ),
          const SizedBox(height: 10),
          Text(
            caption,
            style: textStyle2,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
