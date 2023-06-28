import 'package:contact_list/controllers/homecontroller.dart';
import 'package:contact_list/controllers/new_contact_controller.dart';
import 'package:contact_list/screens/home_page.dart';
import 'package:flutter/material.dart';
import '../../models/contact_model.dart';
import '../widgets/buttom_widget.dart';
import '../widgets/custom_profile.dart';
import '../widgets/customfild.dart';

class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final _controller = Homecontroller();
  final _newconroller = NewContactController();

  ValueNotifier<String> title = ValueNotifier<String>('Novo Contato');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _newconroller.onfile.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: width * 0.1,
            )),
        title: Text(
          title.value,
          style: TextStyle(
              fontSize: height * 0.026,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.34,
                color: Colors.greenAccent.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () => {
                              _newconroller.onfile.value =
                                  !_newconroller.onfile.value
                            },
                        child: _newconroller.value == null
                            ? CircleAvatar(
                                radius: width * 0.2,
                                backgroundImage: AssetImage("assets/user.png"),
                              )
                            : CustomProfile(
                                arquivo: _newconroller.value!,
                              )
                        // : CustomProfile(arquivo: _newconroller.value),
                        )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Customfild(
                      controller: nameController,
                      label: "Nome",
                    ),
                    Customfild(
                      controller: numberController,
                      label: "Numero",
                    ),
                    Customfild(
                      controller: emailController,
                      label: "E-mail",
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                width: width,
                height: _newconroller.onfile.value ? height * 0.24 : 0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Vamos escolher uma foto!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtomWidget(
                          onfile: _newconroller.onfile.value,
                          icon: Icons.attach_file_rounded,
                          nameFunction: "Selecionar arquivo",
                          onpressed: () {
                            _newconroller.getImageFile();
                          },
                        ),
                        ButtomWidget(
                          onfile: _newconroller.onfile.value,
                          icon: Icons.camera_alt_rounded,
                          nameFunction: "Tira uma Foto",
                          onpressed: () {
                            _newconroller.getImagePhoto();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: _newconroller.onfile.value
          ? Container()
          : AnimatedContainer(
              width: width * 0.2,
              height: height * 0.1,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  _controller.savecontact(
                    contact: ContactModel(
                        name: nameController.text,
                        email: emailController.text,
                        number: numberController.text,
                        image: _newconroller.getprofile(
                            aquivo: _newconroller.value,
                            nameController: nameController)),
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                  size: height * 0.07,
                ),
              ),
            ),
    );
  }
}
