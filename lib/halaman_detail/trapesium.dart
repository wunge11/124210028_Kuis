import 'package:flutter/material.dart';
import 'bentuk.dart';

class Trapesium extends Bentuk {
  const Trapesium({Key? key, required String name, required String image})
      : super(key: key, name: name, image: image);

  @override
  State<Trapesium> createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  late double ab = 0;
  late double dc = 0;
  late double t = 0;
  late double sisi1 = 0;
  late double sisi2 = 0;
  late double sisi3 = 0;
  late double sisi4 = 0;
  late double luas = 0;
  late double keliling = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                CardHalamanDetail(image: widget.image, name: widget.name),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      ab = double.parse(value);
                    },
                    decoration: const InputDecoration(labelText: "AB"),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      dc = double.parse(value);
                    },
                    decoration: const InputDecoration(labelText: "DC"),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      t = double.parse(value);
                    },
                    decoration: const InputDecoration(labelText: "Tinggi"),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      sisi1 = double.parse(value);
                    },
                    decoration: const InputDecoration(labelText: "Sisi 1"),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      sisi2 = double.parse(value);
                    },
                    decoration: const InputDecoration(labelText: "Sisi 2"),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      sisi3 = double.parse(value);
                    },
                    decoration: const InputDecoration(labelText: "Sisi 3"),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      keliling = 0;
                      luas = 0;
                      keliling = sisi1 + sisi2 + sisi3 + sisi4;
                      luas = 0.5 * t * (ab + dc);
                    });
                  },
                  child: const Text("Hitung"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text("Hasil")),
                        DataColumn(label: Text("Nilai")),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("Luas")),
                          DataCell(Text("$luas")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Keliling")),
                          DataCell(Text("$keliling")),
                        ]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardHalamanDetail extends StatelessWidget {
  const CardHalamanDetail({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            SizedBox(height: 200, width: 200, child: Image.network(image)),
            Text(
              name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
