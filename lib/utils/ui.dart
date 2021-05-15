import 'package:flutter/material.dart';

import '../configs/constants.dart';
import '../generated/l10n.dart';
import '../widgets/custom_dialog.dart';

/// Custom UI dialogs: message, confirmation and error.
class UI {
  static Future<void> showCustomDialog(
    BuildContext context, {
    String title,
    String message,
    IconData icon,
    Color iconBackgroundColor,
    @required List<Widget> actions,
  }) async {
    return showGeneralDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black54, // space around dialog
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
              parent: a1,
              curve: Curves.elasticOut,
              reverseCurve: Curves.easeOutCubic),
          child: CustomDialog(
            title: title,
            message: message,
            icon: icon ?? Icons.info,
            iconBackgroundColor: iconBackgroundColor ?? kPrimaryColor,
            actions: actions,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return null;
      },
    );
  }

  static Future<void> showMessage(
    BuildContext context, {
    String title,
    String message,
    @required String buttonText,
    void Function() onPressed,
  }) async {
    return showCustomDialog(
      context,
      title: title,
      message: message,
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(Theme.of(context).buttonColor),
          ),
          child: Text(buttonText),
          onPressed: () {
            Navigator.of(context).pop();
            if (onPressed != null) {
              onPressed();
            }
          },
        ),
      ],
    );
  }

  static Future<void> confirmationDialogBox(
    BuildContext context, {
    String title,
    String message,
    String okButtonText,
    String cancelButtonText,
    @required void Function() onConfirmation,
  }) async {
    return showCustomDialog(
      context,
      title: title,
      message: message,
      icon: Icons.help,
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(Theme.of(context).buttonColor),
          ),
          child: Text(cancelButtonText ?? L10n.of(context).commonBtnCancel),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(Theme.of(context).buttonColor),
          ),
          child: Text(okButtonText ?? L10n.of(context).commonBtnOk),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirmation();
          },
        ),
      ],
    );
  }

  static Future<void> showErrorDialog(
    BuildContext context, {
    String title,
    String message,
    void Function() onPressed,
  }) async {
    return showCustomDialog(
      context,
      title: title ?? L10n.of(context).commonDialogsErrorTitle,
      message: message,
      icon: Icons.error,
      iconBackgroundColor: Colors.red,
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(Theme.of(context).buttonColor),
          ),
          child: Text(L10n.of(context).commonBtnClose.toUpperCase()),
          onPressed: () {
            Navigator.of(context).pop();
            if (onPressed != null) {
              onPressed();
            }
          },
        ),
      ],
    );
  }
}
