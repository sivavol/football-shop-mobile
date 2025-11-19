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


## **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**
- MaterialApp: pembungkus utama(root) aplikasi berbasis Material Design. Mengatur tema, navigasi, dan
  struktur aplikasi
- Scaffold: menyediakan struktur dasar halaman dengan AppBar dan Body
- AppBar: bagian atas halaman untuk menampilkan judul
- Padding: memberikan jarak di sekeliling widget di dalamnya
- Column: menyusun widget anak secara vertikal(kolom)
- Center: menempatkan widget di tengah halaman
- Text: menampilkan teks di layar
- GridView.count: membuat tata letak grid dengan jumlah kolom tetap
- Material: memberikan tampilan Material (warna, elevation, efek sentuh)
- InkWell: memberikan efek klik saat widget ditekan
- Container: pembungkus fleksibel yang bisa diatur ukuran, warna, dan paddingnya
- Icon: menampilkan ikon bawaan dari Material Icons
- SnackBar: menampilkan notifikasi/pesan sementara di layar
- ScaffoldMessenger: mengatur dan menampilkan SnackBar di dalam Scaffold
- SizedBox: memberikan ruang kosong dengna ukuran tertentu/membungkus child untuk membatasi ukuran

ItemCard adalah widget buatan sendiri karena extend StatelessWidget, sebagai kartu interaktif dan visual yang menampilkan ikon dna teks di dalam sebuah gridview.


## **Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root**.
Widget utama yang menginisialisasi seluruh aplikasi Flutter berbasis Material, seperti Scaffold, AppBar, dan SnackBar.
Fungsi utama:
- Menyediakan tema global (ThemeData) agar seluruh aplikasi konsisten warna, font, dan style. -> di kode: ColorScheme.fromSeed(seedColor:Colors.deepPurple)
- Mengelola navigasi antar halaman menggunakan home, routes, dan Navigator
- Menyediakan context Material Design untuk widget seperti Scaffold, AppBar, dan SnackBar, dll
- Menentukan judul aplikasi dna fitur localization jika diperlukan

Sering digunakan sebagai root karena semua widget Material seperti Scaffold dan AppBar memerlukan Material context yang disediakan oleh MaterialApp. Tanpa MaterialApp, tampilan tidak akan sesuai Material Design, widget seperti Scaffold atau AppBar tidak akan memiliki gaya Material yang sesuai.


## **Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?**
StatelessWidget:
- Tidak memiliki state (data tidak berubah selama runtime).
- Tampilan statis / UI tidak berubah setelah dibuat
- Cocok untuk teks, ikon, atau halaman yang tidak berubah
- ContohL MyApp, MyHomePage, ItemCard (karena tampilannya tidak berubah setelah dibuat)

StatefulWidget:
- Memiliki state yang bisa berubah dan mengubah tampilan
- Tampilan dinamis / UI akan rebuild ketika state berubah
- Cocok untuk form input, animasi, atau toggle

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

<details>
<summary> Tugas 9
</summary>

# Tugas 9

## **Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?**
Model dart dapat digunakan untuk mempermudah pengelolaan dan manipulai data yang diambil/dikitim dalam JSON.

- Validasi tipe:
Model memberi tipe yang jelas seperti String, int, boolean, DateTime.
Tanpa model, kita harus manual menebak tipe nilai dari Map.

- Null-safety:
Model menentukan apakah suatu field wajib(required) atau bisa null(String?).
Tanpa model, rawan terjadi error runtime karena akses field yang null.

- Maintainability:
Jika struktur JSON backend berubah, cukup memperbarui model.
Tanpa model, seluruh kode yang akses Map harus diubah satu per satu.

Jika langsung pakai Map<String, dynamic>:
- Raw error seperti NoSuchMethodError karena field tidak ada.
- Rawan salah cast tipe (misal String dianggap int).
- Tidak ada null-safety → aplikasi bisa crash.
- Kode jadi sulit dipelihara dan dibaca.

## **Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.**
http package:
- Digunakan untuk request/permintaan HTTP biasa (GET/POST).
- Tidak menyimpan cookie.
- Cocok untuk API open / public endpoint.
Pada tugas ini, fungsi package http adalah untuk mengambil data JSON dari server Django dengan metode GET dan mengirimkannya dengan POST

