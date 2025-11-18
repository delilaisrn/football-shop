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

## TUGAS 9

1. Kita perlu membuat model Dart karena model memberi struktur yang jelas untuk data yang datang dari JSON. Model menjaga tipe data tetap konsisten, membantu null-safety, dan membuat kode lebih mudah dirawat. Jika langsung memakai Map<String, dynamic>, kita tidak mendapat perlindungan tipe, lebih mudah terjadi error saat runtime, dan perubahan struktur data menjadi sulit dilacak. Tanpa model, kode cepat berantakan dan rawan crash.

2. Package http dipakai untuk melakukan request HTTP biasa seperti GET atau POST tanpa autentikasi berbasis session. CookieRequest digunakan khusus untuk autentikasi Django karena ia menyimpan dan mengirim session cookie secara otomatis. http cocok untuk komunikasi stateless, sedangkan CookieRequest dipakai untuk fitur yang memerlukan login dan menjaga session tetap aktif.

3. Instance CookieRequest perlu dibagikan ke semua komponen agar seluruh halaman menggunakan session yang sama. Jika setiap halaman punya instance sendiri, Django tidak mengenali user sebagai session yang sama sehingga request bisa dianggap tidak login. Dengan membagikan CookieRequest lewat Provider, status login selalu konsisten di seluruh aplikasi.

4. Flutter perlu konfigurasi khusus agar bisa berkomunikasi dengan Django. 10.0.2.2 ditambahkan ke ALLOWED_HOSTS karena Android emulator menggunakan alamat itu untuk mengakses komputer host. CORS perlu diaktifkan agar Django mengizinkan request dari aplikasi Flutter. Pengaturan SameSite dan cookie harus disesuaikan agar session cookie bisa dikirim dari mobile. Android juga harus diberi izin internet di manifest agar request bisa berjalan. Jika konfigurasi ini tidak benar, request akan gagal, cookie tidak terkirim, autentikasi tidak jalan, atau Flutter tidak bisa mengakses server sama sekali.

5. Data dikirim mulai dari user mengisi form di Flutter. Input dikumpulkan menjadi map, lalu dikirim ke Django dalam bentuk JSON melalui POST. Django menerima data, memprosesnya, memvalidasi, dan menyimpan ke database. Django kemudian mengirim kembali JSON sebagai response. Flutter menerima response, mengubahnya menjadi object Dart melalui model, lalu menampilkannya pada UI menggunakan FutureBuilder atau setState.

6. Pada login, Flutter mengirim username dan password ke Django menggunakan CookieRequest. Django memverifikasi data, membuat session, dan mengirim cookie sessionid. CookieRequest menyimpan cookie tersebut sehingga request berikutnya dianggap berasal dari user yang sudah login. Register bekerja dengan alur yang sama, hanya saja Django membuat user baru terlebih dahulu. Logout dilakukan dengan request ke endpoint logout Django yang menghapus session. Setelah session hilang, CookieRequest menghapus cookie lokal dan Flutter menyesuaikan tampilan menu ke kondisi tidak login.

7. Pertama saya memastikan backend Django berjalan normal, model produk sudah benar, dan semua endpoint JSON bisa diakses. Setelah itu saya menyesuaikan pengaturan seperti ALLOWED_HOSTS, CORS, dan konfigurasi cookie supaya bisa diakses dari Flutter.

Saya menyiapkan Flutter dengan menambahkan Provider dan CookieRequest, lalu mengatur CookieRequest supaya dibagikan ke seluruh aplikasi melalui main.dart. Ini supaya autentikasi Django bisa dipakai di semua halaman.

Setelah itu saya membuat model Dart yang sesuai dengan struktur model Django. Model ini saya pakai untuk mengubah JSON menjadi objek Dart yang lebih aman dan mudah digunakan di UI.

Saya membuat halaman registrasi dan login di Flutter, lalu menghubungkannya dengan endpoint Django menggunakan CookieRequest. Saya memastikan session cookie tersimpan sehingga user dianggap login.

Saya membuat halaman daftar item yang mengambil data dari endpoint JSON Django, memparsenya ke model Dart, lalu menampilkannya dalam bentuk card. Dari card ini saya hubungkan navigasi ke halaman detail produk.

Setelah halaman utama berfungsi, saya membuat halaman detail produk yang menampilkan semua atribut item, termasuk tombol untuk kembali ke daftar item.

Untuk fitur My Products, saya membuat endpoint yang hanya menampilkan produk milik user yang sedang login, lalu membuat halaman Flutter yang mengambil data dari endpoint tersebut.