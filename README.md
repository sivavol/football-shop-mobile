# football_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<details>
<summary>Tugas 7
</summary>

# Tugas 7

## **Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.**
Widget adalah semua elemen UI/hal yang berada di layar (teks, tombol, kolom, dLL), dimana widget-widget ini tersusun dalam
hierarki menjadi seperti struktur tree yang disebut sebagai widget tree.
- Parent widget (induk): widget yang membungkus widget lain di dalamnya, mengatur layout(posisi, gaya) dan perilaku anaknya
- Child widget (anak): widget yang berada di dalam parent, menerima tata letak dan perilaku induknya (mengikuti aturan parent). Child juga bisa memiliki child sendiri (nested).
- Parent widget (induk): widget yang membungkus widget lain di dalamnya, mengatur layout(posisi, gaya) dan perilaku anaknya
- Child widget (anak): widget yang berada di dalam parent, menerima tata letak dan perilaku induknya (mengikuti aturan parent). Child juga bisa memiliki child sendiri (nested).

### Contoh pada kode:
```
MaterialApp( // Root
  home: MyHomePage(), // Child
)

Scaffold( // Parent
  appBar: AppBar(...), // Child langsung dari Scaffold
  body: Padding( 
    child: Column( 
      children: [
        Center( 
          child: Column( 
            children: [
              Text(...), // Child paling dalam
              GridView.count(...),
            ],
          ),
        ),
      ],
    ),
### Contoh pada kode:
```
MaterialApp( // Root
  home: MyHomePage(), // Child
)

