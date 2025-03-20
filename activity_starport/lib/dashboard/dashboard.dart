import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '/profile/profile.dart';
import '/explore/explore_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 2
              ? "Profile"
              : _selectedIndex == 1
                  ? "Explore"
                  : "Dashboard",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                formattedDate,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          DashboardContent(),
          ExploreScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  Future<void> _deleteBooking(String docId) async {
    await FirebaseFirestore.instance.collection('bookings').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to Sunspire Tours PH",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('bookings')
                  .orderBy('timestamp', descending: true)
                  .limit(5)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var bookings = snapshot.data!.docs;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Recent Bookings",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ...bookings.map((doc) {
                      var data = doc.data() as Map<String, dynamic>;
                      Timestamp timestamp = data["timestamp"];
                      DateTime dateTime = timestamp.toDate();
                      String formattedDate =
                          DateFormat.yMMMd().format(dateTime);
                      String formattedTime = DateFormat.jm().format(dateTime);
                      String bookingDate = data["date"];
                      String bookingTime = data["time"];
                      return _buildBookingItem(
                          context,
                          doc.id,
                          data["destination"],
                          formattedDate,
                          formattedTime,
                          bookingDate,
                          bookingTime);
                    }).toList(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingItem(BuildContext context, String docId, String location,
      String date, String time, String bookingDate, String bookingTime) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading:
            const Icon(Icons.location_on, color: Colors.redAccent, size: 30),
        title: Text(
          location,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          "Booked on: $date at $time\nScheduled Date: $bookingDate at $bookingTime",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
        trailing: PopupMenuButton<String>(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (value) {
            if (value == 'delete') {
              _deleteBooking(docId);
            }
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.redAccent, size: 20),
                  SizedBox(width: 10),
                  Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
          icon: const Icon(Icons.more_vert, color: Colors.grey),
        ),
      ),
    );
  }
}
