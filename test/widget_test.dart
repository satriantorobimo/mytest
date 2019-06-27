import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_test/pages/home.dart';

void main(){
  testWidgets('Items are displayed', (WidgetTester tester) async{
    final titleProductFinder = Key('title_product');
    final iconProductFinder = Key('icon_product');
    final openBrowserFinder = Key('open_brw');
    
    await tester.pumpWidget(TestPageWrapper());
    // This causes the stream builder to get the data
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byKey(titleProductFinder), findsWidgets);
    expect(find.byKey(iconProductFinder), findsWidgets);
    expect(find.byKey(openBrowserFinder), findsWidgets);
  });


   testWidgets('Items not displayed', (WidgetTester tester) async{
     final errorLoadFinder = Key('error_load');

     await tester.pumpWidget(TestPageWrapper());
     // This causes the stream builder to get the data
     await tester.pump(Duration.zero);

     expect(find.byKey(errorLoadFinder), findsWidgets);
   });
}

class TestPageWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      home: HomePage(),
    );
  }
}