Scaffold( // Parent
  appBar: AppBar(...), // Child langsung dari Scaffold
  body: Padding( 
    child: Column( 
      children: [
        Center( 
          child: Column( 
            children: [
              Text(...), // Child paling dalam
              GridView.count(...),
            ],
          ),
        ),
      ],
    ),
  ),
)
```
- Material App menyediakan Material context untuk semua widget Material di bawahnya.
- Scaffold adalah parent utama untuk halaman
- AppBar dan Padding adalah child langsung dari Scaffold
- Di dalam Padding, terdapat Column yang menata widget secara vertikal
- Center menempatkan kolom teks dan grid di tengah layar
- GridView.count membuat tampilan grid untuk item menu
- Hierarki ini memungkinkan kontrol tata letak dan perilaku secara konsisten, misal Scaffold mengatur layout dasar, Column mengatur susunan vertikal, dan Center mengatur posisi di tengah.
- Material App menyediakan Material context untuk semua widget Material di bawahnya.
- Scaffold adalah parent utama untuk halaman
- AppBar dan Padding adalah child langsung dari Scaffold
- Di dalam Padding, terdapat Column yang menata widget secara vertikal
- Center menempatkan kolom teks dan grid di tengah layar
- GridView.count membuat tampilan grid untuk item menu
- Hierarki ini memungkinkan kontrol tata letak dan perilaku secara konsisten, misal Scaffold mengatur layout dasar, Column mengatur susunan vertikal, dan Center mengatur posisi di tengah.


## **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**
- MaterialApp: pembungkus utama(root) aplikasi berbasis Material Design. Mengatur tema, navigasi, dan
  struktur aplikasi
- Scaffold: menyediakan struktur dasar halaman dengan AppBar dan Body
- AppBar: bagian atas halaman untuk menampilkan judul
- Padding: memberikan jarak di sekeliling widget di dalamnya
- Column: menyusun widget anak secara vertikal(kolom)
- Center: menempatkan widget di tengah halaman
- Center: menempatkan widget di tengah halaman
- Text: menampilkan teks di layar
- GridView.count: membuat tata letak grid dengan jumlah kolom tetap
- Material: memberikan tampilan Material (warna, elevation, efek sentuh)
- InkWell: memberikan efek klik saat widget ditekan
- Material: memberikan tampilan Material (warna, elevation, efek sentuh)
- InkWell: memberikan efek klik saat widget ditekan
- Container: pembungkus fleksibel yang bisa diatur ukuran, warna, dan paddingnya
- Icon: menampilkan ikon bawaan dari Material Icons
- SnackBar: menampilkan notifikasi/pesan sementara di layar
- SnackBar: menampilkan notifikasi/pesan sementara di layar
- ScaffoldMessenger: mengatur dan menampilkan SnackBar di dalam Scaffold
- SizedBox: memberikan ruang kosong dengna ukuran tertentu/membungkus child untuk membatasi ukuran

ItemCard adalah widget buatan sendiri karena extend StatelessWidget, sebagai kartu interaktif dan visual yang menampilkan ikon dna teks di dalam sebuah gridview.
- SizedBox: memberikan ruang kosong dengna ukuran tertentu/membungkus child untuk membatasi ukuran

ItemCard adalah widget buatan sendiri karena extend StatelessWidget, sebagai kartu interaktif dan visual yang menampilkan ikon dna teks di dalam sebuah gridview.


## **Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root**.
Widget utama yang menginisialisasi seluruh aplikasi Flutter berbasis Material, seperti Scaffold, AppBar, dan SnackBar.
Widget utama yang menginisialisasi seluruh aplikasi Flutter berbasis Material, seperti Scaffold, AppBar, dan SnackBar.
Fungsi utama:
- Menyediakan tema global (ThemeData) agar seluruh aplikasi konsisten warna, font, dan style. -> di kode: ColorScheme.fromSeed(seedColor:Colors.deepPurple)
- Mengelola navigasi antar halaman menggunakan home, routes, dan Navigator
- Menyediakan tema global (ThemeData) agar seluruh aplikasi konsisten warna, font, dan style. -> di kode: ColorScheme.fromSeed(seedColor:Colors.deepPurple)
- Mengelola navigasi antar halaman menggunakan home, routes, dan Navigator
- Menyediakan context Material Design untuk widget seperti Scaffold, AppBar, dan SnackBar, dll
- Menentukan judul aplikasi dna fitur localization jika diperlukan
- Menentukan judul aplikasi dna fitur localization jika diperlukan

Sering digunakan sebagai root karena semua widget Material seperti Scaffold dan AppBar memerlukan Material context yang disediakan oleh MaterialApp. Tanpa MaterialApp, tampilan tidak akan sesuai Material Design, widget seperti Scaffold atau AppBar tidak akan memiliki gaya Material yang sesuai.
Sering digunakan sebagai root karena semua widget Material seperti Scaffold dan AppBar memerlukan Material context yang disediakan oleh MaterialApp. Tanpa MaterialApp, tampilan tidak akan sesuai Material Design, widget seperti Scaffold atau AppBar tidak akan memiliki gaya Material yang sesuai.


## **Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?**
StatelessWidget:
- Tidak memiliki state (data tidak berubah selama runtime).
- Tampilan statis / UI tidak berubah setelah dibuat
- Cocok untuk teks, ikon, atau halaman yang tidak berubah
- ContohL MyApp, MyHomePage, ItemCard (karena tampilannya tidak berubah setelah dibuat)
- Tampilan statis / UI tidak berubah setelah dibuat
- Cocok untuk teks, ikon, atau halaman yang tidak berubah
- ContohL MyApp, MyHomePage, ItemCard (karena tampilannya tidak berubah setelah dibuat)

StatefulWidget:
- Memiliki state yang bisa berubah dan mengubah tampilan
- Tampilan dinamis / UI akan rebuild ketika state berubah
- Cocok untuk form input, animasi, atau toggle
- Tampilan dinamis / UI akan rebuild ketika state berubah
- Cocok untuk form input, animasi, atau toggle

Pemilihan bergantung pada keinginan developer untuk widget tersebut.
- StatelessWidget jika UI tetap
- StatefulWidget jika UI perlu berubah sesuai aksi pengguna atau data runtime
Pemilihan bergantung pada keinginan developer untuk widget tersebut.
- StatelessWidget jika UI tetap
- StatefulWidget jika UI perlu berubah sesuai aksi pengguna atau data runtime


## **Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?**
BuildContext: Referensi posisi widget dalam widget tree.
Memberikan akses ke parent, theme, navigator, scaffold:
- Tema (Theme.of(context))
- Navigasi (Navigator.of(context))
- Scaffold (ScaffoldMessenger.of(context))

Contoh:
``` 
ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(
    SnackBar(content: Text("Kamu telah menekan tombol ${item.name}"))
  );
```

Contoh:
``` 
ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(
    SnackBar(content: Text("Kamu telah menekan tombol ${item.name}"))
  );
