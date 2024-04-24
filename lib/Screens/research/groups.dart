import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResearchGroup {
  final String name;
  final String description;
  final String imageUrl;

  ResearchGroup({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class ResearchGroupScreen extends StatelessWidget {
  final List<ResearchGroup> researchGroups = [
    ResearchGroup(
      name: 'Machine Learning Lab',
      description:
          'This research group focuses on various aspects of machine learning and artificial intelligence.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1708879452883-73be1eb9dd99?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8TUx8ZW58MHx8MHx8fDA%3D',
    ),
    ResearchGroup(
      name: 'Biomedical Engineering Group',
      description:
          'We work on cutting-edge research in biomedical engineering, including bioinformatics and medical imaging.',
      imageUrl:
          'https://images.unsplash.com/photo-1581092334651-ddf26d9a09d0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJpb21lZGljYWwlMjBlbmdpbmVlcnxlbnwwfHwwfHx8MA%3D%3D',
    ),
    ResearchGroup(
      name: 'Energy Systems Research Group',
      description:
          'Our group conducts research on renewable energy, energy efficiency, and smart grid technologies.',
      imageUrl:
          'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGVuZXJneSUyMHN5c3RlbXN8ZW58MHx8MHx8fDA%3D',
    ),
  ];

  ResearchGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CupertinoColors.black,
        title: const Text(
          'Research Groups',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      body: ListView.builder(
        itemCount: researchGroups.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(researchGroups[index].imageUrl),
                ),
                title: Text(researchGroups[index].name),
                subtitle: Text(researchGroups[index].description),
                onTap: () {
                  // Navigate to group details screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResearchGroupDetailsScreen(
                          group: researchGroups[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ResearchGroupDetailsScreen extends StatelessWidget {
  final ResearchGroup group;

  const ResearchGroupDetailsScreen({Key? key, required this.group})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.description,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Members:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe\nJane Smith\nMichael Johnson',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Research Papers:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Title of Paper 1\n2. Title of Paper 2\n3. Title of Paper 3',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Spacer(), // Add spacer to push join options to the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement join functionality
                  },
                  child: Text('Join'),
                ),
                SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    // Implement cancel functionality
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
