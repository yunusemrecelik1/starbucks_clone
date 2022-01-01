import 'package:flutter/material.dart';
import 'package:starbucks_clone/core/base/view/base_widget.dart';
import 'package:starbucks_clone/core/extension/context_extension.dart';
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
        floatingActionButton: FloatingActionButton(child: IconButton(icon: Icon(Icons.add),onPressed: (){})),
        appBar: AppBar(
          title: Text('Starbucks'),
          actions: [
            Padding(
              padding: context.paddingNormalRight,
              child: Row(
                children: [
                  Icon(Icons.notifications_none_sharp,color: context.colors.primary,),
                  SizedBox(width: context.normalValue),
                  Icon(Icons.more_vert,color: context.colors.primary),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
