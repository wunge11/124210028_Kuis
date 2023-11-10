import 'package:flutter/material.dart';
import 'halaman_detail/bentuk.dart';
import 'halaman_detail/lingkaran.dart';
import 'halaman_detail/persegi.dart';
import 'halaman_detail/segitiga.dart';
import 'halaman_detail/trapesium.dart';

class BangunRuang extends StatelessWidget {
  const BangunRuang({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        MenuCard(
          bangunRuang: Lingkaran(
            name: "Lingkaran",
            image:
            "https://media.istockphoto.com/id/1349357778/id/vektor/lingkaran-merah-melarang-simbol-tanda-jalan-kosong.jpg?s=612x612&w=0&k=20&c=F1QxmttDbbKD2yIQCiXjjVbIunSXleIiXrqLjAI4YiE=",
          ),
        ),
        MenuCard(
          bangunRuang: Persegi(
            name: "Persegi",
            image:
            "https://emojigraph.org/media/joypixels/large-red-square_1f7e5.png",
          ),
        ),
        MenuCard(
          bangunRuang: Trapesium(
            image:
            "https://imgix2.ruangguru.com/assets/miscellaneous/png_foxndy_2895.png",
            name: "Trapesium",
          ),
        ),
        MenuCard(
          bangunRuang: Segitiga(
            image:
            "https://w7.pngwing.com/pngs/572/973/png-transparent-red-triangle-right-triangle-red-triangle-angle-photography-triangle-thumbnail.png",
            name: "Segitiga",
          ),
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.bangunRuang});
  final Bentuk bangunRuang;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return bangunRuang;
        }));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(20.0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipOval(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  color: Colors.blue,
                  child: Image.network(
                    bangunRuang.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                bangunRuang.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
