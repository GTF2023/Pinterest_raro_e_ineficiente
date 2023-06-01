import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fijate',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/segunda': (context) => const SegundaPagina(),
        '/favoritos': (context) => const Favoritos(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('')),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            textSection,
            titleSection,
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/segunda');
                },
                child: const Text('data')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/favoritos');
                },
                child: const Text('Favoritos'))
          ],
        ));
  }
}

class SegundaPagina extends StatelessWidget {
  const SegundaPagina({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('fua'),
        ),
        body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(26, (index) {
              var i = 1 + Random().nextInt(4 - 1);
              return Center(
                  child: SizedBox(
                      height: (MediaQuery.of(context).size.height),
                      width: (MediaQuery.of(context).size.width),
                      child: Card(
                        color: Colors.amber,
                        child: OpenContainer(
                          closedBuilder:
                              ((context, VoidCallback openContainer) {
                            return Scaffold(
                              body: //Text('$index'),
                                  Image.asset(
                                'images/$i.jpg',
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                          openBuilder: (context, VoidCallback _) {
                            //var i = 1 + Random().nextInt(3 - 1);
                            /*almacenarFavoritos almacenar;
                            almacenar = almacenarFavoritos(i);*/
                            almacenarIndex(i);
                            return Scaffold(
                              floatingActionButton: const botonFavorito(),
                              appBar: AppBar(title: const Text('')),
                              body: Image.asset(
                                'images/$i.jpg',
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      )));
            })));
  }
}

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(50),
  child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Rio mas grande de madagascar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            const Text('lago secundario'),
          ],
        ),
      ]),
);
Widget textSection = Container(
    padding: const EdgeInsets.all(30),
    child: const Center(
      child: Text(
          'En esta aplicacion podrás ver todos los difrentes cuerpos de agua cercanos a ti y como llegar a estos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          )),
    ));

class botonFavorito extends StatefulWidget {
  const botonFavorito({super.key});
  @override
  State<botonFavorito> createState() => _botonFavoritoState();
}

class _botonFavoritoState extends State<botonFavorito> {
  static bool favorito = false;
  static bool getState() {
    return favorito;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        isFavorito();
        //almacenarFavoritos.setFav(true);
      },
      child: (favorito
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_outline)),
    );
  }

  void isFavorito() {
    setState(() {
      if (favorito == true) {
        favorito = false;
        //almacenarFavoritos();
      } else {
        favorito = true;
      }
    });
  }
}

void almacenarIndex(int i) {
  int index;
  index = i;
}

/*class almacenarFavoritos {
  late int index;
  static bool fav = false;
  static List<String> ImagenesFavoritas = [];
  almacenarFavoritos(int indexe) {
    index = indexe;
  }

  int getIndex() {
    return index;
  }

  String getImagen() {
    String Imagen = 'images/$index.jpg';
    return Imagen;
  }

  bool isFav() {
    if (fav == true) {
      ImagenesFavoritas.add('images/$index.jpg');
    }
    return fav;
  }

   static void setFav(bool fave) {
    if (fav == true) {
      ImagenesFavoritas.add('images/$index.jpg');
    }
    fav = fave;
  }

  List getImagenesFavoritas() {
    return ImagenesFavoritas;
  }
}
*/