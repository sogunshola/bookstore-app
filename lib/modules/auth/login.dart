import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

import '../../configs/constants.dart';
import '../../configs/routes.dart';
import '../../generated/l10n.dart';
import '../../utils/form_validator.dart';
import '../../utils/text_style.dart';

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    if (authenticated) {
      Navigator.pushReplacementNamed(context, Routes.landing);
    }
  }

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Form(
            key: _formKey,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          L10n.of(context).loginScreenTitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .bold
                              .copyWith(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          style: Theme.of(context).textTheme.bodyText2,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(kBoxDecorationRadius)),
                                  borderSide: BorderSide.none),
                              filled: true,
                              // labelText: "Username",
                              hintText: L10n.of(context).usernameHintText),
                          keyboardType: TextInputType.text,
                          validator:
                              FormValidator.isRequired('Please enter username'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(kBoxDecorationRadius)),
                                  borderSide: BorderSide.none),
                              hintText: L10n.of(context).passwordHintText),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator:
                              FormValidator.isRequired('Please enter password'),
                        ),
                      ],
                    ),
                    if (_supportState == _SupportState.supported)
                      IconButton(
                          onPressed: _authenticateWithBiometrics,
                          icon: const Icon(
                            Icons.fingerprint,
                            size: 50,
                          )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "No, account ?",
                                /* style: GoogleFonts.robotoSlab(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w600,
                                ), */
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  "Register",
                                  /* style: GoogleFonts.robotoSlab(
                                    fontSize: 14,
                                    // color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ), */
                                ),
                              )
                            ],
                          ),
                        ),
                        /* BlocBuilder<LoginBloc, LoginState>(
                          cubit: globals.loginBloc,
                          builder: (context, state) {
                            return InkWell(
                              onTap: state is LoginLoading
                                  ? null
                                  : () => {
                                        if (_formKey.currentState.validate())
                                          {
                                            globals.loginBloc.add(
                                                LoginButtonPressed(
                                                    username:
                                                        _usernameController.text,
                                                    password:
                                                        _passwordController.text)),
                                          }
                                      },
                              child: */
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(
                                  context, Routes.landing);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(kPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size.fromHeight(50)),
                          ),
                          child: Center(
                            child: Text(
                              L10n.of(context).loginButtonText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .bold
                                  .fs14
                                  .white,
                            ),
                          ),
                        ),
                        // );
                        // },
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
