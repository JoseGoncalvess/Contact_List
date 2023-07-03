class UserPerfil {
  String name = '';

  getNameUser({required String name}) {
    var listname = name.split(' ');
    if (listname.length >= 2) {
      name = listname[0][0] + listname[1][0].toUpperCase();
    } else {
      name = listname[0][0] + listname[0][1].toUpperCase();
    }
    return name;
  }
}
