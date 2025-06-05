import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _trabajadorIdController = TextEditingController();
  final _trabajadorController = TextEditingController();
  final _trabajadorDesController = TextEditingController();
  final _trabajadorTelController = TextEditingController();
  final _trabajadorCorreoController = TextEditingController();
  final _trabajadorHoraController = TextEditingController();
  final _trabajadorEmpController = TextEditingController();

  @override
  void dispose() {
    _trabajadorController.dispose();
    _trabajadorDesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 79, 124, 223),
            title: const Text("Form Tabla trabajador"),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              MyTextField(
                  myController: _trabajadorIdController,
                  fieldName: "Id trabajador",
                  myIcon: Icons.numbers,
                  prefixIconColor: const Color.fromARGB(255, 98, 129, 231)),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _trabajadorController,
                  fieldName: "Nombre trabajador",
                  myIcon: Icons.account_balance,
                  prefixIconColor: const Color.fromARGB(255, 117, 158, 205)),
              const SizedBox(height: 10.0),
              //Use to add space between Textfields
              MyTextField(
                  myController: _trabajadorDesController,
                  fieldName: "Apellido trabajador ",
                  prefixIconColor: const Color.fromARGB(255, 117, 158, 205)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _trabajadorTelController,
                  fieldName: "Teléfono ",
                  prefixIconColor: const Color.fromARGB(255, 117, 158, 205)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _trabajadorCorreoController,
                  fieldName: "Direccion ",
                  prefixIconColor: const Color.fromARGB(255, 117, 158, 205)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _trabajadorHoraController,
                  fieldName: "Edad ",
                  prefixIconColor:const Color.fromARGB(255, 117, 158, 205)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _trabajadorEmpController,
                  fieldName: "Años de experiencia",
                  prefixIconColor: const Color.fromARGB(255, 117, 158, 205)),
              const SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              trabajadorId: _trabajadorIdController.text,
              trabajadorName: _trabajadorController.text,
              trabajadorDescription: _trabajadorDesController.text,
              trabajadorTel: _trabajadorTelController.text,
              trabajadorCorreo: _trabajadorCorreoController.text,
              trabajadorHora: _trabajadorHoraController.text,
              trabajadorEmp: _trabajadorEmpController.text,
              
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 75, 148, 231)),
      ),
    );
  }
}

//Custom STateless WIdget Class that helps re-usability
// You can learn it in Tutorial (2.13) Custom Widget in Flutter
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 117, 155, 205)),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 58, 98, 183))),
    );
  }
}