import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_todo_app/main.dart';

void main() {
  testWidgets('empty state is shown on launch', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('My To-Do List'), findsOneWidget);
    expect(find.text('No tasks yet'), findsOneWidget);
    expect(find.text('Nothing to do yet'), findsOneWidget);
  });

  testWidgets('can add and complete a task', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Add task'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.text('0 of 1 completed'), findsOneWidget);

    await tester.tap(find.byType(CheckboxListTile));
    await tester.pumpAndSettle();

    expect(find.text('1 of 1 completed'), findsOneWidget);
  });
}
