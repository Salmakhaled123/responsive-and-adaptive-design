import 'package:flutter/material.dart';

class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 250,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: const Column(children: [
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.orange,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class DeskTopLayout2 extends StatefulWidget {
  const DeskTopLayout2({Key? key}) : super(key: key);

  @override
  State<DeskTopLayout2> createState() => _DeskTopLayoutState();
}

class FlexibleTest extends StatefulWidget {
  const FlexibleTest({Key? key}) : super(key: key);

  @override
  State<FlexibleTest> createState() => _FlexibleTestState();
}

class _FlexibleTestState extends State<FlexibleTest> {
  var imageUrls = [
    'https://images6.fanpop.com/image/photos/38100000/Cinderella-New-Dress-cinderella-2015-38179912-882-907.jpg',
    'https://images6.fanpop.com/image/photos/38100000/Cinderella-New-Dress-cinderella-2015-38179912-882-907.jpg',
    'https://images6.fanpop.com/image/photos/38100000/Cinderella-New-Dress-cinderella-2015-38179912-882-907.jpg',
    'https://images6.fanpop.com/image/photos/38100000/Cinderella-New-Dress-cinderella-2015-38179912-882-907.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) =>
              FittedBox(child: Image.network(imageUrls[index]))),
    );
  }
}

class _DeskTopLayoutState extends State<DeskTopLayout2> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      number = index + 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    color: Colors.yellow,
                    child: ListTile(
                      title: Text('${index + 1}'),
                    ),
                  ),
                );
              },
              itemCount: 10),
        ),
        Expanded(
            child: Center(
          child: Text(number.toString()),
        ))
      ],
    );
  }
}

class MobileLayout2 extends StatelessWidget {
  const MobileLayout2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => DetailsView(number: index + 1)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              color: Colors.teal,
              child: ListTile(
                title: Text('${index + 1}'),
              ),
            ),
          );
        },
        itemCount: 10);
  }
}

class DetailsView extends StatelessWidget {
  final int number;
  const DetailsView({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        number.toString(),
      )),
    );
  }
}
