# football_shop

A new Flutter project.

## TUGAS 7
1. Widget tree adalah struktur hierarki yang menunjukkan bagaimana widget disusun di Flutter.
Setiap widget bisa memiliki satu atau lebih anak (child), dan anak tersebut bisa memiliki anak lagi.
Widget di atas disebut parent, sedangkan widget di dalamnya disebut child.

2. MaterialApp = Root utama aplikasi, menyimpan konfigurasi global (tema, route, title).

Scaffold = Struktur dasar halaman: ada AppBar, body, dan SnackBar.

AppBar = Menampilkan judul di atas halaman.

Center = Menempatkan isi di tengah layar.

Column = Menyusun widget secara vertikal.

ElevatedButton.icon = Tombol dengan ikon dan teks.

Icon = Menampilkan ikon di tombol.

Text = Menampilkan tulisan.

SnackBar = Menampilkan pesan sementara di bagian bawah layar.

SizedBox = Menambahkan jarak antar elemen.

3. MaterialApp mengatur root aplikasi Flutter berbasis Material Design.
Widget ini menyediakan tema, navigasi, dan pengaturan global.
Biasanya dijadikan widget root karena hampir semua fitur Flutter (seperti Scaffold, SnackBar, dll) membutuhkan konteks MaterialApp.

4. StatelessWidget: tidak punya data atau state yang bisa berubah. Cocok untuk tampilan statis.

StatefulWidget: punya state yang bisa berubah dinamis selama aplikasi berjalan.
Gunakan StatelessWidget kalau tampilan tidak berubah (seperti tombol sederhana),
dan StatefulWidget kalau ada interaksi yang mengubah data (misal counter, form input).

5. BuildContext adalah objek yang mewakili lokasi widget di widget tree.
Penting karena digunakan untuk mencari widget lain dalam tree, misalnya saat memunculkan SnackBar lewat ScaffoldMessenger.of(context).

6. Hot reload: memperbarui kode di aplikasi tanpa menghapus state. Cepat untuk uji perubahan tampilan.

Hot restart: memulai ulang seluruh aplikasi dan menghapus state. Berguna kalau perubahan mempengaruhi struktur awal aplikasi.