# Tugas2_TarifParkir
 Nama: Fadhil Abi Untoro(1124160100)
# Problem Statement
 Sistem parkir ini merupakan sistem otomatis yang bisa mengecek denda jika si pengguna menghilangkan karcis, mengecek si pengguna apakah member, kalo member tidak perlu bayar parkir, dan mengecek jam atau waktu pengguna parkir
# Actor(pengguna)
aktor yang menggunakan sistem pengguna parkir (orang yang kendaraannya pengen parkir)
# Input dan Output
input
. member(bool):apakah orang yang parkir member atau tidak(true or false)
.waktumenit(int):menghitung waktu parkir
.tikethilang(bool)apakah orang tersebut menghilangkan karcis atau tidak (true or false)
# Output
 Program akan menampilkan hasil seperti tarif total, denda, dan member
# Functional Requirements
 . dapat mengecek orang yang member atau tidak
 . dapat mengecek orang tersebut menghilangkan karcis atau tidak
 . dapat mengecek tambahan waktu dari berapa lama orang tersebut parkir
# Businees Rule
 . BR-01 : Denda karcis hilang  di kenakan biaya 20000
 . BR-02 : Member bebas dari biaya parkir tapi kalo tiket ilang kena denda
 .BR-03  : Durasi parkir yang kurang dari 60 menit atau kelebihan dari 60 menit di bulatkan ke atas atau menjadi 1 jam penuh
 .BR-04 : Tarif parkir untuk motor normal 2000 untuk 1 jam pertama dan naik 1000 apabila lebih dari 1 jam
 .BR-04 : Tarif parkir untuk mobil normal 5000 untuk 1 jam pertama dan naik 3000 apabila lebih dari 1 jam
# Decomposition
parkir
|-- tikethilang -> mengecek status karcis, jika hilang akan di denda 20000(BR-01)
|-- member -> mengecek anggota, jika yang parkir member tidak di kenakan biaya (BR-02)
|-- waktumenit -> Membulatkan waktu menit menjadi hitungan jam penuh ke atas (BR-03)
|-- tariftotal -> menghitung darif dasar dan progresif (BR-04 dan BR-05)
# Pattern Recognition
-Pola pemberhentian awal: untuk pengecekan tikethilang dan member menggunakan pola logika yang sama true or false atau bool
-Pola Penyesuaian waktu : mencari jam berdasarkan pembagian bulat (~/)
-Pola rumus hitung progresif : Tarif Jam Pertama + ((Total Jam - 1) * Tarif Jam Berikutnya)
# Abstraction 
parkir
|--JenisKendaraan
|--member
|--waktumenit
|--tikethilang
tipe data utama: int:untuk menghitung waktu, denda dan bool untuk melihat apakah pengguna member atau tidak, melihat apakah pengguna menghilangkan karcis atau tidak
# Flowchart
 [start]
         |
         ▼
[panggil tarifParkir]
         |
         ▼
[tiketHilang (true)?] ─────────────► [return 20000]
  tidak  |                   ya
         ▼
[member (true)?] ──────────────────► [return 0]
  tidak  |                   ya
         ▼
[hitung durasi jam]
         |
         ▼
[kendaraan == motor?] ─────────────► [return tarif mobil progresif]
   ya    |                 tidak
         ▼
[return tarif motor progresif]
         |
         ▼
      [selesai]
# Pseudocode
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
  switch (kendaraan) {
    case JenisKendaraan.motor:
      tarifTotal = 2000 + (jam - 1) * 1000;
      break;
    case JenisKendaraan.mobil:
      tarifTotal = 5000 + (jam - 1) * 3000;
      break;
  }
  return tarifTotal + denda;