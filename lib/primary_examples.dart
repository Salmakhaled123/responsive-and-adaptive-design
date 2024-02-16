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

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          'Titlte Text ',
          style: TextStyle(
              fontSize: getResponsiveFontSize(
            context,
            fontSize: 20,
          )),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'when you know that all your effort is in the floor you have a big depression ',
          style: TextStyle(
              fontSize: getResponsiveFontSize(
            context,
            fontSize: 16,
          )),
        ),
      ]),
    );
  }

  // scaleFactor
  // responsive fontSize=> calculate it after calculation of scale factor
  // of each platform( mobile- tablet- desktop)
  // min- max size
  double getResponsiveFontSize(BuildContext context,
      {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  double getScaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }
}
