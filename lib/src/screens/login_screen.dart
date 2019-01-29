import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///formKey es donde se hace la magia para validar.
  ///mirar los metodos de FormState para ver sus funciones.
  ///reset, save, validate...
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password= '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
      },
      onSaved: (String value){
       email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '',
      ),
      obscureText: true,
      validator: (String value) {
        if (value.length < 4) {
          return "Password must be at least 4 caracters";
        }
      },
      onSaved: (String value){
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        if(formKey.currentState.validate()){
         formKey.currentState.save();
         print('Enviar a API: $email and $password');
        }
      },
    );
  }
}
