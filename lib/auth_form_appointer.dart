import 'package:flutter/material.dart';

class AuthFormAppointer extends StatefulWidget {
  AuthFormAppointer(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;

  final void Function(
    String email,
    String password,
    String userName,
    String phn,
    String address,
    String specialisation,
    String fee,
    String emFee,
    int morTime1,
    int morTime2,
    int eveTime1,
    int eveTime2,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormAppointerState createState() => _AuthFormAppointerState();
}

class _AuthFormAppointerState extends State<AuthFormAppointer> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _phn = '';
  String _address = '';
  String _specialisation = '';
  String _fee = '';
  String _emFee = '';
  int _morTime1 = 0;
  int _morTime2 = 0;
  int _eveTime1 = 0;
  int _eveTime2 = 0;

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
          _userEmail.trim(),
          _userPassword.trim(),
          _userName.trim(),
          _phn.trim(),
          _address.trim(),
          _specialisation.trim(),
          _fee.trim(),
          _emFee.trim(),
          _morTime1,
          _morTime2,
          _eveTime1,
          _eveTime2,
          _isLogin,
          context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Username'),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('phn'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Phone'),
                      onSaved: (value) {
                        _phn = value;
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('address'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter a valid address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'address'),
                      onSaved: (value) {
                        _address = value;
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('specialisation'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter a valid specialisation';
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(labelText: 'Your Specialisation'),
                      onSaved: (value) {
                        _specialisation = value;
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('fee'),
                      validator: (value) {
                        if (value.isEmpty || value.length > 4) {
                          return 'Please enter a valid consultation fee';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'fee'),
                      onSaved: (value) {
                        _fee = value;
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('emFee'),
                      validator: (value) {
                        if (value.isEmpty || value.length > 4) {
                          return 'Please enter a valid emergency fee';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'emFee'),
                      onSaved: (value) {
                        _emFee = value;
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('morTime1'),
                      validator: (value) {
                        if (value.isEmpty || int.parse(value) > 12) {
                          return 'Please enter a valid time';
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(labelText: 'Morning Starting time'),
                      onSaved: (value) {
                        _morTime1 = int.parse(value);
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('morTime2'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid time';
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(labelText: 'Morning ending time'),
                      onSaved: (value) {
                        _morTime2 = int.parse(value);
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('eveTime1'),
                      validator: (value) {
                        if (value.isEmpty || int.parse(value) > 12) {
                          return 'Please enter a valid time';
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(labelText: 'Eveing starting time'),
                      onSaved: (value) {
                        _eveTime1 = int.parse(value);
                      },
                    ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('eveTime2'),
                      validator: (value) {
                        if (value.isEmpty || int.parse(value) > 12) {
                          return 'Please enter a valid time';
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(labelText: 'Eveing ending time'),
                      onSaved: (value) {
                        _eveTime2 = int.parse(value);
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(height: 12),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                      child: Text(_isLogin ? 'Login' : 'Signup'),
                      onPressed: _trySubmit,
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
