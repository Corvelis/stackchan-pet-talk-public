import 'package:flutter_test/flutter_test.dart';
import 'package:stackchan_talk/app.dart';

void main() {
  testWidgets('shows setup connection screen', (tester) async {
    await tester.pumpWidget(const StackchanTalkApp());

    expect(find.text('stackchan-talk'), findsOneWidget);
    expect(find.text('接続を準備'), findsOneWidget);
    expect(find.text('接続テスト'), findsOneWidget);
  });

  testWidgets('switches setup screen language', (tester) async {
    await tester.pumpWidget(const StackchanTalkApp());

    await tester.tap(find.text('JA'));
    await tester.pump();

    expect(find.text('Prepare connection'), findsOneWidget);
    expect(find.text('Test connection'), findsOneWidget);
    expect(find.text('EN'), findsOneWidget);
  });
}
