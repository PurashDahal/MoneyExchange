  // Future<void> saveImagePath(String imagePath) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('imagePath', imagePath);
  // }

  // Future<String?> getImagePath() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('imagePath');
  // }

  // Future<void> pickImage(ImageSource source) async {
  //   final image = await ImagePicker().pickImage(source: source);
  //   if (image == null) return;
  //   final imageTemporary = File(image.path);
  //   print(imageTemporary);
  //   setState(() {
  //     img = imageTemporary;
  //   });

  //   saveImagePath(imageTemporary.path);
  // }