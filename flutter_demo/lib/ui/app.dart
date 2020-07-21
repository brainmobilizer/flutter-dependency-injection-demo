import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/ui/views/feed/feed_view.dart';
import 'package:flutter_demo/ui/views/explore/explore_view.dart';
import 'package:flutter_demo/ui/views/account/account_view.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                 blurRadius: 5.0
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.purple,
            selectedItemColor: Colors.white,
            selectedIconTheme: ThemeData.dark().iconTheme,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            items: [
              BottomNavigationBarItem(
                title: Text('Feed'),
                icon: Icon(Icons.dashboard),
              ),
              BottomNavigationBarItem(
                title: Text('Explore'),
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                title: Text('Account'),
                icon: Icon(Icons.camera),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AppViewModel()
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return FeedView();
      case 1:
        return ExploreView();
      case 2:
        return AccountView();
      default:
        return FeedView();
    }
  }
}

class AppViewModel extends IndexTrackingViewModel {}