import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/dosen/controllers/dosen_controller.dart';
import 'package:myapp/app/modules/dosen/views/dosen_update_view.dart';

class DosenView extends GetView<DosenController> {
  void showOption(String id) async {
    await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                DosenUpdateView(),
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.delete(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(DosenController()).StreamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(), // Loading indikator
          );
        }

        if (snapshot.hasError) {
          return Center(
            child:
                Text("Terjadi kesalahan: ${snapshot.error}"), // Error handling
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          // Tampilkan teks jika data kosong
          return Center(
            child: Text("Data Kosong"),
          );
        }

        // Data tersedia, tampilkan dalam ListView
        var listAllDocs = snapshot.data!.docs;
        return ListView.builder(
          itemCount: listAllDocs.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
              backgroundColor: Color.fromARGB(255, 248, 248, 248),
            ),
            title: Text(
                "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
            subtitle: Text(
                "${(listAllDocs[index].data() as Map<String, dynamic>)["nidn"]}"),
            trailing: IconButton(
              onPressed: () => showOption(listAllDocs[index].id),
              icon: Icon(Icons.more_vert),
            ),
          ),
        );
      },
    );
  }
}