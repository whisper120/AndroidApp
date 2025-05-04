import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> allServices = [
    'Cleaning', 'Plumber', 'Electrician', 'Painter', 'Carpenter', 'Gardener',
    'AC Repair', 'Window Cleaning', 'Pest Control', 'Moving', 'Laundry',
    'Babysitting', 'Dog Walking', 'Security', 'IT Support', 'Painting',
  ];

  final List<IconData> allIcons = [
    Icons.cleaning_services, Icons.plumbing, Icons.electrical_services, Icons.format_paint,
    Icons.handyman, Icons.grass, Icons.ac_unit, Icons.window, Icons.bug_report,
    Icons.local_shipping, Icons.local_laundry_service, Icons.child_friendly,
    Icons.pets, Icons.security, Icons.support_agent, Icons.color_lens,
  ];

  int currentPage = 0;
  final int itemsPerPage = 6;

  List<String> get currentServices {
    int start = currentPage * itemsPerPage;
    int end = (start + itemsPerPage).clamp(0, allServices.length);
    return allServices.sublist(start, end);
  }

  List<IconData> get currentIcons {
    int start = currentPage * itemsPerPage;
    int end = (start + itemsPerPage).clamp(0, allIcons.length);
    return allIcons.sublist(start, end);
  }

  void _nextPage() {
    if ((currentPage + 1) * itemsPerPage < allServices.length) {
      setState(() {
        currentPage++;
      });
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              child: GridView.builder(
                itemCount: currentServices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(currentIcons[index], size: 40),
                        const SizedBox(height: 10),
                        Text(currentServices[index]),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage > 0)
                  FloatingActionButton(
                    mini: true,
                    onPressed: _previousPage,
                    child: const Icon(Icons.arrow_back),
                  )
                else
                  const SizedBox(width: 56), // placeholder

                if ((currentPage + 1) * itemsPerPage < allServices.length)
                  FloatingActionButton(
                    mini: true,
                    onPressed: _nextPage,
                    child: const Icon(Icons.arrow_forward),
                  )
                else
                  const SizedBox(width: 56), // placeholder
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
