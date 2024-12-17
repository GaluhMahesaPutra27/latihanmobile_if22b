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
      ),
      body: FutureBuilder(
        future: controller.getDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNoKaryawan.text = data['no_karyawan'];
            controller.cNamaKaryawan.text = data['nama_karyawan'];
            controller.cJabatanKaryawan.text = data['jabatan_karyawan'];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNoKaryawan,
                    decoration: const InputDecoration(labelText: 'No Karyawan'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.cNamaKaryawan,
                    decoration: const InputDecoration(labelText: 'Nama Karyawan'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.cJabatanKaryawan,
                    decoration: const InputDecoration(labelText: 'Jabatan Karyawan'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => controller.updateData(
                      controller.cNoKaryawan.text,
                      controller.cNamaKaryawan.text,
                      controller.cJabatanKaryawan.text,
                      Get.arguments,
                    ),
                    child: const Text('Ubah Data'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}