import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:countup_mvvm/view_model/home_page_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state（状態）
    final _homePageState = ref.watch(homePageProvider);
    // provider（状態の操作）
    final _homePageNotifier = ref.watch(homePageProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter COUNT UP MVVM')),
      floatingActionButton: FloatingActionButton(
        onPressed: _homePageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true, // 追加
          children: [
            ListTile(
              title: Text(
                '${_homePageState.mainCount}  :  ${_homePageState.subCount}',
                style: const TextStyle(
                  fontSize: 80.0, // Set text size to 50dp
                  fontFamily: 'Gothic', // Set font family to Gothic
                  color: Colors.blue, // Set text color to blue
                ),
              ),
            ),
            ListTile(
              title: Text('Main Count +100'),
              onTap: _homePageNotifier.increaseMainCount,
              tileColor: Colors.blue,
            ),
            ListTile(
              title: Text('Main Count -100'),
              onTap: _homePageNotifier.decreaseMainCount,
            ),
            ListTile(
              title: Text('Sub Count +1'),
              onTap: _homePageNotifier.increaseSubCount,
              tileColor: Colors.cyan,
            ),
            ListTile(
              title: Text('Sub Count -1'),
              onTap: _homePageNotifier.decreaseSubCount,
            ),
          ],
        ),
      ),
    );
  }
}
