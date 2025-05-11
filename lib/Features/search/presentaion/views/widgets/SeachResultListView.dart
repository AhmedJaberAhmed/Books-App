
import 'package:flutter/cupertino.dart';



class SeachResultListView extends StatelessWidget {
  const SeachResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
         padding: const EdgeInsets.symmetric(horizontal: 30),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child:Text("data")
          );
        });
    ();
  }
}
