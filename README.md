# chat_app  

## Log Pengembangan  
menggunakan Flutter 2.5.3  
update aplikasi akan dilampirkan disini.

### 1. UI Chat
membuat layout awal.   

### 2. Running 1
1. menambahkan beberapa resource berikut didalam project  
- [Firebase Auth](https://pub.dev/packages/firebase_auth/install)  
- [Firebase core](https://pub.dev/packages/firebase_core/install)  
- [Cloud Firestore](https://pub.dev/packages/cloud_firestore/install)   

 dengan perintah flutter pub add (plugin).  

2. menambahkan beberapa dependencies android didalam project
(lihat materi buku untuk lebih jelas).  
3. kaitkan project dengan firebase.  
4. hingga register berhasil dilakukan didalam aplikasi dengan output didalam console  

### 3. Running 2  
update aplikasi:  
1. menambahkan fitur chat didalam aplikasi yang disimpan menggunakan firebase firestore dan bisa melakukan login langsung.  
2. agar tersimpan apa yang kita tuliskan didalam firebase firestore kita harus menambahkan permission didalam firestore, silahkan buka link [berikut](https://firebase.google.com/docs/firestore/security/get-started#auth-required) untuk pemberian permissionnya.  

### 4. Running 3
update aplikasi:
1. memperbaiki masalah login pada running 2.
2. menambahkan fitur chat didalam aplikasi menggunakan cloud firestore.
3. menampilkan hasil chat yang ada.

#### credit:  
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
