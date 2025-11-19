import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "jerseys";
  String _thumbnail = "";
  bool _isFeatured = false;

  final List<String> _categories = [
    'jerseys',
    'boots',
    'accessories',
    'clothing',
    'street wear',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        backgroundColor: const Color.fromARGB(255, 138, 33, 243),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (val) => _name = val,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return "Nama tidak boleh kosong!";
                  if (val.length < 3) return "Nama minimal 3 karakter!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Price
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Harga (Rp)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (val) {
                  _price = int.tryParse(val) ?? 0;
                },
                validator: (val) {
                  if (val == null || val.isEmpty) return "Harga wajib diisi!";
                  final num? price = num.tryParse(val);
                  if (price == null || price <= 0)
                    return "Harga harus angka positif!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Description
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Deskripsi Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (val) => _description = val,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return "Deskripsi tidak boleh kosong!";
                  if (val.length < 10) return "Deskripsi minimal 10 karakter!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Thumbnail URL
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL Thumbnail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (val) => _thumbnail = val,
                validator: (val) {
                  if (val == null || val.isEmpty) return "URL wajib diisi!";
                  if (!Uri.parse(val).isAbsolute)
                    return "Masukkan URL yang valid!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              //category
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(
                                cat[0].toUpperCase() + cat.substring(1)),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // Is Featured
              SwitchListTile(
                title: const Text("Tandai sebagai Produk Unggulan"),
                value: _isFeatured,
                onChanged: (val) {
                  setState(() {
                    _isFeatured = val;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Save Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 194, 33, 243),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.postJson(
                        "http://localhost:8000/add-flutter/",
                        jsonEncode({
                          "name": _name,
                          "description": _description,
                          "thumbnail": _thumbnail,
                          "price": _price,
                          "category": _category,
                          "is_featured": _isFeatured,
                        }),
                      );
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Products successfully saved!"),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Something went wrong, please try again."),
                          ));
                        }
                      }
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
