import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {'label': 'Cleaning', 'icon': Icons.cleaning_services},
      {'label': 'Plumber', 'icon': Icons.plumbing},
      {'label': 'Electrician', 'icon': Icons.electrical_services},
      {'label': 'Painter', 'icon': Icons.format_paint},
      {'label': 'Carpenter', 'icon': Icons.handyman},
      {'label': 'Gardener', 'icon': Icons.grass},
      {'label': 'AC Repair', 'icon': Icons.ac_unit},
      {'label': 'Window Cleaning', 'icon': Icons.window},
      {'label': 'Pest Control', 'icon': Icons.bug_report},
      {'label': 'Moving', 'icon': Icons.local_shipping},
      {'label': 'Laundry', 'icon': Icons.local_laundry_service},
      {'label': 'Babysitting', 'icon': Icons.child_friendly},
      {'label': 'Dog Walking', 'icon': Icons.pets},
      {'label': 'Security', 'icon': Icons.security},
      {'label': 'IT Support', 'icon': Icons.support_agent},
      {'label': 'Painting', 'icon': Icons.color_lens},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Which service do you need?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: services.map((service) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(service['icon'], size: 40),
                        const SizedBox(height: 10),
                        Text(service['label']),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
