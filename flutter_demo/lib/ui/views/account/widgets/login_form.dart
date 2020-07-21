import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/utils.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _accessCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Function(String) onSubmit;

  LoginForm({ this.onSubmit });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        width: 320,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Log In',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _accessCodeController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        labelText: 'Number',
                        labelStyle: TextStyle(
                          color: Colors.deepPurple,
                        ),
                        hintText: 'Enter the number',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      onEditingComplete: () => _onSubmit(),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter the number';
                        } else if (!Utils.validateAccessCode(value)) {
                          return 'Invalid number';
                        }
                        return null;
                      },
                    ),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      splashColor: Colors.purple.withAlpha(30),
                      hoverColor: Colors.grey.withAlpha(30),
                      onPressed: () {
                        _onSubmit();
                      },
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      onSubmit(_accessCodeController.text);
    }
  }
}