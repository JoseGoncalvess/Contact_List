import 'package:flutter/material.dart';
import '../../../controller/data/share_prefs.dart';
import '../home_page_controller.dart';
import '../../../models/contact_model.dart';

class FavorShowdailog {
  Future favorShowdailog({
    required BuildContext context,
    required String name,
    required String number,
    required String email,
    required String image,
  }) {
    final _controller = Homecontroller();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.green,
        title: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        content: Text(
          textAlign: TextAlign.center,
          'O contato $name foi adiconando aos favoritos!',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar")),
          ElevatedButton(
              onPressed: () {
                _controller.savecontact(
                  key: keyFavorList,
                  contact: ContactModel(
                      name: name, email: email, number: number, image: image),
                );
                Navigator.pop(context);
              },
              child: const Text("Favoritar"))
        ],
      ),
    );
  }
}
