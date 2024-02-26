import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nft_stock_app/generated/l10n.dart';
import 'package:nft_stock_app/presentation/pages/markets_page.dart';

Widget createTestableWidget({required Widget child}) {
  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: child,
  );
}

void main() {
  testWidgets('MarketsPage renders without crashing',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget(child: const MarketsPage()));

    // Check if the AppBar is displayed
    expect(find.byType(AppBar), findsOneWidget);

    // Check if the CircularProgressIndicator is displayed when the state is Initial
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    final marketsTextInAppBar = find.descendant(
      of: find.byType(AppBar),
      matching: find.text(S.current.markets),
    );

    expect(marketsTextInAppBar, findsOneWidget);
  });
}
