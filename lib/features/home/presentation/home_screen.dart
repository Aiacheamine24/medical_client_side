import 'package:flutter/material.dart';
import 'package:medical_client_side/core/constants/app_sizes.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p14),
          child: ListView(
            children: [
              // Ajouter le bouton dans le conteneur
              Container(
                margin: const EdgeInsets.only(bottom: Sizes.p20),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(Sizes.p64),
                ),
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ),
              // Liste des médecins
              ..._buildDoctorList(context),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode pour construire la liste des médecins
  List<Widget> _buildDoctorList(BuildContext context) {
    final doctors = [
      {
        'name': 'Dr. Alice Smith',
        'specialty': 'Cardiologist',
        'image': 'https://via.placeholder.com/150'
      },
      {
        'name': 'Dr. Bob Johnson',
        'specialty': 'Dermatologist',
        'image': 'https://via.placeholder.com/150'
      },
      {
        'name': 'Dr. Carol Williams',
        'specialty': 'Neurologist',
        'image': 'https://via.placeholder.com/150'
      },
    ];

    return doctors.map((doctor) {
      return Card(
        elevation: 5,
        margin: const EdgeInsets.only(bottom: Sizes.p20),
        child: Container(
          padding: const EdgeInsets.all(Sizes.p14),
          child: Row(
            children: [
              Image.network(
                doctor['image']!,
                width: Sizes.p64,
                height: Sizes.p64,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: Sizes.p14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor['name']!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      doctor['specialty']!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
