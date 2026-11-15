import 'package:flutter_test/flutter_test.dart';
import 'package:kosfeapp/main.dart';

void main() {
  testWidgets('HomeDashboard renders correctly smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('EcoHome'), findsOneWidget);
    expect(find.text('Living Room'), findsOneWidget);
    expect(find.text('Good morning, Ayu'), findsOneWidget);
  });
}
