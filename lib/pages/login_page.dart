import 'package:flutter/material.dart';
import 'package:nitroport/backend/models.dart';
import 'package:nitroport/backend/nitroback.dart';
import 'package:nitroport/colortheme.dart';
import 'package:nitroport/components/button.dart';
import 'package:nitroport/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  String? _errorMessage;

  void _setError(String errorMessage) {
    setState(() {
      _errorMessage = errorMessage;
    });
  }

  void _login(String username, String password) async {
    LoginResultDto? resp =
        await nbLogin(_usernameCtrl.text, _passwordCtrl.text);
    if (resp == null) {
      _setError("Backend returned no response");
      return;
    }

    if (!resp.success) {
      _setError(resp.message ?? "Backend returned an error");
      return;
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MyHomePage(title: "title");
    }));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/backgrounds/background.png"),
                fit: BoxFit.fitHeight)),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF080016),
                border: Border.all(color: const Color(0xFF290D59), width: 2),
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.symmetric(vertical: 20),
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Image(
                      image: AssetImage("assets/nitroterm_logo.png"), height: 80),
                  const SizedBox(height: 20),
                  Text("Login to your account",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  Container(
                    margin:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 22),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (_errorMessage != null)
                            NTErrorHeader(text: _errorMessage!),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _usernameCtrl,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder()),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter an username';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordCtrl,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder()),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a password';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                              child: Text('Login'),
                              style: primaryButtonStyle(),
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }

                                _login(_usernameCtrl.text, _passwordCtrl.text);
                              }),
                          TextButton(
                              child: Text('Create account'),
                              style: secondaryButtonStyle(),
                              onPressed: () {
                                const snackBar = SnackBar(
                                  content: Text('Should create account'),
                                );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
