import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// Home Screen with buttons to each navigation demo
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation Examples")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Top Tab Navigation"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TopTabBarDemo()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Bottom Tab Navigation"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BottomTabBarDemo()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Drawer Navigation"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DrawerDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------- Top Tab Navigation -----------------

class TopTabBarDemo extends StatelessWidget {
  const TopTabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top Tabs'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.abc_outlined)),
              Tab(icon: Icon(Icons.access_alarms)),
              Tab(icon: Icon(Icons.ac_unit)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Page 1")),
            Center(child: Text("Page 2")),
            Center(child: Text("Page 3")),
          ],
        ),
      ),
    );
  }
}

// ----------------- Bottom Tab Navigation -----------------

class BottomTabBarDemo extends StatelessWidget {
  const BottomTabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: const Text('Bottom Tabs')),
        body: const TabBarView(
          children: [
            Center(child: Text("Page 1")),
            Center(child: Text("Page 2")),
            Center(child: Text("Page 3")),
          ],
        ),
        bottomNavigationBar: const Material(
          color: Colors.blue,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.access_time)),
              Tab(icon: Icon(Icons.accessible_rounded)),
              Tab(icon: Icon(Icons.article_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}

// ----------------- Drawer Navigation -----------------

class DrawerDemo extends StatefulWidget {
  const DrawerDemo({super.key});

  @override
  State<DrawerDemo> createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Index 1: Business', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Index 2: School', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
    );
  }
}