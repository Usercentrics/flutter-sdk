import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_example/main.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

import 'fake_usercentrics.dart';

void main() {
  tearDown(() {
    Usercentrics.delegatePackingProperty = null;
  });

  testWidgets('Initializes Usercentrics', (WidgetTester tester) async {
    final usercentrics = FakeUsercentrics();
    Usercentrics.delegatePackingProperty = usercentrics;

    await tester.pumpWidget(const MyApp());

    expect(usercentrics.initializeCount, 1);
  });
}
