import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DosenController extends GetxController {
  late TextEditingController cNidn;
  late TextEditingController cNama;
  late TextEditingController cProdi;
  late TextEditingController cFakultas;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Mengambil data dari koleksi "dosen"
  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference dosen = firestore.collection('dosen');
    return dosen.snapshots();
  }

  void add(String nidn, String nama, String prodi, String fakultas) async {
    CollectionReference dosen = firestore.collection("dosen");

    try {
      await dosen.add({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakultas": fakultas,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data dosen",
        onConfirm: () {
          cNidn.clear();
          cNama.clear();
          cProdi.clear();
          cFakultas.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Dosen.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("dosen").doc(id);
    return docRef.get();
  }

  void Update(String nidn, String nama, String prodi, String fakultas,
      String id) async {
    DocumentReference dosenById = firestore.collection("dosen").doc(id);

    try {
      await dosenById.update({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakultas": fakultas,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Dosen.",
        onConfirm: () {
          cNidn.clear();
          cNama.clear();
          cProdi.clear();
          cFakultas.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Mengubah Data Dosen.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("dosen").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah Anda yakin menghapus data ini?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data.",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak berhasil menghapus data.",
      );
    }
  }

  @override
  void onInit() {
    cNidn = TextEditingController();
    cNama = TextEditingController();
    cProdi = TextEditingController();
    cFakultas = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNidn.dispose();
    cNama.dispose();
    cProdi.dispose();
    cFakultas.dispose();
    super.onClose();
  }
}