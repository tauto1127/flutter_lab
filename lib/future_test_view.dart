import 'package:flutter/material.dart';
import 'package:flutter_lab/future_test_model.dart';
import 'package:flutter_lab/future_test_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureTest extends StatelessWidget {
  const FutureTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (BuildContext context, WidgetRef ref, _) {
        var state = ref.watch(futureTestNotifierProvider);
        return Column(
          children: [
            state.maybeWhen(
                data: (data) => Text(data.value),
                orElse: () => const Text("loading...")),
            TextButton(
              onPressed: () {
                ref
                    .read(futureTestNotifierProvider.notifier)
                    .updateModel(FutureTestModel(value: "konnnitiwa"));
              },
              child: const Text("update"),
            ),
            TextButton(
                child: const Text("loading状態にしてやる"),
                onPressed: () => ref
                    .read(futureTestNotifierProvider.notifier)
                    .updateAfter(3, FutureTestModel(value: "updated"))),
          ],
        );
      }),
    );
  }
}
