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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // ID Pegawai
            TextField(
              controller: controller.cIdPegawai,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "ID Pegawai"),
            ),
            const SizedBox(height: 10),
            // Nama
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 10),
            // Alamat
            TextField(
              controller: controller.cAlamat,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Alamat"),
            ),
            const SizedBox(height: 10),
            // Jabatan
            TextField(
              controller: controller.cJabatan,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: "Jabatan"),
            ),
            const SizedBox(height: 30),
            // Tombol Simpan
            ElevatedButton(
              onPressed: () => controller.addData(
                controller.cIdPegawai.text, // id_pegawai
                controller.cNama.text,      // nama
                controller.cAlamat.text,    // alamat
                controller.cJabatan.text,   // jabatan
              ),
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}