```

Penggunaan di metode build():
- Semua widget mempunyai metode build(BuildContext context).
- Context ini digunakan untuk:
  Theme.of(context).colorScheme.primary // ambil warna tema
  ScaffoldMessenger.of(context).showSnackBar(...) // tampilkan SnackBar
  Tanpa BuildContext, widget tidak tahu di mana posisinya di dalam tree dan tidak bisa berinteraksi
  dengan parent, sehingga tidak bisa memanggil Scaffold.


## **Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".**
Hot Reload:
- Memuat ulang kode yang berubah tanpa menghentikan aplikasi
- State aplikasi tetap (misalnya, halaman, scroll, atau input tetap di posisi sebelumnya)
- Cocok untuk mengubah teks, layout, atau UI kecil
- State aplikasi tetap (misalnya, halaman, scroll, atau input tetap di posisi sebelumnya)
- Cocok untuk mengubah teks, layout, atau UI kecil

Hot Restart:
- Menjalankan ulang aplikasi dari awal
- State hilang, aplikasi kembali ke kondisi awal
- Digunakan jika ada perubahan global atau variabel di root.

Contoh pada kode:
- Hot Reload bisa digunakan saat mengganti teks "Selamat datang di Football Shop"
- Hot restart diperlukan jika mengubah struktur MaterialApp atau items list di root.
</details>


<details>
<summary>Tugas 8
</summary>

# Tugas 8

## **Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?**
- Navigator.push(): menambahkan halaman baru diatas halaman saat ini. Sehingga halaman lama tetap ada di bawahnya dan bisa kembali ke halaman tersebut dengan tombol back. (Jika ingin user bisa kembali ke halaman sebelumnya).
- Navigator.pushReplacement(): "replace", yang berarti akan mengganti halaman sekarang dengan yang baru. Sehingga halaman lama akan dihapus dari stack dan tidak bisa diakses kembali ke halaman tersebut dengan tombol back. (Jika mencegah user untuk kembali ke halaman sebelumnya).

Pada aplikasi Football Shop:
- Navigator.push():
  - Ketika user add product, ketika selesai mengisi form tambah produk, user masih bisa kembali ke halaman utama
- Navigator.pushReplacement():
  - Ketika user logout, setelah logout, halaman sebelumnya(pada saat login) tidak bisa diakses kembali dengan tombol back

## **Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?**
- Scaffold: digunakan sebagai kerangka dasar setiap halaman. Menyediakan struktur umum seperti AppBar, Drawer, dan body, sehingga setiap halaman punya tata letak ayng seragam.
- AppBar: sebagai judul dan identitas halaman (misalnya "Add Product Form"). Pengguna langsung tahu konteks halaman yang sedang dibuka.
- Drawer (melalui leftDrawer): digunakan untuk navigasi antarhalaman utama seperti Home dan Add Product. Memastikan navigasi yang konsisten tanpa harus mengulang logika di setiap halaman untuk berpindah ke halaman yang lain.

Contoh:
```
return Scaffold(
  appBar: AppBar(
    title: const Center(child: Text('Add Product Form')),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  drawer: LeftDrawer(),
  body: Form(...),
);
```

## **Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.**
Widget-widget ini digunakan untuk memastikan tampilan antarmuka yang rapi, responsif, dan nyaman digunakan di berbagai ukuran layar.
- Padding: memberi jarak antar elemen agar tampilan form tidak menempel satu sama lain dan lebih rapi
- SingleChildScrollView: memungkinkan seluruh isi halaman atau form panjang tetap bisa di-scroll saat layar kecil. Sehingga tidak akan terjadi sebagian form tertutup oleh keyboard atau terpotong pada layar kecil.

Contoh dalam kode ProductFormPage (Padding dan SingleChildScrollView):
```
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Product Name",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        // ... field lain
      ],
    ),
  ),
),
```
Dengan ini, tampilan form tetap rapi, responsif, dan mudah digunakan di berbagai ukuran layar.

- ListView: digunakan untuk menampilkan daftar elemen yang dinamis atau panjang secara vertikal, misalnya daftar produk. Ini akan memberi tampilan yang profesional untuk daftar produk, berbeda dari form.
Berbeda dengan Column, ListView otomatis scrollable tanpa harus dibungkus SingleChildScrollView.

## **Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?**
Agar aplikasi Football Shop memiliki identitas visual yang kuat dan profesional, digunakan tema warna yang konsisten di seluruh aplikasi.
- Warna ini diterapkan secara global melalui ThemeData di main.dart, serta disesuaikan pada komponen penting seperti AppBar, tombol, dan ikon.

Contoh penerapan:
```
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  useMaterial3: true,
),
```
Dengan ini, setiap halaman dan komponen memiliki gaya visual yang seragam dan lebih konsisten, sehingga pengguna dapat mengenali karakter brand Football Shop.

</details>
