import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Example App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final emojiPresets = {
  'notoAnimatedEmojis': notoAnimatedEmojis,
  'classicEmojiPreset': classicEmojiPreset,
  'threeDEmojiPreset': threeDEmojiPreset,
  'handDrawnEmojiPreset': handDrawnEmojiPreset,
};

class _HomePageState extends State<HomePage> {
  int? rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ...emojiPresets.entries.map((entry) => Column(
                    children: [
                      Text(entry.key),
                      EmojiFeedback(
                        initialRating: 3,
                        onChangeWaitForAnimation: true,
                        emojiPreset: entry.value,
                        labelTextStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                        onChanged: (value) {
                          setState(() => rating = value);
                          // Show snackbar
                          ScaffoldMessenger.of(context)
                            ..clearSnackBars()
                            ..showSnackBar(SnackBar(content: Text('$value')));
                        },
                      )
                    ],
                  )),
              Column(
                children: [
                  const Text("Custom preset builder"),
                  EmojiFeedback(
                    initialRating: 3,
                    onChangeWaitForAnimation: true,
                    presetBuilder: (p0, p1, p2) => const Icon(Icons.star),
                    labelTextStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                    onChanged: (value) {
                      setState(() => rating = value);
                      // Show snackbar
                      ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(SnackBar(content: Text('$value')));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
