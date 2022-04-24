import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      color: Colors.green,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String display = "0";
  String sum = "";

  void changeNumb(String numb) {
    setState(() {
      display += numb;
    });
  }

  void operation(String op) {
    if (op == "=") {
      sum+=display;
      Parser p = Parser();
      Expression exp = p.parse(sum);
      double eval = exp.evaluate(EvaluationType.REAL, new ContextModel());
      setState(() {
        display = eval.toString();
        sum = "";
      });
    }else {
      sum+= display + op;
      setState(() {
        display = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SafeArea(
        child: Container(
      // color: Colors.pink,
      width: double.infinity,
      height: double.infinity,

      // decoration: BoxDecoration(color: Colors.green),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          SizedBox(
              // color: Colors.,
              width: double.infinity,
              height: 200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(display,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    )),
              )),
          const Spacer(),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        display = "";
                        sum = "";
                        // stack = [];
                      });
                    }),
                    child: const Text("AC", style: TextStyle(fontSize: 30)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          if (display[0] == "-") {
                            display = display.split('-')[1];
                          } else {
                            display = "-" + display;
                          }
                        });
                      }),
                      child: const Text("+/-", style: TextStyle(fontSize: 30)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (() {
                        operation("*");
                      }),
                      child: const Text("*", style: TextStyle(fontSize: 30)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width * 0.192),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (() {
                        operation("/");
                      }),
                      child: const Text("/", style: TextStyle(fontSize: 30)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      )),
                ),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("7");
                    }),
                    child: const Text("7", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("8");
                    }),
                    child: const Text("8", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("9");
                    }),
                    child: const Text("9", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width * 0.192),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (() {
                        operation("-");
                      }),
                      child: const Text("-", style: TextStyle(fontSize: 30)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      )),
                ),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("4");
                    }),
                    child: const Text("4", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("5");
                    }),
                    child: const Text("5", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("6");
                    }),
                    child: const Text("6", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width * 0.192),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (() {
                        operation("-");
                      }),
                      child: const Text("-", style: TextStyle(fontSize: 30)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      )),
                ),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("1");
                    }),
                    child: const Text("1", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("2");
                    }),
                    child: const Text("2", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("3");
                    }),
                    child: const Text("3", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width * 0.192),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (() {
                        operation("+");
                      }),
                      child: const Text("+", style: TextStyle(fontSize: 30)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      )),
                ),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 3) * 1.33,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {
                      changeNumb("0");
                    }),
                    child: const Text("0", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    child: const Text(",", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: (width / 5),
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    onPressed: (() {
                      operation("=");
                    }),
                    child: const Text("=", style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
