import 'package:flutter_test/flutter_test.dart';
import 'package:vexplorer/main.dart';

void main() {
  testWidgets('App should launch without errors', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const VExplorerApp());

    // Verify the app title is present
    expect(find.text('vExplorer - Video File Explorer'), findsOneWidget);
    
    // Verify the main sections are present
    expect(find.text('Directory Browser'), findsOneWidget);
    expect(find.text('Options'), findsOneWidget);
    expect(find.text('Video Information'), findsOneWidget);
  });

  testWidgets('Select Directory button should be present', (WidgetTester tester) async {
    await tester.pumpWidget(const VExplorerApp());

    // Verify the Select Directory button is present
    expect(find.text('Select Directory'), findsOneWidget);
  });

  testWidgets('Options panel should show file extensions', (WidgetTester tester) async {
    await tester.pumpWidget(const VExplorerApp());

    // Verify some extension chips are present
    expect(find.text('.mp4'), findsOneWidget);
    expect(find.text('.avi'), findsOneWidget);
    expect(find.text('.mov'), findsOneWidget);
  });

  testWidgets('Options panel should show display fields', (WidgetTester tester) async {
    await tester.pumpWidget(const VExplorerApp());

    // Verify some display options are present
    expect(find.text('Filename'), findsOneWidget);
    expect(find.text('Codec'), findsOneWidget);
    expect(find.text('Resolution'), findsOneWidget);
  });
}
