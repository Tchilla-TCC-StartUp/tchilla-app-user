import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tchilla/app_router.dart';

import 'package:tchilla/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final appRouter = AppRouter();
    await tester.pumpWidget(MyApp(router: appRouter.router));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
