import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

void main() {
  testWidgets('EmojiFeedback displays correct number of emojis',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiFeedback(
            onChanged: (_) {},
          ),
        ),
      ),
    );

    expect(find.byType(SvgPicture), findsNWidgets(5));
  });

  testWidgets('EmojiFeedback displays custom number of emojis',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiFeedback(
            onChanged: (_) {},
            minRating: 1,
            maxRating: 3,
          ),
        ),
      ),
    );

    expect(find.byType(SvgPicture), findsNWidgets(3));
  });

  testWidgets('EmojiFeedback calls onChanged when tapped',
      (WidgetTester tester) async {
    int? changedRating;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return EmojiFeedback(
                onChanged: (rating) => setState(() => changedRating = rating),
              );
            },
          ),
        ),
      ),
    );

    // Tap the third emoji (index 2)
    await tester.tap(find.byType(GestureDetector).at(2));
    await tester.pump();
    expect(changedRating, 3);

    // Tap the same emoji again to deselect
    await tester.tap(find.byType(GestureDetector).at(2));
    await tester.pump();
    expect(changedRating, null);
  });

  testWidgets('EmojiFeedback displays labels when showLabel is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiFeedback(
            onChanged: (_) {},
            showLabel: true,
          ),
        ),
      ),
    );

    expect(find.byType(Text), findsNWidgets(5));
  });

  testWidgets('EmojiFeedback does not display labels when showLabel is false',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiFeedback(
            onChanged: (_) {},
            showLabel: false,
          ),
        ),
      ),
    );

    expect(find.byType(Text), findsNothing);
  });

  testWidgets('EmojiFeedback displays custom labels',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiFeedback(
            onChanged: (_) {},
            customLabels: const ['A', 'B', 'C', 'D', 'E'],
          ),
        ),
      ),
    );

    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.text('D'), findsOneWidget);
    expect(find.text('E'), findsOneWidget);
  });

  testWidgets('EmojiFeedback applies custom labelTextStyle',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiFeedback(
            onChanged: (_) {},
            labelTextStyle: const TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.byType(Text).first);
    expect(textWidget.style?.fontSize, 20);
    expect(textWidget.style?.color, Colors.red);
  });

  testWidgets('EmojiFeedback uses custom presetBuilder',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiFeedback(
            onChanged: (_) {},
            presetBuilder: (_, __, ___) => const Icon(Icons.star),
          ),
        ),
      ),
    );

    expect(find.byType(SvgPicture), findsNothing);
    expect(find.byType(Icon), findsNWidgets(5));
    expect(find.byIcon(Icons.star), findsNWidgets(5));
  });

  testWidgets('EmojiFeedback respects initial rating',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiFeedback(
            onChanged: (_) {},
            inactiveElementScale: 0.7,
            initialRating: 3,
          ),
        ),
      ),
    );

    final activeEmoji =
        tester.widget<AnimatedScale>(find.byType(AnimatedScale).at(2));
    expect(activeEmoji.scale, 1.0);

    final inactiveEmoji =
        tester.widget<AnimatedScale>(find.byType(AnimatedScale).first);
    expect(inactiveEmoji.scale, 0.7);
  });
}
