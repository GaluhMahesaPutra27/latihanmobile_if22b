import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/pegawai/controllers/pegawai_controller.dart';
import 'package:myapp/app/modules/pegawai/views/pegawai_update_view.dart';

class PegawaiView extends GetView<PegawaiController> {
  void showOption(String id) async {
    await Get.dialog(
      SimpleDialog(
        children: [
          // Update
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                PegawaiUpdateView(),
                arguments: id,
              );
            },
            title: const Text('Update'),
          ),
          // Delete
          ListTile(
            onTap: () {
              Get.back();
              controller.deleteData(id);
            },
            title: const Text('Delete'),
          ),
          // Close
          ListTile(
            onTap: () => Get.back(),
            title: const Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(PegawaiController()).streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // Mengambil data dari Firestore
          var listAllDocs = snapshot.data?.docs ?? [];
          return listAllDocs.isNotEmpty
              ? ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index) {
                    var data =
                        listAllDocs[index].data() as Map<String, dynamic>;
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor:
                            const Color.fromARGB(255, 248, 248, 248),
                      ),
                      title: Text("${data["nama"]}"), // Nama pegawai
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID Pegawai: ${data["id_pegawai"]}"),
                          Text("Jabatan: ${data["jabatan"] ?? '-'}"),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () => showOption(listAllDocs[index].id),
                        icon: const Icon(Icons.more_vert),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("Data Kosong"),
                );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}