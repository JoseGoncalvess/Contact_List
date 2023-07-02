import 'package:contact_list/controllers/data/validator_mixin.dart';
import 'package:contact_list/controllers/homecontroller.dart';
import 'package:contact_list/controllers/new_contact_controller.dart';
import 'package:contact_list/controllers/data/share_prefs.dart';
import 'package:contact_list/screens/home%20Page/home_page.dart';
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

class _NewContactState extends State<NewContact> with ValidatorMixin {
  final _controller = Homecontroller();
  final _newconroller = NewContactController();
  final GlobalKey<FormState> _keyState = GlobalKey<FormState>();

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

  String? teste({required String value}) {
    if (value.isEmpty) {
      return 'verifique o nome';
    }
    return null;
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
          color: Colors.greenAccent.withOpacity(0.6),
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      child: GestureDetector(
                          onTap: () => {
                                _newconroller.onfile.value =
                                    !_newconroller.onfile.value
                              },
                          child: _newconroller.value == null
                              ? CircleAvatar(
                                  radius: width * 0.2,
                                  backgroundImage:
                                      const AssetImage("assets/user.png"),
                                )
                              : CustomProfile(
                                  arquivo: _newconroller.value!,
                                )),
                    ),
                    Container(
                      width: width,
                      height: height * 0.597,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Form(
                        onChanged: () => _keyState.currentState!.validate(),
                        key: _keyState,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.08,
                            ),
                            Customfild(
                              validator: (value) => combvalidator(validator: [
                                () => isempyt(
                                    value: value,
                                    msg: 'Por favor não deixe o campo Vazio!'),
                                () => isContainNuber(
                                    value: value,
                                    msg: 'Ultilize apenas Letras'),
                                () => iseminLenth(
                                    lenth: 3,
                                    msg: 'Digite u nome maior',
                                    value: value)
                              ]),
                              typekeybord: TextInputType.name,
                              prefixicons: Icons.person,
                              controller: nameController,
                              label: "Nome",
                            ),
                            Customfild(
                              typekeybord: TextInputType.phone,
                              validator: (value) => combvalidator(validator: [
                                () => isempyt(
                                    value: value,
                                    msg: 'Por favor não deixe o campo Vazio!'),
                                () => isContaintext(
                                    value: value,
                                    msg: 'Ultilize apenas numeros!'),
                                () => isnumbervlidate(
                                    msg:
                                        'Digite um numero valido(xx) x - xxxx-xxxx',
                                    value: value)
                              ]),
                              prefixicons: Icons.phone,
                              controller: numberController,
                              label: "Numero",
                            ),
                            Customfild(
                              validator: (value) => combvalidator(validator: [
                                () => isempyt(
                                    value: value,
                                    msg: 'Por favor não deixe o campo Vazio!'),
                                () => isEmailvalidate(
                                    msg: 'Ensire um email valido', value: value)
                              ]),
                              typekeybord: TextInputType.emailAddress,
                              prefixicons: Icons.email,
                              controller: emailController,
                              label: "E-mail",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: _newconroller.onfile.value ? 535 : 1000,
                    child: AnimatedContainer(
                      width: width,
                      height: height * 0.24,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutSine,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22))),
                      child: SingleChildScrollView(
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
                    ))
              ],
            ),
          )),
      floatingActionButton: _newconroller.onfile.value
          ? Container()
          : AnimatedContainer(
              width: width * 0.17,
              height: height * 0.08,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  if (_keyState.currentState!.validate()) {
                    _controller.savecontact(
                      key: keylist,
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
                  }
                },
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                  size: height * 0.05,
                ),
              ),
            ),
    );
  }
}
