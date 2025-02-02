import 'package:animated_botton_navigation/animated_botton_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/provider/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_assessment/widgets/custom_catagory_card.dart';
import 'package:flutter_assessment/widgets/custom_email_textfeild.dart';
import 'package:flutter_assessment/widgets/custom_text.dart';


class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<BottomNavBarProvider>(context);

    
    final List<IconData> _iconList = [
      Icons.home,
      Icons.search,
      Icons.notifications,
      Icons.settings
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: Row(
          children: [
            SafeArea(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/doctor.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 140, left: 5),
              child: Column(
                children: [
                  Text(
                    'Hi, Mohamad',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'How are you today',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('assets/clarity_bell-line.png'),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomEmailTextField(
                label: '',
                hintText: "Search for 'Doctor'",
                prefixIcon: Icons.search,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: CustomText(text: 'Our Service'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceCard(icon: Icons.person_pin_circle_rounded, label: 'Client appointment'),
                ServiceCard(icon: Icons.texture_sharp, label: 'Online appointment'),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Offers'),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) =>SizedBox(width:15,),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) => OfferCard(),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Categories'),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CategoryList(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Top Doctors'),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            TopDoctorsList(),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigation(
        icons: _iconList,
        onTapChange: (index) {
          appState.setCurrentIndex(index); 
        },
        currentIndex: appState.currentIndex,
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 200,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 90),
            child: Icon(
              icon,
              size: 60,
              color: Colors.blueAccent,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 390,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello Doctor!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        TextSpan(text: 'Offer '),
                        TextSpan(
                          text: '50%',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' off your first'),
                      ],
                    ),
                  ),
                  Text(
                    'video call with your doctor',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Get Offer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Image.asset(
              'assets/doctor_checking.jpg',
              height: 150,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              CustomCategoryCard(icon: Icons.favorite, text: 'Cardiology'),
              CustomCategoryCard(icon: Icons.lightbulb, text: 'Neurology'),
              CustomCategoryCard(icon: Icons.waves, text: 'Dermatology'),
            ],
          ),
          Row(
            children: [
              CustomCategoryCard(icon: Icons.man, text: 'Pulmonology'),
              CustomCategoryCard(icon: Icons.near_me_disabled, text: 'Surgery'),
              CustomCategoryCard(icon: Icons.earbuds_battery, text: 'Nephrology'),
            ],
          ),
        ],
      ),
    );
  }
}

class TopDoctorsList extends StatelessWidget {
  const TopDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DoctorCard(),
          DoctorCard(),
          DoctorCard(),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/doctor_checking.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Samira Ali',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Dermatologist',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(
                      'Zanalak-Mohamdasin',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text(
                      '4.2',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  '(1983 Reviews)',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Icon(Icons.favorite, color: Colors.red),
              ),
              SizedBox(height: 90),
              Text(
                '400 EGP',
                style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}  