Contoh:
```
final response = await http.get(Uri.parse(url));
```

CookieRequest (dari pbp_django_auth):
- Wrapper HTTP khusus untuk integrasi dengan Django.
- Otomatis menyimpan cookie session dari Django.
- Digunakan untuk endpoint yang membutuhkan autentikasi (login, logout, form, CRUD user-specific).
- Mempertahankan sesi pengguna di seluruh aplikasi.
Pada tugas ini, digunakan untuk menyimpan status pengguna ketika login

Contoh: 
```
final request = context.watch<CookieRequest>();
final response = await request.login(username, password);
```

Perbedaan:
Package http digunakan untuk melakukan request HTTP standar yang tidak membutuhkan autentikasi, seperti mengambil data JSON terbuka dari Django.
Sedangkan CookieRequest menyimpan dan mengelola cookie session Django sehingga dapat digunakan untuk login, logout, dan mengakses endpoint yang membutuhkan autentikasi. Dengan demikian, http cocok untuk public endpoint, sementara CookieRequest wajib digunakan untuk fitur yang memerlukan status user.

## **Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**
Instance CookieRequest perlu dibagikan ke semua komponen karena CookieRequest menyimpan cookie session, status login (loggedIn), informasi user, authentication header bawaan

Jika tiap halaman membuat instance baru, session hilang, user dianggap logout, dan request tidak membawa cookie → request ditolak backend

Dengan Provider, hanya ada satu instance CookieRequest untuk seluruh aplikasi.

Sehingga, user tetap login meskipun pindah halaman, semua request membawa session yang sama, dan sinkron dengan Django Authentication

## **Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?**
- Menambahkan 10.0.2.2 pada ALLOWED_HOSTS: Android emulator mengakses localhost komputer melalui 10.0.2.2. 
Jika tidak ditambahkan, Django menolak request dengan error Bad Request: Invalid Host Header.

- Mengaktifkan CORS: Karena Flutter (mobile/web) mengakses Django API lintas origin. Menggunakan django-cors-headers: CORS_ALLOW_ALL_ORIGINS = True
Jika tidak, Browser/webview memblokir request karena CORS policy.

- Pengaturan SameSite/cookie
Django default: SESSION_COOKIE_SAMESITE = 'Lax'
Untuk API mobile yang mengirim cookie via cross-site:
```
SESSION_COOKIE_SAMESITE = None
SESSION_COOKIE_SECURE = True
```
Jika tidak, Cookie tidak terkirim → login tidak tersimpan, selalu dianggap logout.

- Menambahkan izin akses internet di Android
AndroidManifest.xml → tambahkan:
```<uses-permission android:name="android.permission.INTERNET"/>```
Jika tidak, Flutter tidak bisa mengakses jaringan sama sekali.

Kesimpulan jika salah konfigurasi:
- tidak bisa login
- request ditolak Django
- cookie tidak terkirim
- API tidak bisa diakses dari emulator
- session tidak terbaca, selalu logout

## **Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.**
1. User mengisi form di Flutter
- Misalnya form tambah produk.

2. Flutter memvalidasi input
- Menggunakan Form + TextFormField.

3. Data dikirim ke Django
- Menggunakan: ```CookieRequest.post() → authenticated``` atau ```http.post() → public```

4. Django menerima request
Backend:
- memproses form
- membuat object baru di database
- mengembalikan JSON response

5. Flutter menerima JSON
- JSON → model Dart (ProductEntry.fromJson()).

6. Ditampilkan di Flutter
- Biasanya menggunakan FutureBuilder atau state management.

## **Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**
A. Register
User mengisi form register di Flutter.
Flutter kirim POST ke Django (/auth/register/).
Django membuat akun baru.
Django kirim response sukses → Flutter tampilkan pesan hasil.

B. Login
User input username & password.
Flutter memanggil request.login(username, password).
Django memvalidasi login.
Jika benar:
- Django mengembalikan cookie session
- CookieRequest menyimpannya secara otomatis
Flutter now "logged in" → navigasi ke home page.

C. Mengakses halaman privat
Setiap request menggunakan CookieRequest otomatis membawa:
- sessionid
- CSRF token
Django mengenali user → memberi data khusus user.

