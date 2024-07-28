import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_consultant/bloc/user_signup_cubit.dart';
import 'package:the_consultant/core/function/validinput.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/shared/components/buttonforimage.dart';
import 'package:the_consultant/shared/components/coustemtextboudyauth.dart';
import 'package:the_consultant/shared/components/coustemtextfieldauth.dart';
import 'package:the_consultant/shared/components/coustemtexttilteauth.dart';
import 'package:the_consultant/shared/components/coustmebuttonsauth.dart';
import 'package:the_consultant/shared/components/logoauth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../network/local/cache.dart';
import 'package:the_consultant/layout/home_layout.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  _UserSignUp createState() => _UserSignUp();
}

class _UserSignUp extends State<UserSignUp> {
  var nameController = TextEditingController();
  var walletController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  CacheHelper? prefs;
  File? image;
  final imagepicker = ImagePicker();

  Future uploadImage() async {
    final image = await imagepicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemprorary = File(image.path);
    setState(() {
      this.image = imageTemprorary;
    });
  }
  void initShared() async {
    await CacheHelper.init();

  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    initShared();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();
    loginn() {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        print("valid");
      } else {
        print("not valid");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 70,
        centerTitle: true,
        title:  Text(
          translation(context).signUp,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: BlocProvider<UserSignUpCubit>(
        create: (context) => UserSignUpCubit(),
        child: BlocConsumer<UserSignUpCubit, UserSignUpState>(
            listener: (context, state) {
              if (state is UserSignUpSuccess) {
                CacheHelper.saveData(
                    key: 'token',
                    value: state.data.accessToken);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeLayout()));
              }
            }, builder: (context, state) {
          return

            Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Form(
              key: formstate,
              child: ListView(
                children: [
                  image != null
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 1),
                          padding: EdgeInsets.symmetric(horizontal: 100),
                          child: ClipOval(
                            child: Image.file(image!,
                                width: 100, height: 150, fit: BoxFit.cover),
                          ),
                        )
                      : LogoAuth(),
                  buttonForImage(
                    text: translation(context).uploadImage,
                    onPressed: () => uploadImage(),
                  ),
                  const SizedBox(height: 10),
                   CoustemTextTilteAuth(text: translation(context).newAccount),
                  const CoustemTextBoudyAuth(
                    text:
                        'Sign Up with your name (in Arabic and English) ,email and password ',
                  ),
                  const SizedBox(height: 20),
                  CoustemTextFieldAuth(
                    auto: AutovalidateMode.always,
                    valid: (val) {
                      return validinput(val!, 3, 20, "name");
                    },
                    hintText: translation(context).nameHintA,
                    iconData: Icons.person_outlined,
                    labelText: translation(context).nameA,
                  ),
                  CoustemTextFieldAuth(
                    mycontroller: nameController,
                    auto: AutovalidateMode.always,
                    valid: (val) {
                      return validinput(val!, 3, 20, "name");
                    },
                    hintText: translation(context).nameHintE,
                    iconData: Icons.person_outlined,
                    labelText: translation(context).nameE,
                  ),
                  CoustemTextFieldAuth(
                    mycontroller: emailController,
                    auto: AutovalidateMode.always,
                    valid: (val) {
                      return validinput(val!, 5, 100, "email");
                    },
                    hintText: translation(context).emailHint,
                    iconData: Icons.email_outlined,
                    labelText: translation(context).email,
                  ),
                  CoustemTextFieldAuth(
                    auto: AutovalidateMode.always,
                    valid: (val) {
                      return validinput(val!, 5, 30, "password");
                    },
                    mycontroller: passController,
                    hintText: translation(context).passwordHint,
                    iconData: Icons.lock_outlined,
                    labelText: translation(context).password,
                    obscureText: true,
                  ),
                  CoustemTextFieldAuth(
                    mycontroller: walletController,
                    auto: AutovalidateMode.always,
                    valid: (val) {
                      return validinput(val!, 5, 30, "wallet");
                    },
                    hintText: translation(context).walletHint,
                    iconData: Icons.attach_money_outlined,
                    labelText: translation(context).wallet,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  const SizedBox(height: 20),
                  CoustemButtonAuth(
                    text: translation(context).next,
                    onPressed: () {
                      UserSignUpCubit.get(context).UserSignUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passController.text,
                        wallet: walletController.text,

                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
