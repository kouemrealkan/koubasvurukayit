import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/secim_ekrani.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basvurukayit/service/auth_service.dart';
import 'package:basvurukayit/screens/login_ekrani.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KayitEkrani extends StatefulWidget {
  const KayitEkrani({Key? key}) : super(key: key);

  @override
  _KayitEkraniState createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final  _userNameController = TextEditingController();
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  final  _gsmController = TextEditingController();
  final  _ogrenciNoController = TextEditingController();
  final  _tcIdController = TextEditingController();
  final  _textEditingController = TextEditingController();
  final  _passwordConfirmController = TextEditingController();
  final _evAdresController = TextEditingController();
  final _isAdresController = TextEditingController();
  final _universiteController = TextEditingController();
  final _fakulteController = TextEditingController();
  final _bolumController = TextEditingController();
  final _dogumTarihiController = TextEditingController();
  final _sinifController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userNameField = TextFormField(
      autofocus: false,
      controller: _userNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Ad ve soyad boş olamaz");
        }
        if (!regex.hasMatch(value)) {
          return ("Geçerli bir ad-soyad girin(Min. 3 Karakter)");
        }
        return null;
      },
      onSaved: (value) {
        _userNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          hintText: 'Ad-Soyad',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );



    final tcIdField = TextFormField(
      autofocus: false,
      controller: _tcIdController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ('TC id alanı boş olamaz');
        }

        if (!RegExp("^\s*-?[0-9]{1,11}\s*").hasMatch(value)) {
          return ("Tc alanı 11 haneli olmalıdır");
        }

        return null;
      },
      onSaved: (value) {
        _tcIdController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.perm_identity,
            color: Colors.white,
          ),
          hintText: 'TC NO',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final dogumTarihiField = TextFormField(
      autofocus: false,
      controller: _dogumTarihiController,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Doğum tarihi girin');
        }

        return null;
      },
      onSaved: (value) {
        _dogumTarihiController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          hintText: 'Doğum Tarihi',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final emailField = TextFormField(
        autofocus: false,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("E-Mail adresini girin");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Geçerli bir email adresi girin");
          }
          return null;
        },
        onSaved: (value) {
          _emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            hintText: 'E-mail',
            prefixText: ' ',
            hintStyle: TextStyle(color: Colors.white),
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),

    );

    final gsmField = TextFormField(
      autofocus: false,
      controller: _gsmController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Gsm alanı boş olamaz');
        }

        return null;
      },
      onSaved: (value) {
        _gsmController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.phone_iphone_sharp,
            color: Colors.white,
          ),
          hintText: 'GSM',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final evAdresField = TextFormField(
      autofocus: false,
      controller: _evAdresController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Ev adresi girin');
        }
        return null;
      },
      onSaved: (value) {
        _evAdresController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.house,
            color: Colors.white,
          ),
          hintText: 'Ev adresi',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );



    final isAdresField = TextFormField(
      autofocus: false,
      controller: _isAdresController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        _isAdresController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.work,
            color: Colors.white,
          ),
          hintText: 'Varsa İş adresi',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final universiteField = TextFormField(
      autofocus: false,
      controller: _universiteController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Üniversite adı girin');
        }
        return null;
      },
      onSaved: (value) {
        _universiteController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.school,
            color: Colors.white,
          ),
          hintText: 'Üniversite Adı',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final fakulteField = TextFormField(
      autofocus: false,
      controller: _fakulteController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Fakülte adı girin');
        }


        return null;
      },
      onSaved: (value) {
        _fakulteController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.school_sharp,
            color: Colors.white,
          ),
          hintText: 'Fakülte',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final bolumField = TextFormField(
      autofocus: false,
      controller: _bolumController,
      keyboardType: TextInputType.number,
      validator: (value) {

        return null;
      },
      onSaved: (value) {
        _bolumController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.science,
            color: Colors.white,
          ),
          hintText: 'Bölüm adı',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );


    final ogrenciNoField = TextFormField(
      autofocus: false,
      controller: _ogrenciNoController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Öğrenci no boş olamaz');
        }
        return null;
      },
      onSaved: (value) {
        _ogrenciNoController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.school_sharp,
            color: Colors.white,
          ),
          hintText: 'Öğrenci No',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );




    final sinifField = TextFormField(
      autofocus: false,
      controller: _sinifController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Kaçıncı sınıf ?');
        }


        return null;
      },
      onSaved: (value) {
        _sinifController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.perm_identity,
            color: Colors.white,
          ),
          hintText: 'Sınıf',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );


    final passwordField = TextFormField(
        autofocus: false,
        controller: _passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Şifre gerekli");
          }
          if (!regex.hasMatch(value)) {
            return ("Geçerli bir şifre girin(Min. 6 Karakter)");
          }
        },
        onSaved: (value) {
          _passwordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.perm_identity,
              color: Colors.white,
            ),
            hintText: 'Şifre',
            prefixText: ' ',
            hintStyle: TextStyle(color: Colors.white),
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
    );
    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: _passwordConfirmController,
        obscureText: true,
        validator: (value) {
          if (_passwordConfirmController.text !=
              _passwordController.text) {
            return "Şifreler eşleşmiyor";
          }
          return null;
        },
        onSaved: (value) {
          _passwordConfirmController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.perm_identity,
              color: Colors.white,
            ),
            hintText: 'Şifre Tekrar',
            prefixText: ' ',
            hintStyle: TextStyle(color: Colors.white),
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(_emailController.text, _passwordController.text);
          },
          child: Text(
            "Kayıt Ol",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
          )),
    );









    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Formu',textAlign: TextAlign.start,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    userNameField,
                    SizedBox(height: 20),
                    tcIdField,
                    SizedBox(height: 20),
                    dogumTarihiField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    gsmField,
                    SizedBox(height: 20),
                    evAdresField,
                    SizedBox(height: 20),
                    isAdresField,
                    SizedBox(height: 20),
                    universiteField,
                    SizedBox(height: 20),
                    fakulteField,
                    SizedBox(height: 20),
                    bolumField,
                    SizedBox(height: 20),
                    ogrenciNoField,
                    SizedBox(height: 20),
                    sinifField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20,),
                    signUpButton,
                    SizedBox(height: 20,),



                  ],
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = _userNameController.text;
    userModel.tcId = _tcIdController.text;
    userModel.dogumTarihi = _dogumTarihiController.text;
    userModel.gsm = _gsmController.text;
    userModel.evAdres = _evAdresController.text;
    userModel.isAdres = _isAdresController.text;
    userModel.universite = _universiteController.text;
    userModel.fakulte = _fakulteController.text;
    userModel.bolum = _bolumController.text;
    userModel.ogrenciNo = _ogrenciNoController.text;
    userModel.sinif = _sinifController.text;

    await firestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Hesap Başarıyla kaydedildi ! :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => SecimEkrani()),
            (route) => false);
  }
}
