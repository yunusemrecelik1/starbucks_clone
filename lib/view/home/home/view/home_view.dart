import 'package:flutter/material.dart';
import 'package:starbucks_clone/core/base/view/base_widget.dart';
import 'package:starbucks_clone/view/home/home/viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, HomeViewModel value) => Scaffold(
        appBar: AppBar(
          title: Text('Starbucks'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Row(
                children: [
                  Icon(Icons.add_a_photo),
                  SizedBox(width: 15),
                  Icon(Icons.remove),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
