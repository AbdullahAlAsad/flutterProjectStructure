import 'package:finz/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('Splash', (tester) async {
      await tester.pumpWidget(MyApp());
    });
  });
}
