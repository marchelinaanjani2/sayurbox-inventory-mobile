TUGAS 7

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Jawab: 
Dalam pengembangan aplikasi Flutter, terdapat perbedaan penting antara stateless widget dan stateful widget:
1. Stateless Widget:
   - Tidak dapat berubah: Stateless widget adalah komponen yang tidak menyimpan data atau status internal yang dapat berubah. Mereka berfungsi sebagai bagian dari antarmuka pengguna yang tidak berubah.
   - Hanya memiliki properti yang tidak berubah: Stateless widget menerima data sebagai parameter konstruksi dan menggunakan data ini untuk membuat tampilan. Mereka tidak memiliki mekanisme untuk memperbarui tampilan atau status secara internal.
   - Performa ringan: Karena mereka statis dan tidak memerlukan perubahan status, mereka cenderung memiliki kinerja yang lebih baik.

2. Stateful Widget:
   - Dapat berubah: Stateful widget adalah widget yang dapat menyimpan dan mengelola status atau data yang dapat berubah selama siklus hidup aplikasi.
   - Memiliki status internal: Mereka dapat memperbarui tampilan mereka secara dinamis berdasarkan perubahan pada status yang mereka pegang.
   - Menggunakan State object: Stateful widget memiliki kelas terpisah yang disebut "State" yang mengelola status dan menyediakan metode untuk memperbarui tampilan saat status berubah.

3. Kapan Menggunakan Mana:
- Gunakan Stateless widget ketika Anda memiliki bagian antarmuka pengguna yang tidak memerlukan perubahan dinamis.
- Gunakan Stateful widget ketika Anda perlu memperbarui bagian tampilan berdasarkan interaksi pengguna, perubahan data, atau status aplikasi yang berubah.

Sumber: https://www.kawankoding.id/flutter-stateless-vs-stateful/


2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Jawab:

### Widgets yang digunakan dalam main.dart:
1. MaterialApp:
   - Fungsi: Ini adalah root dari aplikasi Flutter.
   - Penggunaan: Mendefinisikan konfigurasi aplikasi seperti tema, warna, dan halaman awal aplikasi.
   
2. MyApp (StatelessWidget):
   - Fungsi: Menampilkan MaterialApp dan mengatur konfigurasi dasar aplikasi.
   - Penggunaan: Memuat MaterialApp dan menentukan konfigurasi tema dasar.

### Widgets yang digunakan dalam `menu.dart`:
1. MyHomePage (StatelessWidget):
   - Fungsi: Menampilkan berbagai widget untuk halaman utama.
   - Penggunaan: Menampilkan AppBar dan beberapa ShopCard dalam GridView.

2. Scaffold:
   - Fungsi: Membungkus tata letak halaman.
   - Penggunaan: Menyediakan struktur dasar untuk halaman, termasuk AppBar dan body.

3. SingleChildScrollView:
   - Fungsi: Membuat area yang dapat di-scroll.
   - Penggunaan: Memungkinkan konten di dalamnya untuk discroll jika tidak cukup ruang.

4. Column:
   - Fungsi: Mengatur child secara vertikal.
   - Penggunaan: Mengelompokkan widget menjadi kolom di dalam SingleChildScrollView.

5. Padding:
   - Fungsi: Menambahkan ruang putih di sekeliling widget-childnya.
   - Penggunaan: Memberikan padding di sekitar Column.

6. GridView:
   - Fungsi: Menampilkan child dalam tata letak grid.
   - Penggunaan: Menampilkan item-item dari list `items` dalam bentuk grid.

7. ShopCard (StatelessWidget):
   - Fungsi: Menampilkan kartu untuk setiap item.
   - Penggunaan: Menampilkan icon dan nama item dalam sebuah card.

8. Material:
   - Fungsi: Memberikan lapisan dasar untuk tampilan material.
   - Penggunaan: Membungkus InkWell dan Container.

9. InkWell:
   - Fungsi: Memberikan area responsif terhadap sentuhan.
   - Penggunaan: Membungkus Container, memungkinkan respons ketika kartu ditekan.

10. Container:
   - Fungsi: Menyediakan wadah untuk menampilkan konten.
   - Penggunaan: Membungkus icon dan teks dalam kartu.

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
Jawab:

### Langkah 1: Membuat Proyek Flutter Baru
Saya membuat proyek Flutter baru dengan menggunakan perintah `flutter create sayurbox_inventory`.

### Langkah 2: Menyiapkan Tampilan Utama
Saya membuka file `lib/main.dart` dan mengatur tema serta struktur dasar aplikasi.
   - Saya menggunakan `MaterialApp` sebagai root widget aplikasi.
   - Saya menambahkan tiga tombol sederhana dengan ikon dan teks.

### Langkah 3: Menambahkan Fungsi Aksi pada Tombol
Saya mengimplementasikan fungsi aksi ketika setiap tombol ditekan:
   - Saya menggunakan `SnackBar` untuk menampilkan pesan saat tombol ditekan.
   - Setiap tombol akan menampilkan pesan yang berbeda di Snackbar sesuai dengan teks tombolnya.

### Langkah 4: Tampilan yang Reaktif
Saya memastikan tampilan merespons aksi pengguna dengan menampilkan Snackbar ketika tombol ditekan.
Dalam kode tersebut, saya menggunakan widget `ElevatedButton.icon` untuk menampilkan ikon dan teks pada setiap tombol. Ketika tombol ditekan, saya menampilkan `SnackBar` dengan pesan yang sesuai dengan tombol yang ditekan.

