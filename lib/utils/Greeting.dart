// ignore_for_file: file_names

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 11) {
    return 'Selamat Pagi';
  } else if (hour < 15) {
    return 'Selamat Siang';
  } else if (hour < 18) {
    return 'Selamat Sore';
  } else if (hour < 24) {
    return 'Selamat Malam';
  }
  return 'Selamat Pagi';
}
