import 'package:flutter/material.dart';
import 'package:the_consultant/core/function/validinput.dart';
import 'package:the_consultant/core/styles/colors.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/shared/components/buttonforimage.dart';
import 'package:the_consultant/shared/components/coustemtextfieldauth.dart';
import 'package:the_consultant/shared/components/coustmebuttonsauth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
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

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBlueColor,
        centerTitle: true,
        title: const Text("Edit Profile"),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Form(
          key: formstate,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: const ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(300),
                                      bottomRight: Radius.circular(300)))),

                          child: Container(
                            height: 200,
                            color: kBlueColor,
                          ),

                        ),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              image != null
                                  ? Container(

                                margin: const EdgeInsets.symmetric(horizontal: 100),
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: ClipOval(
                                        child:Image.file(image!,
                                            width: 190,
                                            height: 180,

                                            fit: BoxFit.cover),
                                      ),
                                    )
                                  : Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 300,
                                            width: 175,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 5),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/p1.png"),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 70),
                child: buttonForImage(
                  text: translation(context).uploadImage,
                  onPressed: () => uploadImage(),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 3, 20, "name");
                  },
                  hintText: "",
                  iconData: Icons.person_outlined,
                  labelText: translation(context).nameA,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 3, 20, "name");
                  },
                  hintText: "",
                  iconData: Icons.person_outlined,
                  labelText: translation(context).nameE,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 5, 100, "email");
                  },
                  hintText: "",
                  iconData: Icons.email_outlined,
                  labelText: translation(context).email,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 5, 30, "password");
                  },
                  hintText: "",
                  iconData: Icons.lock_outlined,
                  labelText: translation(context).password,
                  obscureText: true,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 5, 20, "Address");
                  },
                  hintText: "",
                  iconData: Icons.home_outlined,
                  labelText: translation(context).address,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 10, 10, "Phone Number");
                  },
                  hintText: "",
                  iconData: Icons.phone,
                  labelText: translation(context).number,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 20, 100, "Experience");
                  },
                  hintText: "",
                  iconData: Icons.info_outline,
                  labelText: translation(context).experiences,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 20, 40, "Days");
                  },
                  hintText: "",
                  iconData: Icons.calendar_view_week,
                  labelText: translation(context).availableDays,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemTextFieldAuth(
                  auto: AutovalidateMode.always,
                  valid: (val) {
                    return validinput(val!, 20, 40, "Consulting");
                  },
                  hintText: " ",
                  iconData: Icons.question_answer,
                  labelText: translation(context).consulting,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: CoustemButtonAuth(
                  text: translation(context).save,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
