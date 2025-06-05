import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({
    Key? key,
    required this.trabajadorId,
    required this.trabajadorName,
    required this.trabajadorDescription, // This will now be treated as the address/direction
    required this.trabajadorTel,
    required this.trabajadorCorreo,
    required this.trabajadorHora,
    required this.trabajadorEmp,
  }) : super(key: key);

  final String trabajadorId;
  final String trabajadorName;
  final String trabajadorDescription; // Renamed conceptually to 'trabajadorAddress'
  final String trabajadorTel;
  final String trabajadorCorreo;
  final String trabajadorHora;
  final String trabajadorEmp;

  // Helper widget to create a consistent detail row
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Card( // Using Card for a distinct visual separation
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.blueAccent),
          title: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.white), // AppBar title color
        ),
        backgroundColor: const Color.fromARGB(255, 77, 133, 255), // AppBar background color changed to lilac purple
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Back icon color
        ),
      ),
      body: Container(
        color: Colors.grey.shade100, // Light background for the body
        child: ListView(
          padding: const EdgeInsets.all(8.0), // Padding around the list
          children: [
            // Branch Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: const Icon(
                    Icons.store_mall_directory_rounded, // Icon for branch name
                    color: Colors.blueAccent,
                    size: 30.0,
                  ),
                  title: Text(
                    trabajadorName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10.0), // Spacing between sections

            // Branch Address/Direction (separated from the name)
            _buildDetailRow(Icons.location_on, 'Dirección:', trabajadorDescription), // Using trabajadorDescription as address

            const SizedBox(height: 10.0), // Spacing between sections

            // Individual detail rows
            _buildDetailRow(Icons.fingerprint, 'ID Trabajador:', trabajadorId),
            _buildDetailRow(Icons.phone, 'Nombre:', trabajadorTel),
            _buildDetailRow(Icons.email, 'Apellido:', trabajadorCorreo),
            _buildDetailRow(Icons.access_time, 'Num. telefono:', trabajadorHora),
            _buildDetailRow(Icons.person, 'Direcciom:', trabajadorEmp),

            const SizedBox(height: 20.0), // Spacing before potential action buttons

            // Example of a delete button, if needed (placed outside the list tiles)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Action for deleting the branch
                  print('Delete button pressed'); // For demonstration
                  // Implement your delete logic here, perhaps showing a confirmation dialog
                },
                icon: const Icon(Icons.delete, color: Colors.white),
                label: const Text(
                  'Eliminar Trabajador',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}