import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  static const routeName = '/alerts';

  Future<void> _showMaterialAlert(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Título'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.0),
            ],
          ),
          actions: [
            TextButton(onPressed: () {}, child: Text('Cancelar')),
            TextButton(onPressed: () {}, child: Text('Ok')),
          ],
        );
      },
    );
    // await showCupertinoDialog(
    //   context: context,
    //   builder: (context) {
    //     return CupertinoAlertDialog(
    //       title: const Text('Título'),
    //       content: const Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text('Este es el contenido de la caja de la alerta'),
    //           FlutterLogo(size: 100.0),
    //         ],
    //       ),
    //       actions: [
    //         CupertinoDialogAction(
    //             onPressed: () => Navigator.pop(context),
    //             child: const Text('Cancelar')),
    //         CupertinoDialogAction(onPressed: () {}, child: const Text('Ok')),
    //       ],
    //     );
    //   },
    // );
  }

  Future<void> _showCupertinoAlert(BuildContext context) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Título'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.0),
            ],
          ),
          actions: [
            CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
            CupertinoDialogAction(onPressed: () {}, child: const Text('Ok')),
          ],
        );
      },
    );
  }

  Future<void> _showAdaptiveAlert(BuildContext context) async {
    await showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: const Text('Título'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.0),
            ],
          ),
          actions: [
            adaptiveAction(
                context: context,
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
            adaptiveAction(
                context: context, onPressed: () {}, child: const Text('Ok')),
          ],
        );
      },
      barrierDismissible: true,
    );
  }

  Widget adaptiveAction(
      {required BuildContext context,
      required VoidCallback onPressed,
      required Widget child}) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alertas')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => _showMaterialAlert(context),
              child: const Text('Material alerta'),
            ),
            ElevatedButton(
              onPressed: () => _showCupertinoAlert(context),
              child: const Text('Cupertino alerta'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.remove_red_eye),
        onPressed: () => _showAdaptiveAlert(context),
      ),
    );
  }
}
