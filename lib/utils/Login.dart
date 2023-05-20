// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonapp/modules/controllers/GlobalController.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _globalKey = GlobalKey<FormState>();
  final gController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return SizedBox(
        width: 350,
        height: 200,
        child: Image.asset('assets/images/pokemon.png'),
      );
    }

    Widget formList() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: Form(
          key: _globalKey,
          child: TextFormField(
            controller: gController.textController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.green),
              ),
              floatingLabelStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
              labelText: 'Masukkan Nama',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                Fluttertoast.showToast(
                  msg: 'Gagal',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16,
                );
                return 'Nama harus diisi ngab';
              } else {
                return null;
              }
            },
          ),
        ),
      );
    }

    Widget loginbutton() {
      return Container(
        width: 200,
        height: 45,
        margin: const EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: () {
            if (_globalKey.currentState!.validate()) {
              Navigator.pushReplacementNamed(context, '/main');
              Fluttertoast.showToast(
                msg: 'Berhasil Masuk',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16,
              );
            }
          },
          child: Text(
            'Login',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget prolog() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 45,
          vertical: 10,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          'Login',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(),
                prolog(),
                formList(),
                loginbutton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
