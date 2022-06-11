import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${S.of(context).language}: '),
                DropdownButton(
                    value: Intl.getCurrentLocale(),
                    items: [
                      DropdownMenuItem(
                          value: 'en', child: Text(S.of(context).english)),
                      DropdownMenuItem(
                          value: 'ru_RU', child: Text(S.of(context).russian))
                    ],
                    onChanged: (value) async {
                      if (value == 'ru_RU') {
                        await S.load(const Locale('ru', 'RU'));
                        setState(() {});
                      } else if (value == 'en') {
                        await S.load(const Locale('en'));
                        setState(() {});
                      }
                    })
              ],
            ),
            Column(
              children: [
                Text(
                  S.of(context).counterValue,
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: _incrementCounter,
                  color: Colors.blue,
                  child: const Icon(Icons.add, color: Colors.white,),
                ),
                MaterialButton(
                  onPressed: _decrementCounter,
                  color: Colors.blue,
                  child: const Icon(Icons.remove, color: Colors.white,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
