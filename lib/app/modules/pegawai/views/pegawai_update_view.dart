import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/pegawai/controllers/pegawai_controller.dart';

class PegawaiUpdateView extends GetView<PegawaiController> {
  const PegawaiUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Pegawai'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cIdPegawai.text = data['id_pegawai'];
            controller.cNama.text = data['nama'];
            controller.cAlamat.text = data['alamat'];
            controller.cJabatan.text = data['jabatan'];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ID Pegawai
                  TextField(
                    controller: controller.cIdPegawai,
                    decoration: const InputDecoration(labelText: "ID Pegawai"),
                  ),
                  const SizedBox(height: 10),
                  // Nama
                  TextField(
                    controller: controller.cNama,
                    decoration: const InputDecoration(labelText: "Nama"),
                  ),
                  const SizedBox(height: 10),
                  // Alamat
                  TextField(
                    controller: controller.cAlamat,
                    decoration: const InputDecoration(labelText: "Alamat"),
                  ),
                  const SizedBox(height: 10),
                  // Jabatan
                  TextField(
                    controller: controller.cJabatan,
                    decoration: const InputDecoration(labelText: "Jabatan"),
                  ),
                  const SizedBox(height: 30),
                  // Tombol Ubah Data
                  ElevatedButton(
                    onPressed: () => controller.updateData(
                      controller.cIdPegawai.text, // id_pegawai
                      controller.cNama.text,      // nama
                      controller.cAlamat.text,    // alamat
                      controller.cJabatan.text,   // jabatan
                      Get.arguments,              // ID dokumen
                    ),
                    child: const Text("Ubah Data"),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}