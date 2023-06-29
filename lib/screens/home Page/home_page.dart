import 'dart:io';

import 'package:contact_list/controllers/homecontroller.dart';
import 'package:contact_list/screens/editing%20contact/editing_contact.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../new_contatact/new_contact.dart';

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
    _controller.getcontacts();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.12,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    // textAlign: TextAlign.end,
                    "Contatos",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        // NewContactController().getImage();
                      },
                      icon: Icon(
                        Icons.menu_rounded,
                        size: width * 0.08,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _controller,
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        var data = value;
                        return ListTile(
                          onLongPress: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditingContact(
                                      image: XFile(data[index].image),
                                      name: data[index].name,
                                      number: data[index].number,
                                      email: data[index].email),
                                ))
                          },
                          leading: CircleAvatar(
                            backgroundImage: FileImage(File(data[index].image)),
                          ),
                          title: Text(data[index].name),
                          subtitle: Text(data[index].number),
                          trailing: const Icon(Icons.call),
                        );
                      });
                },
              ),
            )
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
