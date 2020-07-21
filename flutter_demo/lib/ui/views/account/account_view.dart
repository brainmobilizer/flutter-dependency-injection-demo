import 'package:flutter/material.dart';
import 'package:flutter_demo/core/services/albums_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/models/user.dart';
import 'package:flutter_demo/core/services/users_service.dart';
import 'package:flutter_demo/ui/views/account/account_viewmodel.dart';
import 'package:flutter_demo/ui/views/account/widgets/login_view.dart';
import 'package:flutter_demo/ui/views/account/widgets/albums_view.dart';

class AccountView extends StatelessWidget {
  AccountView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return ViewModelBuilder<AccountViewModel>.nonReactive(
      builder: (BuildContext context, AccountViewModel model, Widget child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Account',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Color(0xFF607D8B),
        ),
        backgroundColor: Colors.grey[100],
        body: user == null
          ? LoginView()
          : AlbumsView()
      ),
      viewModelBuilder: () => AccountViewModel(
                                usersService: Provider.of<UsersService>(context),
                                albumsService: Provider.of<AlbumsService>(context)),
      onModelReady: (AccountViewModel model) => model.getMyAlbums(user != null ? user.id : -1),
    );
  }
}