import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioApp(),
    );
  }
}

class PortfolioApp extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text('My Portfolio'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomeTab(),
          ProjectsTab(),
          ContactTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.greenAccent[50],
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.greenAccent.withOpacity(0.8),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_sharp),
            label: 'Data Diri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_history),
            label: 'Riwayat Pekerjaan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assured_workload),
            label: 'Data Pendidikan',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('images/male.png'),
          ),
          SizedBox(height: 20),
          Text(
            'WAHYU YAHYA NUGRAHA',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text('Teknik Informatika'),
          SizedBox(height: 15),
          _buildDataRow('Location', 'Tangerang, Banten'),
          _buildDataRow('Email', 'whysmart4@gmail.com'),
          _buildDataRow('Contact', '085219730685'),
        ],
      ),
    );
  }
}
Widget _buildDataRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 9.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label + ': ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    ),
  );
}


class ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text('Riwayat Pekerjaan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildDataRow('Nama ', 'Wahyu Yahya Nugraha'),
          _buildDataRow('~ Pengalaman Kerja', 'CV.DESAIN GRAFIS'),
          _buildDataRow('~ Posisi', 'Desain Animasi'),
          _buildDataRow('~ Pengalaman Kerja', 'PT.Gandum Mas Kencana'),
          _buildDataRow('~ Posisi', 'Operator Produksi'),
        ],
      ),
    );
  }
}

class ContactTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 26),
          Text('Data Pendidikan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          SizedBox(height: 26),

          _buildDataRow ('Formal ', ''),
          _buildDataRow ('~ 2009 - 2015', 'SDN CIKUPA 1, Kab.Tangerang'),
          _buildDataRow ('~ 2015 - 2018', 'SMPIT DAARUL MUKHTARIN, Kab.Tangerang'),
          _buildDataRow ('~ 2018 - 2021', 'SMK PUTRA PERDANA INDONESIA'),

          _buildDataRow (' Non Formal ', ''),
          _buildDataRow ('~ 2012 - 2015', 'BIMBEL PEC'),
          _buildDataRow ('~ 2012 - 2015', 'Bimbel LP3I'),
        ],
      ),
    );
  }
}
