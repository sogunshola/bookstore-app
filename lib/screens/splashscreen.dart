import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widgets/strut_text.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: StrutText(
            L10n.of(context).commonBoilerPlateText,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
