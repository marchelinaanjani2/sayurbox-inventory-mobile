*TUGAS 9*

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Jawab: 
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Dalam Flutter, ada beberapa cara untuk mengambil dan mengelola data JSON, dan kita dapat memilih pendekatan yang paling sesuai dengan kebutuhan proyek Anda.

Berikut adalah dua pendekatan umum:

1. **Pengambilan Data Tanpa Model:**
   Jika struktur JSON sederhana dan kita hanya perlu mengambil beberapa nilai dari respons API, kita dapat menggunakan `http` atau paket Flutter lainnya untuk melakukan pemanggilan API dan mengambil data JSON sebagai `Map<String, dynamic>`. kita kemudian dapat mengakses nilai-nilai ini langsung menggunakan kunci.

   Contoh pengambilan data tanpa model menggunakan paket `http`:

   ```dart
   import 'dart:convert';
   import 'package:http/http.dart' as http;

   void fetchData() async {
     final response = await http.get('https://example.com/api/data');
     if (response.statusCode == 200) {
       Map<String, dynamic> data = json.decode(response.body);
       print(data['propertyName']);
     } else {
       print('Failed to load data');
     }
   }
   ```

2. **Pengambilan Data dengan Model:**
   Jika proyek kita melibatkan banyak data yang kompleks atau kita ingin mengorganisasi data dengan lebih baik, membuat model dapat menjadi pilihan yang baik. Dengan membuat model, kita dapat mengonversi respons JSON menjadi objek Dart yang dapat digunakan dengan lebih mudah dalam aplikasi.

   Contoh pengambilan data dengan model menggunakan model sederhana:

   ```dart
   import 'dart:convert';
   import 'package:http/http.dart' as http;

   class MyData {
     final String propertyName;

     MyData({required this.propertyName});

     factory MyData.fromJson(Map<String, dynamic> json) {
       return MyData(
         propertyName: json['propertyName'],
       );
     }
   }

   Future<MyData> fetchData() async {
     final response = await http.get('https://example.com/api/data');
     if (response.statusCode == 200) {
       Map<String, dynamic> data = json.decode(response.body);
       return MyData.fromJson(data);
     } else {
       throw Exception('Failed to load data');
     }
   }
   ```

   Dengan model, kita mendapatkan manfaat validasi tipe dan lebih mudah memahami struktur data.

Pilihan antara kedua pendekatan ini tergantung pada kompleksitas proyek dan preferensi. Jika proyek  kecil dan sederhana, tanpa model mungkin cukup. Namun, untuk proyek yang lebih besar dan kompleks, membuat model dapat membantu mempertahankan struktur yang lebih terorganisir dan mudah dimengerti.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Jawab:
`CookieRequest` pada konteks Flutter biasanya adalah sebuah kelas yang digunakan untuk menangani permintaan (request) HTTP ke server, terutama terkait autentikasi dan manajemen cookie. Dalam konteks aplikasi Flutter yang berkomunikasi dengan backend Django (sepertinya berdasarkan perintah dan kode yang diberikan), `CookieRequest` ini kemungkinan besar berkaitan dengan manajemen otentikasi pengguna dan pengiriman cookie untuk mempertahankan sesi pengguna.

Fungsi dari `CookieRequest` biasanya mencakup:

1. **Autentikasi Pengguna:** Mengirim permintaan otentikasi ke server dan menerima token otentikasi sebagai respons. Token ini kemudian dapat disimpan dan digunakan untuk otentikasi setiap permintaan berikutnya.

2. **Manajemen Cookie:** Saat menggunakan otentikasi berbasis sesi atau token, server akan memberikan cookie sebagai tanda bahwa pengguna telah terotentikasi. `CookieRequest` dapat membantu dalam mengelola cookie ini dan mengirimkannya kembali ke server saat permintaan berikutnya untuk menjaga sesi otentikasi.

Mengapa perlu membagikan instance `CookieRequest` ke semua komponen di aplikasi Flutter?

1. **Global State Management:** Dengan membagikan instance `CookieRequest` melalui `Provider` (sepertinya berdasarkan kode yang diberikan), Anda dapat membuatnya menjadi bagian dari global state di aplikasi Flutter Anda. Ini memungkinkan berbagai bagian dari aplikasi, seperti berbagai layar atau widget, untuk mengakses dan menggunakan objek `CookieRequest` yang sama. Dengan demikian, informasi otentikasi dan manajemen cookie dapat diakses dan diperbarui secara konsisten di seluruh aplikasi.

2. **Kemudahan Penggunaan:** Dengan membuat `CookieRequest` dapat diakses dari mana saja dalam aplikasi, Anda menghindari perlu melewatkan objek ini melalui berbagai tingkatan widget. Ini membuat kodenya lebih bersih dan lebih mudah diatur.

3. **Konsistensi Otentikasi:** Ketika Anda berbagi instance `CookieRequest`, Anda memastikan bahwa setiap komponen aplikasi menggunakan objek yang sama untuk otentikasi. Ini mencegah situasi di mana beberapa bagian dari aplikasi mengelola otentikasi secara terpisah dan mungkin dapat menyebabkan masalah keamanan atau inkonsistensi.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Jawab:
Proses pengambilan data dari JSON hingga ditampilkan pada Flutter melibatkan beberapa langkah utama:

