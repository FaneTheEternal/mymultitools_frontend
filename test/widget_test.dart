// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mymultitools_frontend/KeyWords.dart';
import 'package:mymultitools_frontend/apps/notes.dart';
import 'package:mymultitools_frontend/apps/schedule.dart';
import 'package:mymultitools_frontend/auth.dart';

import 'package:mymultitools_frontend/main.dart';

void main() {
  test('auth model', () {
    // Test login
    final authLoginModel = AuthModel();
    authLoginModel.addListener(() {
      expect(true, equals(authLoginModel.isLogin));
    });
    authLoginModel.login('username', 'password');

    // Test logout
    final authLogoutModel = AuthModel();
    authLogoutModel.login('username', 'password');
    authLogoutModel.addListener(() {
      expect(false, equals(authLogoutModel.isLogin));
    });
    authLogoutModel.logout();
  });

  test('Schedule Notifier', () {
    final schedule = Schedule();
    int initCount = 0;
    schedule.addListener(() {
      expect(initCount, lessThan(schedule.count));
    });
  });

  group('Notes Notifier', () {
    test('Notes add', () {
      final notesNotifierAdd = Notes();
      final initCountAdd = notesNotifierAdd.count;
      notesNotifierAdd.addListener(() {
        expect(initCountAdd, lessThan(notesNotifierAdd.count));
      });
      notesNotifierAdd.add(Note(name: 'name'));
    });
    test('Notes remove', () {
      final notesNotifierRemove = Notes();
      notesNotifierRemove.add(Note(name: 'name'));
      final initCountRemove = notesNotifierRemove.count;
      notesNotifierRemove.addListener(() {
        expect(initCountRemove, greaterThan(notesNotifierRemove.count));
      });
      notesNotifierRemove.remove(0);
    });
  });

  testWidgets('App widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    await tester.tap(find.bySemanticsLabel(KeyWords.username.sentenceCase));
  });
}
