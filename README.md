*TUGAS 8*

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Jawab:
- Navigator.push() digunakan untuk menavigasi ke halaman baru tanpa menghapus halaman sebelumnya dari tumpukan navigasi. Hal ini berguna jika kita ingin kembali ke halaman sebelumnya dengan menekan tombol kembali atau memanggil Navigator.pop(). Contoh penggunaan Navigator.push() adalah ketika kita ingin menampilkan detail produk dari daftar produk. Contohnya:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProductDetailPage(product)),
);
```
- Navigator.pushReplacement() digunakan untuk menavigasi ke halaman baru dengan menghapus halaman sebelumnya dari tumpukan navigasi. Hal ini berguna jika kita tidak ingin kembali ke halaman sebelumnya karena sudah tidak relevan atau sudah selesai. Contoh penggunaan Navigator.pushReplacement() adalah ketika kita ingin menampilkan halaman login setelah logout atau menampilkan halaman utama setelah login. Kita bisa menggunakan kode seperti ini:

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => LoginPage()),
);
```
Sumber :https://medium.com/@sparkleotech/flutter-navigation-and-routing-a-complete-guide-698f1d4ccec5.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
Jawab: 
Berikut adalah penjelasan tentang beberapa layout widget pada Flutter dan konteks penggunaannya masing-masing:

- **Center**: Widget yang menempatkan child-nya di tengah-tengah dirinya sendiri, baik secara horizontal maupun vertikal. Widget ini berguna jika kita ingin menampilkan satu widget di tengah layar atau di tengah parent-nya. Contoh penggunaannya adalah ketika kita ingin menampilkan teks "Hello World" di tengah layar.
- **Row**: Widget yang menata sejumlah child-nya secara horizontal, satu di samping yang lain. Widget ini berguna jika kita ingin menampilkan beberapa widget yang berhubungan secara linear, seperti ikon, tombol, atau teks. Contoh penggunaannya adalah ketika kita ingin menampilkan tiga ikon dengan label di bawahnya.
- **Column**: Widget yang menata sejumlah child-nya secara vertikal, satu di bawah yang lain. Widget ini berguna jika kita ingin menampilkan beberapa widget yang berhubungan secara linear, seperti judul, deskripsi, atau gambar. Contoh penggunaannya adalah ketika kita ingin menampilkan detail produk dengan gambar di atas dan teks di bawahnya¹.
- **Stack**: Widget yang menumpuk sejumlah child-nya di atas satu sama lain, dengan child pertama di bawah dan child terakhir di atas. Widget ini berguna jika kita ingin menampilkan beberapa widget yang berhubungan secara spasial, seperti gambar dengan teks di atasnya, atau latar belakang dengan konten di atasnya. Contoh penggunaannya adalah ketika kita ingin menampilkan gambar profil dengan ikon edit di sudutnya.
- **GridView**: Widget yang menata sejumlah child-nya dalam bentuk grid, dengan jumlah kolom yang tetap dan jumlah baris yang fleksibel. Widget ini berguna jika kita ingin menampilkan beberapa widget yang berhubungan secara kategorikal, seperti daftar produk, foto, atau menu. Contoh penggunaannya adalah ketika kita ingin menampilkan galeri foto dengan ukuran yang seragam.
- **ListView**: Widget yang menata sejumlah child-nya dalam bentuk daftar, dengan arah scroll yang bisa horizontal atau vertikal. Widget ini berguna jika kita ingin menampilkan beberapa widget yang berhubungan secara sekuensial, seperti daftar berita, pesan, atau komentar. Contoh penggunaannya adalah ketika kita ingin menampilkan daftar berita dengan judul dan gambar.
- **LayoutBuilder**: Widget yang membangun child-nya berdasarkan batasan ukuran yang diberikan oleh parent-nya. Widget ini berguna jika kita ingin membuat child-nya menyesuaikan diri dengan ukuran layar yang berbeda-beda, seperti smartphone, tablet, atau desktop. Contoh penggunaannya adalah ketika kita ingin menampilkan widget yang berbeda tergantung pada orientasi layar.

Sumber: https://docs.flutter.dev/ui/widgets/layout

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Jawab: 
Pada tugas ini, elemen input pada form yang digunakan adalah TextFormField. TexFormField digunakan untuk Nama produk, category, price, amount, dan deskripsi. 

- TextFormField digunakan untuk mengambil input.
- decoration memberikan hint dan label untuk input.
- onChanged digunakan untuk meng-update nilai variabel ketika nilai input berubah.
- validator digunakan untuk menentukan validitas input, yaitu apakah field input tidak boleh kosong.

**ElevatedButton untuk Menyimpan:**
- ElevatedButton digunakan sebagai tombol untuk menyimpan data produk.
- onPressed: menentukan aksi yang dilakukan ketika tombol ditekan. Pada kasus ini, mengecek validitas form dan menampilkan dialog jika valid.
- Dalam dialog, menampilkan informasi produk yang telah disimpan.

Penggunaan TextFormField memudahkan pengguna untuk memasukkan data dengan menyediakan antarmuka yang dapat diisi dan validasi yang dapat dikonfigurasi. Tombol ElevatedButton digunakan untuk memicu aksi pengiriman data setelah pengguna mengisi formulir.


4.Bagaimana penerapan clean architecture pada aplikasi Flutter?
Jawab:
Penerapan clean architecture pada aplikasi Flutter adalah salah satu cara untuk membuat kode yang modular, bersih, dan mudah diuji. Clean architecture membagi aplikasi menjadi beberapa lapisan, yaitu:

- **Domain**: Lapisan ini berisi model data dan logika bisnis aplikasi. Lapisan ini tidak bergantung pada framework atau detail implementasi lainnya. Lapisan ini juga berisi abstraksi dari kasus penggunaan (use case) dan sumber data (repository) yang akan diimplementasikan di lapisan lain.
- **Data**: Lapisan ini berisi implementasi dari repository yang mengatur interaksi dengan sumber data eksternal, seperti database, API, atau cache. Lapisan ini juga berisi model data yang sesuai dengan format sumber data.
- **Presentation**: Lapisan ini berisi kode yang menampilkan antarmuka pengguna (UI) dan mengatur interaksi dengan pengguna. Lapisan ini menggunakan berbagai pola manajemen state, seperti BLoC, Provider, atau Redux. Lapisan ini juga berisi model data yang sesuai dengan format UI.

Untuk menghubungkan lapisan-lapisan tersebut, kita bisa menggunakan dependency injection, yaitu teknik yang menyediakan ketergantungan kelas dari luar kelas itu sendiri. Dengan dependency injection, kita bisa mengurangi ketergantungan antar kelas dan memudahkan pengujian.

Berikut adalah contoh struktur folder dari aplikasi Flutter yang menerapkan clean architecture:

```
lib
├── core
│   ├── constants
│   ├── errors
│   ├── network
│   └── utils
├── data
│   ├── datasources
│   ├── models
│   └── repositories
├── domain
│   ├── entities
│   ├── repositories
│   └── usecases
└── presentation
    ├── blocs
    ├── pages
    └── widgets
```

Sumber:  https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
Jawab: 
1. **Membuat Halaman formulir**




------------------------------------------------------------------
*TUGAS 7*

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

