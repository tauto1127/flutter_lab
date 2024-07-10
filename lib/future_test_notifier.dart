import 'package:flutter_lab/future_test_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_test_notifier.g.dart';

@riverpod
class FutureTestNotifier extends _$FutureTestNotifier {
  FutureTestNotifier() : super();

  @override
  Future<FutureTestModel> build() async {
    updateAfter(3, FutureTestModel(value: "updated"));
    return FutureTestModel(value: "initial");
  }

  Future<void> updateAfter(int seconds, FutureTestModel model) async {
    state = AsyncLoading();
    await Future.delayed(Duration(seconds: seconds));
    state = AsyncValue.data(model);
  }

  Future<void> updateModel(FutureTestModel model) async {
    state.maybeWhen(
        data: (data) {
          AsyncValue.data(model);
          print("いけった");
        },
        orElse: () => print("だめです！"));
  }
}