1. **Pengambilan Data dari Server:**
   - Aplikasi Flutter membuat permintaan HTTP ke server, biasanya menggunakan paket seperti `http` untuk Dart/Flutter.
   - Server merespons permintaan dengan data dalam format JSON.

2. **Pemrosesan Data JSON:**
   - Data JSON yang diterima dari server perlu diproses agar dapat digunakan dalam aplikasi Flutter. Ini melibatkan deserialisasi JSON menjadi objek Dart menggunakan metode seperti `json.decode()`.

3. **Pemodelan Data:**
   - Biasanya, data yang diterima dari server kemudian dimodelkan dalam bentuk objek Dart. Objek ini mewakili struktur data yang diterima.
   - Pemodelan ini memungkinkan akses lebih mudah dan aman ke data, karena data sekarang dapat diakses melalui properti objek.

4. **State Management:**
   - Data yang diterima dan dimodelkan perlu dikelola dengan benar. Ini melibatkan penggunaan manajemen status Flutter, seperti `Provider` atau `Bloc`, untuk menyimpan dan memperbarui data secara reaktif.

5. **Pengaturan Tampilan (Widget):**
   - Widget Flutter, seperti `ListView`, `GridView`, atau `DataTable`, kemudian digunakan untuk menampilkan data.
   - Data dimasukkan ke dalam widget melalui properti atau melalui manajemen status.

6. **Pemisahan Tampilan dan Logika:**
   - Umumnya, tata letak dan logika terpisah untuk meningkatkan pemeliharaan dan kejelasan kode.
   - Widget yang bertanggung jawab untuk tata letak memperoleh data dari objek model yang sesuai dan menampilkan informasi tersebut.
Sumber: https://www.gamelab.id/news/1792-tutorial-menampilkan-data-api-menggunakan-flutter


4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Jawab: 
Mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter melibatkan beberapa langkah. Berikut adalah langkah-langkah umumnya:

### Pada Aplikasi Flutter (Client Side):

1. **Formulir Login/Register:**
   - Aplikasi Flutter menyediakan formulir login dan/atau registrasi yang memungkinkan pengguna memasukkan informasi akun, seperti username dan password.

2. **Permintaan Autentikasi:**
   - Saat pengguna mengirim formulir, aplikasi Flutter membuat permintaan autentikasi ke backend Django.
   - Permintaan ini mungkin berupa permintaan HTTP POST yang berisi informasi login pengguna.

3. **Penanganan Respon:**
   - Aplikasi Flutter menanggapi respon dari backend Django.
   - Jika autentikasi berhasil, backend Django mengembalikan token akses atau sesi, atau informasi pengguna lainnya yang diperlukan.
   - Aplikasi Flutter menyimpan informasi ini secara lokal, misalnya menggunakan `shared_preferences` atau `Provider` untuk manajemen status.

### Pada Backend Django (Server Side):

4. **Verifikasi Kredensial:**
   - Backend Django menerima permintaan autentikasi.
   - Kredensial pengguna diverifikasi, biasanya dengan memeriksa username dan password yang sesuai dengan data di database.

5. **Generasi Token Akses (Opsional):**
   - Jika backend Django menggunakan autentikasi berbasis token, backend dapat menghasilkan token akses dan mengirimkannya sebagai bagian dari respon ke Flutter.
   - Token akses ini akan digunakan oleh Flutter untuk otentikasi di permintaan selanjutnya.

6. **Respon ke Aplikasi Flutter:**
   - Backend Django memberikan respon ke aplikasi Flutter, yang mengandung informasi autentikasi yang diperlukan atau token akses jika diperlukan.
   - Jika autentikasi gagal, backend memberikan pesan kesalahan yang sesuai.

### Kembali ke Aplikasi Flutter (Client Side):

7. **Penanganan Respon:**
   - Aplikasi Flutter menanggapi respon dari backend Django.
   - Jika autentikasi berhasil, aplikasi Flutter dapat mengarahkan pengguna ke layar menu atau halaman utama.
   - Jika autentikasi gagal, aplikasi Flutter dapat menampilkan pesan kesalahan atau meminta pengguna untuk mencoba lagi.

8. **Navigasi Menu atau Halaman Utama:**
   - Jika autentikasi berhasil, aplikasi Flutter menavigasi pengguna ke layar menu atau halaman utama yang sesuai.

Sumber:https://firebase.google.com/docs/auth/flutter/start?hl=id

5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
Jawab: 
1. **Scaffold**: Digunakan untuk menentukan struktur dasar dari tampilan halaman, termasuk AppBar, Drawer, dan Body.

2. **AppBar**: Menampilkan judul aplikasi dan menyediakan tempat untuk ikon atau aksi lainnya di bagian atas halaman.

3. **Drawer**: Widget untuk menampilkan menu navigasi samping (drawer) yang dapat digeser ke samping.

