enum JenisKendaraan { motor, mobil }// buat data atau list 

int tarifParkir(
  JenisKendaraan kendaraan,
  bool member,
  int waktuMenit,
  bool tiketHilang,//membuat tipe data yang di gunakan 
) {
  int denda = 0;//denda awal 0
  if (tiketHilang) {
    return denda = 20000;
  }
  if (member) {
    return 0 + denda;
  }
  int jam = waktuMenit ~/ 60;
  if (waktuMenit % 60 > 0) {
    jam++;
  }
  if (jam == 0) {
    jam = 1;
  }
  int tarifTotal = 0;
  switch (kendaraan) {// mengecek variabel kendaraan dari jeniskendaraan
    case JenisKendaraan.motor://data mana yang sedang di cari dan menjalankan fungsi untuk tarif progresif 
      tarifTotal = 2000 + (jam - 1) * 1000;
      break;
    case JenisKendaraan.mobil:
      tarifTotal = 5000 + (jam - 1) * 3000;
      break;
  }
  return tarifTotal + denda;//menghitung seluruh tarif dan menghitung denda
}

void main() {
  print('Rp${tarifParkir(JenisKendaraan.motor, true, 30, true)}');// member tapi tiket ilang jadi kena denda
  print('Rp${tarifParkir(JenisKendaraan.motor, true, 30, false)}');//member jadi gaperlu bayar parkir
  print('Rp${tarifParkir(JenisKendaraan.motor, false, 30, false)}');//ga member jdi bayar parkir
  print('Rp${tarifParkir(JenisKendaraan.mobil, false, 181, false)}');//untuk mobil yang ga member dan ga ngilangin karcis
}
