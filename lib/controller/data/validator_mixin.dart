mixin ValidatorMixin {
  String? combvalidator({required List<String? Function()> validator}) {
    for (var func in validator) {
      // final validation = func();

      if (func() != null) return func();
    }
    return null;
  }

  String? isempyt({required String? value, required String? msg}) {
    if (value!.isEmpty) return msg ?? 'O campo precisa ser Prenenchido';
    return null;
  }

  String? iseminLenth(
      {required String? value, required String? msg, required int lenth}) {
    if (value!.length < lenth) return msg ?? 'Valor precisa ser Maior';
    return null;
  }

  String? isContainNuber({required String? value, required String? msg}) {
    final number = value!.split('');

    for (var item in number) {
      if (item.contains(RegExp(r'[0-9]'))) {
        return msg ?? 'VAmos lá, Ultilize apenas letras!';
      }
    }
    return null;
  }

  String? isContaintext({required String? value, required String? msg}) {
    final name = value!.split('');

    for (var item in name) {
      if (item.contains(RegExp(r'[A-Z|a-z]'))) {
        return msg ?? 'Vamos lá, Ultilize apenas Numeros!';
      }
    }
    return null;
  }

  isnumbervlidate({required String? value, required String? msg}) {
    // ignore: unnecessary_string_escapes
    if (RegExp('^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}')
        .hasMatch(value!)) {
      return null;
    } else {
      return msg ?? 'Informe um numero valido';
    }
  }

  isEmailvalidate({required String? value, required String? msg}) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value!)) {
      return null;
    } else {
      return msg ?? 'Isira um email valido';
    }
  }
}
