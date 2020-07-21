import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/ui/views/account/account_viewmodel.dart';
import 'package:flutter_demo/ui/views/account/widgets/login_form.dart';

class LoginView extends ViewModelWidget<AccountViewModel> {
  const LoginView({ Key key }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, AccountViewModel model) {
    Size screenSize = MediaQuery.of(context).size;
    return model.isBusy
      ? Container(
          width: screenSize.width,
          height: screenSize.height,
          alignment: Alignment.center,
          color: Color.fromRGBO(255, 255, 255, 0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple[200]),
              ),
              SizedBox(height: 24),
              Text(
                'Logging in...',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
            ]
          ),
        )
      : !model.hasError
        ? Container(
            width: screenSize.width,
            height: screenSize.height,
            alignment: Alignment.center,
            child: LoginForm(onSubmit: model.login)
          )
        : Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              model.error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          );
  }
}