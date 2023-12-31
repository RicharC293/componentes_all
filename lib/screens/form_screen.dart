import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  static const routeName = '/form';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de registro')),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('Ingrese sus datos'),
                  const SizedBox(height: 20),

                  /// Ingreso de letras
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre',
                      hintText: 'Richar',
                      prefixIcon: Icon(Icons.person),
                    ),
                    onChanged: (value) {
                      if (_emailController.text.isEmpty) {
                        _emailController.text = '$value@'.toLowerCase();
                        return;
                      }
                      final currentEmail = _emailController.text.split('@');
                      if (currentEmail.length == 2) {
                        _emailController.text =
                            '$value@${currentEmail[1]}'.toLowerCase();
                      } else {
                        _emailController.text = '$value@'.toLowerCase();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Apellido',
                      hintText: 'Cangui',
                      prefixIcon: Icon(Icons.person),
                    ),
                    onChanged: (value) {
                      if (_emailController.text.isEmpty) {
                        _emailController.text = '@$value.com'.toLowerCase();
                        return;
                      }
                      final currentEmail = _emailController.text.split('@');
                      if (currentEmail.length == 2) {
                        _emailController.text =
                            '${currentEmail[0]}@$value.com'.toLowerCase();
                      } else {
                        _emailController.text = '@$value.com'.toLowerCase();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su apellido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cedula de identidad',
                      hintText: '0562818291',
                      prefixIcon: Icon(Icons.numbers),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su cedula de identidad';
                      }
                      // la cedula debe tener 10 digitos solo numeros
                      final cedulaRegex = RegExp(r'^[0-9]{10}$');
                      if (!cedulaRegex.hasMatch(value)) {
                        return 'Por favor ingrese una cedula valida';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // El email se va a autogenerar con el nombre y apellido
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'test@gmail.com',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su email';
                      }
                      // validar si un email contiene @, .com y no tiene espacios
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Por favor ingrese un email valido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            print("OnTap");
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      // validar si un email contiene @, .com y no tiene espacios
                      final passwordRegex = RegExp(r'^.{6,}$');
                      if (!passwordRegex.hasMatch(value)) {
                        return 'Por favor ingrese una contraseña valida, minimo 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      print('Formulario valido');
                      print("PETICION HTTP");
                    },
                    child: const Text('Registrarse'),
                  ),
                  // check
                  //https://flutter.github.io/samples/web/material_3_demo/
                ],
              ),
            ),
            // Uso del Text Field
            // child: Column(
            //   children: [
            //     const SizedBox(height: 20),
            //     const Text('Ingrese sus datos'),
            //     const SizedBox(height: 20),
            //
            //     /// Ingreso de letras
            //     TextField(
            //       decoration: const InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Nombre',
            //         hintText: 'Richar',
            //       ),
            //       onChanged: (value) {
            //         if (_emailController.text.isEmpty) {
            //           _emailController.text = '$value@'.toLowerCase();
            //           return;
            //         }
            //         final currentEmail = _emailController.text.split('@');
            //         if (currentEmail.length == 2) {
            //           _emailController.text =
            //               '$value@${currentEmail[1]}'.toLowerCase();
            //         } else {
            //           _emailController.text = '$value@'.toLowerCase();
            //         }
            //       },
            //     ),
            //     const SizedBox(height: 20),
            //     TextField(
            //         decoration: const InputDecoration(
            //           border: OutlineInputBorder(),
            //           labelText: 'Apellido',
            //           hintText: 'Cangui',
            //         ),
            //         onChanged: (value) {
            //           if (_emailController.text.isEmpty) {
            //             _emailController.text = '@$value.com'.toLowerCase();
            //             return;
            //           }
            //           final currentEmail = _emailController.text.split('@');
            //           if (currentEmail.length == 2) {
            //             _emailController.text =
            //                 '${currentEmail[0]}@$value.com'.toLowerCase();
            //           } else {
            //             _emailController.text = '@$value.com'.toLowerCase();
            //           }
            //         }),
            //     const SizedBox(height: 20),
            //     TextField(
            //       decoration: const InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Cedula de identidad',
            //         hintText: '0562818291',
            //       ),
            //       keyboardType: TextInputType.number,
            //     ),
            //     const SizedBox(height: 20),
            //     // El email se va a autogenerar con el nombre y apellido
            //     TextField(
            //       controller: _emailController,
            //       decoration: const InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Email',
            //         hintText: 'test@gmail.com',
            //       ),
            //     ),
            //     const SizedBox(height: 20),
            //     TextField(
            //       obscureText: true,
            //       decoration: const InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Contraseña',
            //       ),
            //     ),
            //     const SizedBox(height: 20),
            //     ElevatedButton(
            //       onPressed: () {
            //         print(_emailController.text);
            //
            //       },
            //       child: const Text('Registrarse'),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
