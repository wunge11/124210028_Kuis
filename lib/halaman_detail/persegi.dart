import 'package:flutter/material.dart';
import 'bentuk.dart';

class Persegi extends Bentuk {
  const Persegi({
    Key? key,
    required String name,
    required String image,
  }) : super(key: key, name: name, image: image);

  @override
  State<Persegi> createState() => _PersegiState();
}

class _PersegiState extends State<Persegi> {
  late double sisi1 = 0;
  late double sisi2 = 0;
  late double luas = 0;
  late double keliling = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                CardHalamanDetail(image: widget.image, name: widget.name),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      sisi1 = double.parse(value);
                    },
                    decoration: InputDecoration(
                      labelText: "Sisi 1",
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      sisi2 = double.parse(value);
                    },
                    decoration: InputDecoration(
                      labelText: "Sisi 2",
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      luas = 0;
                      keliling = 0;

                      keliling = 2 * (sisi1 + sisi2);
                      luas = sisi1 * sisi2;
                    });
                  },
                  child: Text(
                    "Hitung",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
              ],
            ),
          )
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
