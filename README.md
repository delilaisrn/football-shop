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

## TUGAS 8

1. Perbedaan antara Navigator.push() dan Navigator.pushReplacement()

Navigator.push() menambahkan halaman baru di atas stack halaman sebelumnya, sehingga pengguna masih bisa kembali ke halaman lama dengan menekan tombol back.
Sementara itu, Navigator.pushReplacement() menggantikan halaman yang sedang aktif dengan halaman baru, jadi halaman sebelumnya dihapus dari stack dan pengguna tidak bisa kembali ke halaman lama.

Penggunaan pada aplikasi Football Shop:

- Navigator.push() cocok digunakan kalau kita ingin pengguna bisa kembali ke halaman sebelumnya, misalnya ketika melihat detail produk.

- Navigator.pushReplacement() digunakan saat berpindah antar halaman utama, seperti dari Home ke Tambah Produk, supaya tombol back tidak membawa pengguna kembali ke halaman yang sudah tidak relevan.

2. Pemanfaatan hierarchy widget seperti Scaffold, AppBar, dan Drawer

Ketiga widget ini digunakan untuk membuat struktur halaman yang konsisten dan rapi di seluruh aplikasi:

- Scaffold menjadi kerangka dasar setiap halaman (menyediakan struktur utama seperti body, appBar, dan drawer).

- AppBar digunakan untuk menampilkan judul halaman dengan warna dan gaya yang seragam di seluruh aplikasi.

- Drawer digunakan sebagai navigasi utama antara halaman Home dan Tambah Produk agar pengguna bisa berpindah halaman dengan mudah.

Dengan hierarchy ini, setiap halaman dalam aplikasi Football Shop tetap punya tampilan yang konsisten—judul tetap di atas, konten di tengah, dan drawer bisa diakses dari mana saja.

3. Kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView

Widget-widget layout ini membantu menjaga tampilan antarmuka tetap nyaman, fleksibel, dan responsif di berbagai ukuran layar:

- Padding memberi jarak antar elemen agar tampilan tidak saling menempel dan lebih mudah dibaca.
Contoh: setiap elemen TextFormField pada form tambah produk dibungkus Padding agar antar input punya jarak yang rapi.

- SingleChildScrollView memungkinkan seluruh isi halaman di-scroll, penting banget untuk form panjang supaya tidak terpotong di layar kecil.
Contoh: seluruh form tambah produk dibungkus SingleChildScrollView agar tetap bisa diakses di HP dengan layar kecil.

- ListView (atau Column dalam kasus form sederhana) memudahkan penataan elemen secara vertikal dan adaptif.
Contoh: di halaman utama, item-item produk bisa diatur dalam GridView atau ListView tergantung kebutuhan tampilan.

Semua ini membuat UI terasa clean dan responsif tanpa overflow error di layar kecil.

4. Penyesuaian warna tema untuk identitas visual aplikasi

Warna tema diatur melalui ThemeData pada MaterialApp di main.dart menggunakan ColorScheme.
Aplikasi Football Shop menggunakan kombinasi warna biru dan biru muda (accent) untuk mencerminkan kesan profesional dan sportif, sesuai identitas toko perlengkapan sepak bola.

Sedangkan pada bagian tombol di halaman utama (komponen ItemCard), tiap tombol memiliki warna latar tersendiri yang ditentukan melalui properti color di model ItemHomepage.
Nilai ini dikirim ke widget Material sebagai warna lokal untuk menimpa warna sekunder dari tema global.

Biru untuk All Products
Hijau untuk My Products
Merah untuk Create Product

Dengan cara ini, setiap elemen aplikasi tetap selaras dengan brand "Football Shop" dan pengguna bisa mengenali fungsi tiap tombol hanya dari warnanya.