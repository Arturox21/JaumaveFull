import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mave/paginas/contactos.dart';
import 'package:mave/paginas/favoritos.dart';
import 'package:mave/paginas/negocios.dart';
import 'package:mave/paginas/principal.dart';
import 'package:mave/paginas/eventos.dart';
import 'package:mave/widgets/navigation_drawer_widget.dart';
//import 'package:mave/widgets/shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  final List<Widget> _pages = [
    Userprincipal(),
    const Usereventos(),
    const Userfavorites(),
    const Usercontactos(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: _pages[_selectedIndex],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Jaumave Tamaulipas'.toUpperCase(),
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              showSearch(context: context, delegate: NegociosSearchDelegate());
            },
          ),
        ],
      ),
      // ignore: prefer_const_constructors
      drawer: NavigationDrawerWidget(),

      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.purple,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: screenWidth * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == _selectedIndex ? screenWidth * .12 : 0,
                      width: index == _selectedIndex ? screenWidth * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == _selectedIndex
                            ? Colors.purpleAccent.withOpacity(.5)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    data[index],
                    size: screenWidth * .076,
                    color: index == _selectedIndex
                        ? Color.fromARGB(255, 240, 152, 181)
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<IconData> data = [
  Icons.home,
  Icons.calendar_month,
  Icons.favorite,
  Icons.call,
];

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Drawer(
        child: Icon(Icons.menu_book_rounded),
      );
}
