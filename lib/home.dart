import 'package:flutter/material.dart';
import 'package:learn_flutter/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProider, child) {
                return Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  thumbColor: const MaterialStatePropertyAll(Colors.orange),
                  inactiveTrackColor: Colors.transparent,
                  thumbIcon: MaterialStatePropertyAll(
                    themeProider.isSelected
                        ? const Icon(Icons.nights_stay)
                        : const Icon(
                            Icons.wb_sunny,
                            color: Colors.white,
                          ),
                  ),
                  value: themeProider.isSelected,
                  onChanged: (value) {
                    themeProider.toggleTheme();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Paris',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              Consumer<ThemeProvider>(
                builder: (context, ThemeProvider, child) {
                  return Icon(
                      ThemeProvider.isSelected
                          ? Icons.nights_stay
                          : Icons.sunny,
                      size: 250,
                      color: ThemeProvider.isSelected
                          ? Colors.white
                          : Colors.orange);
                },
              ),
              const SizedBox(height: 30),
              const Text('20° c', style: TextStyle(fontSize: 30)),
              Text(
                'Good morning',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              ),
              Text(
                'NOIDA',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 50),
              const SizedBox(width: 50, child: Divider(thickness: 3)),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_twighlight),
                      Text('SUNRISE'),
                      Text('7:00'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(color: Colors.black, thickness: 1),
                  ),
                  Column(
                    children: [Icon(Icons.air), Text('WIND'), Text('4m/s')],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(color: Colors.black, thickness: 1),
                  ),
                  Column(
                    children: [
                      Icon(Icons.thermostat),
                      Text('Temperature'),
                      Text('23'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
