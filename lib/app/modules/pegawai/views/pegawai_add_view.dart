import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/pegawai/controllers/pegawai_controller.dart';

class PegawaiAddView extends GetView<PegawaiController> {
  const PegawaiAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // No Karyawan
            TextField(
              controller: controller.cNoKaryawan,
              decoration: const InputDecoration(labelText: 'No Karyawan'),
            ),
            const SizedBox(height: 10),
            // Nama Karyawan
            TextField(
              controller: controller.cNamaKaryawan,
              decoration: const InputDecoration(labelText: 'Nama Karyawan'),
            ),
            const SizedBox(height: 10),
            // Jabatan Karyawan
            TextField(
              controller: controller.cJabatanKaryawan,
              decoration: const InputDecoration(labelText: 'Jabatan Karyawan'),
            ),
            const SizedBox(height: 20),
            // Tombol Simpan
            ElevatedButton(
              onPressed: () => controller.addData(
                controller.cNoKaryawan.text,
                controller.cNamaKaryawan.text,
                controller.cJabatanKaryawan.text,
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}