4. **ListView**: Menyusun widget-widget dalam daftar bergulir.

5. **DrawerHeader**: Bagian header dalam Drawer yang biasanya digunakan untuk menampilkan judul atau informasi penting lainnya.

6. **Text**: Menampilkan teks di antarmuka pengguna.

7. **Icon**: Menampilkan ikon berdasarkan IconData.

8. **ListTile**: Widget untuk menampilkan item dalam daftar (ListView). Biasanya digunakan di dalam Drawer untuk membuat item navigasi.

9. **Material**: Mengimplementasikan komponen visual Material Design dan menyediakan efek responsif terhadap interaksi pengguna.

10. **InkWell**: Mengimplementasikan efek ink splash (efek saat elemen disentuh) pada child widget.

11. **Column**: Menyusun widget-widget anak dalam kolom vertikal.

12. **Padding**: Menambahkan jarak (padding) pada widget anaknya.

13. **PageRouteBuilder**: Digunakan untuk menangani animasi dan transisi antar halaman.

14. **Navigator**: Menangani navigasi antar halaman dalam aplikasi.

15. **Provider**: Untuk manajemen state di seluruh aplikasi.

16. **FutureBuilder**: Mengelola proses asynchronous dan membangun antarmuka pengguna berdasarkan hasil dari Future.

17. **SizedBox**: Menambahkan kotak dengan dimensi tertentu untuk memberikan ruang atau jarak di antara elemen-elemen antarmuka pengguna.

18. **CircularProgressIndicator**: Menampilkan indikator lingkaran berputar untuk menunjukkan bahwa aplikasi sedang memproses sesuatu.

19. **GestureDetector**: Mendeteksi gesture seperti ketukan (tap) pada widget.

20. **IconButton**: Tombol yang hanya berisi ikon.

Semua widget tersebut digunakan untuk membangun antarmuka pengguna aplikasi Flutter, dengan setiap widget memiliki fungsi dan karakteristik khususnya. Dengan menggunakan berbagai widget ini, dapat membuat tampilan yang interaktif dan responsif sesuai dengan kebutuhan aplikasi.

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Jawab:
1. **Deployment Proyek Django:**
   - Pastikan proyek Django sudah di-deploy dengan baik.
   - Pastikan endpoint JSON yang menyediakan data produk dapat diakses dari proyek Flutter.

2. **Halaman Login pada Proyek Flutter:**
   - Implementasikan halaman login pada proyek Flutter, baik dengan menggunakan widget bawaan Flutter atau paket eksternal seperti `flutter_bloc` atau `provider` untuk manajemen state.

3. **Integrasi Sistem Autentikasi Django dengan Proyek Flutter:**
   - Gunakan paket-paket seperti `http` atau `dio` untuk melakukan HTTP requests dari Flutter ke endpoint autentikasi Django.
   - Atur state aplikasi Flutter untuk menangani informasi login/logout.

4. **Model Kustom Django:**
   - Pastikan model produk di Django telah didefinisikan dengan benar dengan atribut seperti `name`, `amount`, dan `description`.

5. **Halaman Daftar Item:**
   - Buat halaman Flutter untuk menampilkan daftar item.
   - Gunakan `http` atau `dio` untuk mengambil data dari endpoint JSON di proyek Django.
   - Tampilkan data yang diterima sesuai dengan kebutuhan  di halaman Flutter.

6. **Halaman Detail untuk Setiap Item:**
   - Implementasikan halaman detail Flutter yang dapat diakses dengan menekan salah satu item di halaman daftar.
   - Gunakan navigator untuk melakukan perpindahan antar halaman.

7. **Menampilkan Seluruh Atribut pada Halaman Detail:**
   - Pastikan halaman detail menampilkan seluruh atribut dari model item, seperti `name`, `amount`, dan `description`.

8. **Menambahkan Tombol Kembali:**
   - Tambahkan tombol atau ikon yang memungkinkan pengguna kembali ke halaman daftar item.
   - Gunakan navigator untuk kembali ke halaman sebelumnya.



------------------------------------------------------------------------------------
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
1. Menyusun organisasi file tugas sebelumnya dengan memindahkan ShopItem ke dalam file baru shop_card.dart yang dimasukkan pada folder widgets. Serta memindahkan menu.dart dalam folder screens.
2. Membuat left_drawer.dart pada direktori  widgets
3. Memuat shoplist_form.dart pada direktori screens
4. Membuat productlist_page.dart pada direktori screens
5. membuat kode pada left_drawer sesuai tutorial dan import dari shoplist_form dan product_list_page dan tambahkan routing.
6. Import left_drawer ke menu.dart
7. membuat code pada file shoplist_form.dart sesuai tutorial namun menambahkan variable input mengikuti Proyek Django sebelumnya.
8. Menambahkan validator sesuai ketentuan.
9. membuat fungsi showDialog jika pengguna berhasil mengisi data sesuai semua validator
10. Menambahkan navigasi pada menu.dart dari button yang sudah ada.
Git add, commit, push.


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

