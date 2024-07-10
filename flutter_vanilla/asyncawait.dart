Future<void> main() async {
  print(await waitSeconds(1));
}

Future<int> waitSeconds(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  return seconds;
}
