import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:countup_mvvm/view_model/home_page_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homePageState = ref.watch(homePageProvider);
    final _homePageNotifier = ref.watch(homePageProvider.notifier);

    // Function to check whether the button should be enabled
    bool isIncrementButtonEnabled(int threshold) {
      return _homePageState.mainCount < threshold;
    }

    bool isDecrementButtonEnabled(int threshold) {
      return _homePageState.mainCount > threshold;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter COUNT UP MVVM')),
      floatingActionButton: FloatingActionButton(
        onPressed: _homePageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2017/10/01/18/47/trimaran-2806616_1280.jpg', // 画像のURLを指定
            ),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Transform.translate(
                  offset: const Offset(0, -200.0),
                  child: Text(
                    '${_homePageState.mainCount}  :  ${_homePageState.subCount}',
                    style: const TextStyle(
                      fontSize: 80.0,
                      fontFamily: 'Gothic',
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:  isIncrementButtonEnabled(130)
                    ? () => _homePageNotifier.increaseMainCount()
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.withOpacity(0.5), // ボタンの背景色
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Main +10',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:   isDecrementButtonEnabled(-30)
                    ? () => _homePageNotifier.decreaseMainCount()
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.withOpacity(0.2), // ボタンの背景色
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Main -10',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _homePageNotifier.increaseSubCount,
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.withOpacity(0.5), // ボタンの背景色
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Sub +1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _homePageNotifier.decreaseSubCount,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.2), // ボタンの背景色
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Sub -1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
