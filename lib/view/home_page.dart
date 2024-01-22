import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:countup_mvvm/view_model/home_page_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homePageState = ref.watch(homePageProvider);
    final _homePageNotifier = ref.watch(homePageProvider.notifier);

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
                  offset: Offset(0, -200.0),
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
              Card(
                color: Colors.blue,
                child: ListTile(
                  title: Text('Main Count +100', style: TextStyle(color: Colors.white)),
                  onTap: _homePageNotifier.increaseMainCount,
                ),
              ),
              Card(
                color: Colors.blue.withOpacity(0.2),
                child: ListTile(
                  title: Text('Main Count -100', style: TextStyle(color: Colors.white)),
                  onTap: _homePageNotifier.decreaseMainCount,
                ),
              ),
              Card(
                color: Colors.cyan,
                child: ListTile(
                  title: Text('Sub Count +1', style: TextStyle(color: Colors.white)),
                  onTap: _homePageNotifier.increaseSubCount,
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Sub Count -1'),
                  onTap: _homePageNotifier.decreaseSubCount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