D. Logout
Flutter memanggil request.logout().
Django menghapus session.
CookieRequest mengosongkan cookie.
Flutter kembali ke halaman login dan tidak bisa kembali ke halaman lama.

## **Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**
1. Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
2. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
- Membuat django app baru bernama authentication
- Menambahkan app authentication ke INSTALLED_APPS pada main project settings.py aplikasi Django.

- Menambahkan path authentication pada urls.py aplikasi (football_shop/urls.py)

- Menambahkan fungsi registrasi pada authentication/views.py dan juga routing path pada urls.py
```
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)
```
- Membuat file baru register.dart untuk implementasi registrasi pada flutter, berisi input username, password, dan password confirmation dengan logika untuk mengirim data ke endpoint Django menggunakan request.postJson. Ketika berhasil melakukan registrasi, navigator menuju login page untuk ditampilkan ke pengguna.

3. Membuat halaman login pada proyek tugas Flutter.
- Menambahkan fungsi registrasi pada authentication/views.py dan juga routing path pada urls.py
```
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Login status successful.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login successful!"
                # Add other data if you want to send data to Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, account is disabled."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, please check your username or password."
        }, status=401)
```
- Membuat file baru login.dart untuk mengimplementasi login pada flutter, dengan input username dan password dengan logika untuk mengirim data login ke endpoint Django. Ketika berhasil melakukan registrasi, navigator menuju home page (halaman utama) untuk ditampilkan ke pengguna.

4. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
-  Menyalakan virtual environment, kemudian menginstall library cors-headers dan menambahkan middleware.
Steps:
- Menambahkan 'django-cors-header' pada requirements.txt
- Menginstall library dengan `pip install django-cors-headers`
- Menambahkan corsheaders ke INSTALLED_APPS pada main project settings.py aplikasi
- Menambahkan corsheaders.middleware.CorsMiddleware ke MIDDLEWARE pada main project settings.py plikasi
- Menambahkan variabel pada main project settings.py aplikasi:
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
- Menambahkan '10.0.2.2' pada ALLOWED_HOSTS di settings.py

- Install package provider dan pbp_django_auth
```
flutter pub add provider
flutter pub add pbp_django_auth
```
- Modifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider
```
return Provider(
    create: (_) {
        CookieRequest request = CookieRequest();
        return request;
    },
    ...
)
```

5. Membuat model kustom sesuai dengan proyek aplikasi Django.
- Mengambil data pada Django dalam format JSON dan dikonversikan menjadi model Dart dengan menggunakan website Quicktype.
- Membuat file baru untuk menyimpan models untuk diisi, serta memastikan semua attribute memiliki field dan ketentuan yang sesuai dengan yang sebelumnya.

6. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. (Tampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing item pada halaman ini (Dapat disesuaikan dengan field yang kalian buat sebelumnya)).
- Menambahkan package http dengan perintah `flutter pub add http`
- Pada file android/app/src/main/AndroidManifest.xml, memperbolehkan akses internet pada aplikasi flutter dengan:
```
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
```

- Membuat file product_entry_card.dart sebagai tampilan card dan diisi sesuai tampilan yang diinginkan dengan menampilkan semua attributes models.

Pada product_entry_list.dart:
- Mengambil data JSON untuk dikonversikan menjadi objects
```
final response = await request.get('http://127.0.0.1:8000/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to productEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
```
- Data yang telah didapat akan ditampilkan dalam FutureBuilder dengan tampilan card sesuai yang telah dibuat pada file product_entry_card.

7. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. (Halaman ini dapat diakses dengan menekan salah satu card item pada halaman daftar Item. Tampilkan seluruh atribut pada model item kamu pada halaman ini.)
- Membuat file baru product_detail.dart sebagai tampilan halaman product detail. Berisi tampilan sesuai yang diinginkan dan menampilkan seluruh atribut pada model item
- Pada product_entry_list.dart, menambahkan navigasi sehingga ketika card ditekan, akan menuju ke halaman detail untuk product tersebut.

8. Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
- Menambahkan fungsi dan routing baru pada Django untuk filter dan menadapatkan product hanya pengguna yang login (request user).
- Membuat file baru bernama my_product.dart, yang berisi pengambilan data product hanya milik pengguna.
- Pada product_card.dart akan ditambahkan navigasi menuju ke halaman product yang terlah difilter (menampilkan my product).

</details>
