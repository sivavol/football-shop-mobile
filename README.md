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

**Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) 
bekerja antar widget.**
Semua hal di layar (teks, tombol, kolom, dll) adalah widget, dimana widget ini disusun dalam 
hierarki menjadi seperti struktur tree yang disebut sebagai widget tree.
- Parent widget (induk): widget yang membungkus widget lain di dalamnya.
- Child widget (anak): widget yang berada di dalam parent, menerima tata letak dan perilaku 
induknya.
- 
Contoh:
Scaffold(
  appBar: AppBar(title: Text('Judul')),
  body: Center(
      child: Text('Halo Flutter!'),
  ),
)
Hierarkinya: Scaffold menjadi parent, dengan child AppBar dan Center, dimana masing-masing child 
ini memiliki child lagi berupa text.
Setiap parent mengontrol posisi, gaya, dan perilaku child-nya.




Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
- MaterialApp: pembungkus utama aplikasi berbasis Material Design. Mengatur tema, navigasi, dan 
struktur aplikasi
- Scaffold: menyediakan struktur dasar halaman seperti AppBar, Body, dan FloatingActionButton.
- AppBar: bagian atas halaman untuk menampilkan judul tombol aksi
- Padding: memberi jarak di sekitar widget di dalamnya
- Column: menyusun widget anak secara vertikal(kolom)
- Center: menempatkan widget anak di tengah
- Text: menampilkan teks di layar
- GridView.count: membuat tata letak grid dengan jumlah kolom tetap
- Material: memberikan tampilan gaya Material (warna, elevation, efek sentuh)
- InkWell: menambahkan efek klik saat widget ditekan
- Container: pembungkus fleksibel yang bisa diatur ukuran, warna, dan paddingnya
- Icon: menampilkan ikon bawaan dari Material Icons
- SnackBar: menampilkan notifikasi sementara di bagian bawah layar
- ScaffoldMessenger: mengatur dan menampilkan SnackBar di dalam Scaffold
- SizedBox: memberi jarak antar widget dengan tinggi/lebar tertentu






Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget 
root.
Widget utama yang menginisialisasi seluruh aplikasi Flutter berbasis Material Design.
Fungsi utama:
- Mengatur tema warna global (ThemeData)
- Mengelola navigasi antar halaman dengan routes dan Navigator
- Menyediakan context Material Design untuk widget seperti Scaffold, AppBar, dan SnackBar, dll
- Mengatur judul aplikasi dan localization

Sering digunakan sebagai root karena semua widget Material seperti Scaffold, AppBar, dan 
FloatingActionButton memerlukan material context yang disediakan oleh MaterialApp. Tanpa ini, 
tampilan tidak akan memiliki gaya khas Android/Material.





Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget: 
- Tidak memiliki state (data tidak berubah selama runtime).
- Saat tampilan statis, seperti teks, ikon, atau halaman yang tidak berubah

StatefulWidget:
- Memiliki state yang bisa berubah dan mengubah tampilan
- Saat tampilan dinamis, misalnya input form, animasi, atau toggle

Di proyek ini, MyHomePage dan ItemCard adalah StatelessWidget karena tampilannya tidak berubah 
setelah dibuat.

Pemilihan bergantung pada keinginan developer untuk widget tersebut. Ketika ingin widget yang tetap 
dan tidak berubah, maka StatelessWidget menjadi pilihan. Namun, ketika widget yang digunakan ingin 
dapat berubah-ubah tampilan/isinya, maka StatefulWidget menjadi pilihan yang cocok untuk digunakan





Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
Referensi ke posisi widget dalam widget tree. Memberikan akses ke:
- Tema (Theme.of(context))
- Navigasi (Navigator.of(context))
- Scaffold (ScaffoldMessenger.of(context))

Penggunaan di metode build():
- Semua widget mempunyai metode build(BuildContext context).
- Context ini digunakan untuk:
  Theme.of(context).colorScheme.primary // ambil warna tema
  ScaffoldMessenger.of(context).showSnackBar(...) // tampilkan SnackBar
- Tanpa BuildContext, widget tidak tahu di mana posisinya di dalam tree dan tidak bisa berinteraksi 
dengan parent.






Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot Reload: 
- Memuat ulang kode yang berubah tanpa menghentikan aplikasi
- State tetap (misalnya, halaman tetap di posisi sebelumnya)

Hot Restart:
- Menjalankan ulang aplikasi dari awal
- State hilang, aplikasi kembali ke kondisi awal

Biasanya Hot Reload digunakan saat mengedit UI atau teks, sedangkan Hot Restart digunakan jika 
kamu ubah struktur kode besar seperti variabel global atau constructor.







Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.
- Dengan Navigator dan Route