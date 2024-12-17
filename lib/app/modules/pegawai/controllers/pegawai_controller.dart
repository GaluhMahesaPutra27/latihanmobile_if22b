import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  late TextEditingController cIdPegawai;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cJabatan; // Tambahkan TextEditingController untuk jabatan

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Ambil semua data Pegawai
  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference pegawai = firestore.collection('pegawai');
    return pegawai.get();
  }

  // Stream untuk update real-time data Pegawai
  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference pegawai = firestore.collection('pegawai');
    return pegawai.snapshots();
  }

  // Tambahkan data Pegawai baru
  void addData(String id_pegawai, String nama, String alamat, String jabatan) async {
    CollectionReference pegawai = firestore.collection("pegawai");

    try {
      await pegawai.add({
        "id_pegawai": id_pegawai,
        "nama": nama,
        "alamat": alamat,
        "jabatan": jabatan, // Menambahkan field jabatan
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Data pegawai berhasil ditambahkan.",
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
        middleText: "Gagal menambahkan data pegawai.",
      );
    }
  }

  // Ambil data Pegawai berdasarkan ID
  Future<DocumentSnapshot<Object?>> getDataById(String id) async {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);
    return docRef.get();
  }

  // Update data Pegawai
  void updateData(String id_pegawai, String nama, String alamat, String jabatan, String id) async {
    DocumentReference pegawaiById = firestore.collection("pegawai").doc(id);

    try {
      await pegawaiById.update({
        "id_pegawai": id_pegawai,
        "nama": nama,
        "alamat": alamat,
        "jabatan": jabatan, // Menambahkan field jabatan
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Data pegawai berhasil diperbarui.",
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
        middleText: "Gagal memperbarui data pegawai.",
      );
    }
  }

  // Hapus data Pegawai
  void deleteData(String id) {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Apakah Anda yakin ingin menghapus data ini?",
      textConfirm: "Ya",
      textCancel: "Batal",
      onConfirm: () async {
        await docRef.delete();
        Get.back();
        Get.defaultDialog(
          title: "Sukses",
          middleText: "Data pegawai berhasil dihapus.",
        );
      },
    );
  }

  void clearForm() {
    cIdPegawai.clear();
    cNama.clear();
    cAlamat.clear();
    cJabatan.clear(); // Tambahkan clear untuk jabatan
  }

  @override
  void onInit() {
    cIdPegawai = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cJabatan = TextEditingController(); // Inisialisasi TextEditingController jabatan
    super.onInit();
  }

  @override
  void onClose() {
    cIdPegawai.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cJabatan.dispose(); // Dispose untuk jabatan
    super.onClose();
  }
}