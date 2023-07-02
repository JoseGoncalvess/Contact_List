import 'dart:io';
import 'package:contact_list/controllers/homecontroller.dart';
import 'package:contact_list/controllers/data/share_prefs.dart';
import 'package:contact_list/models/contact_model.dart';
import 'package:contact_list/screens/editing%20contact/editing_contact.dart';
import 'package:contact_list/screens/widgets/favor_showdailog.dart';
import 'package:contact_list/screens/widgets/show_dailog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../new_contatact/new_contact.dart';
import '../widgets/app_custom_bar.dart';
import '../widgets/list_contact.dart';
import '../widgets/list_isempt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Homecontroller();

  @override
  void initState() {
    super.initState();
    _controller.drop.addListener(() {
      setState(() {});
    });
    _controller.listselect.addListener(() {
      setState(() {});
    });
    _controller.getcontacts(key: keylist);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Column(
              children: [
                AppCustomBar(
                  onpressd: () =>
                      _controller.drop.value = !_controller.drop.value,
                ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: _controller,
                    builder: (context, value, child) {
                      List<ContactModel> data = value;
                      return data.isEmpty
                          ? const ListIsempt()
                          : ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: Key(index.toString()),
                                  direction: DismissDirection.endToStart,
                                  confirmDismiss: (direction) async {
                                    return await ShowDailog().showdailogg(
                                        context: context,
                                        contact: data[index].name,
                                        page: MaterialPageRoute(
                                          builder: (context) => EditingContact(
                                              index: index,
                                              image: XFile(data[index].image),
                                              name: data[index].name,
                                              number: data[index].number,
                                              email: data[index].email),
                                        ));
                                  },
                                  background: Container(
                                    width: 100,
                                    height: 100,
                                    alignment: Alignment.centerRight,
                                    color: Colors.green[900],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.perm_contact_calendar_rounded,
                                        color: Colors.white,
                                        size: width * 0.1,
                                      ),
                                    ),
                                  ),
                                  onDismissed: (direction) =>
                                      _controller.deletcontatc(
                                    key: _controller.listselect.value == true
                                        ? keyFavorList
                                        : keylist,
                                    index: index,
                                  ),
                                  child: ListTile(
                                    onLongPress: () => {
                                      _controller.listselect.value
                                          ? null
                                          : FavorShowdailog().favorShowdailog(
                                              context: context,
                                              name: data[index].name,
                                              email: data[index].email,
                                              image: data[index].image,
                                              number: data[index].number)
                                    },
                                    leading: data[index].image.length == 2
                                        ? CircleAvatar(
                                            radius: 30,
                                            child: Text(data[index].image))
                                        : CircleAvatar(
                                            radius: 30,
                                            backgroundImage: FileImage(
                                              File(data[index].image),
                                              scale: 2,
                                            ),
                                          ),
                                    title: Text(
                                      data[index].name,
                                      style: TextStyle(
                                          color: Colors.green[800],
                                          fontSize: height * 0.022,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(data[index].number,
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: height * 0.022,
                                            fontWeight: FontWeight.w400)),
                                    visualDensity:
                                        VisualDensity.adaptivePlatformDensity,
                                    dense: true,
                                    focusColor: Colors.greenAccent,
                                    trailing: const Icon(Icons.call),
                                  ),
                                );
                              });
                    },
                  ),
                )
              ],
            ),
            Positioned(
                top: 100,
                right: _controller.drop.value ? 0 : -200,
                child: ListContact(
                  favorpress: () {
                    _controller.getcontacts(key: keyFavorList);
                    _controller.drop.value = !_controller.drop.value;
                    _controller.listselect.value = true;
                  },
                  geralPress: () {
                    _controller.getcontacts(key: keylist);
                    _controller.drop.value = !_controller.drop.value;
                    _controller.listselect.value = false;
                  },
                  activi: _controller.drop.value,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewContact(),
                ));
          },
          child: const Icon(
            Icons.add_call,
            color: Colors.white,
          )),
    );
  }
}
