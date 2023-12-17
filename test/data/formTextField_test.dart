import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_media/widgets/form_text_field.dart';

void main() {
  testWidgets("Form Text Field Element Test", (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FormTextField(
            fieldController: controller,
            type: 'text',
            fieldLabelText: 'Test Field',
          ),
        ),
      ),
    );
    expect(find.byType(FormTextField), findsOneWidget);
  });
}
