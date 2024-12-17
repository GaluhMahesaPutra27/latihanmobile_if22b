import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  late TextEditingController cNoKaryawan;
  late TextEditingController cNamaKaryawan;
  late TextEditingController cJabatanKaryawan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Stream real-time data Pegawai
  Stream<QuerySnapshot<Map<String, dynamic>>> streamData() {
    return firestore.collection('karyawan_22312092').snapshots();
  }

  // Tambah Data Pegawai
  void addData(String noKaryawan, String namaKaryawan, String jabatanKaryawan) async {
    try {
      await firestore.collection('karyawan_22312092').add({
        'no_karyawan': noKaryawan,
        'nama_karyawan': namaKaryawan,
        'jabatan_karyawan': jabatanKaryawan,
      });
      Get.defaultDialog(
        title: "Sukses",
        middleText: "Data berhasil ditambahkan",
        textConfirm: "OK",
        onConfirm: () {
          clearForm();
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Kesalahan",
        middleText: "Gagal menambahkan data",
      );
    }
  }

  // Ambil Data Berdasarkan ID
  Future<DocumentSnapshot<Map<String, dynamic>>> getDataById(String id) async {
    return firestore.collection('karyawan_22312092').doc(id).get();
  }

  // Update Data Pegawai
  void updateData(String noKaryawan, String namaKaryawan, String jabatanKaryawan, String id) async {
    try {
      await firestore.collection('karyawan_22312092').doc(id).update({
        'no_karyawan': noKaryawan,
        'nama_karyawan': namaKaryawan,
        'jabatan_karyawan': jabatanKaryawan,
      });
      Get.defaultDialog(
        title: "Sukses",
        middleText: "Data berhasil diperbarui",
        textConfirm: "OK",
        onConfirm: () {
          clearForm();
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Kesalahan",
        middleText: "Gagal memperbarui data",
      );
    }
  }

  // Hapus Data Pegawai
  void deleteData(String id) {
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Yakin ingin menghapus data ini?",
      textConfirm: "Ya",
      textCancel: "Batal",
      onConfirm: () async {
        await firestore.collection('karyawan_22312092').doc(id).delete();
        Get.back();
        Get.defaultDialog(
          title: "Sukses",
          middleText: "Data berhasil dihapus",
        );
      },
    );
  }

  void clearForm() {
    cNoKaryawan.clear();
    cNamaKaryawan.clear();
    cJabatanKaryawan.clear();
  }

  @override
  void onInit() {
    cNoKaryawan = TextEditingController();
    cNamaKaryawan = TextEditingController();
    cJabatanKaryawan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNoKaryawan.dispose();
    cNamaKaryawan.dispose();
    cJabatanKaryawan.dispose();
    super.onClose();
  }
}