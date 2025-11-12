import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';

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
  String _thumbnail = "";
  bool _isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        backgroundColor: Colors.blue,
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
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
                onChanged: (val) => _name = val,
                validator: (val) {
                  if (val == null || val.isEmpty) return "Nama tidak boleh kosong!";
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
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
                onChanged: (val) {
                  _price = int.tryParse(val) ?? 0;
                },
                validator: (val) {
                  if (val == null || val.isEmpty) return "Harga wajib diisi!";
                  final num? price = num.tryParse(val);
                  if (price == null || price <= 0) return "Harga harus angka positif!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Description
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Deskripsi Produk",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
                onChanged: (val) => _description = val,
                validator: (val) {
                  if (val == null || val.isEmpty) return "Deskripsi tidak boleh kosong!";
                  if (val.length < 10) return "Deskripsi minimal 10 karakter!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Thumbnail URL
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL Thumbnail",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
                onChanged: (val) => _thumbnail = val,
                validator: (val) {
                  if (val == null || val.isEmpty) return "URL wajib diisi!";
                  if (!Uri.parse(val).isAbsolute) return "Masukkan URL yang valid!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

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
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Produk berhasil disimpan!'),
                          content: Text(
                            "Nama: $_name\nHarga: Rp$_price\nDeskripsi: $_description\nThumbnail: $_thumbnail\nUnggulan: ${_isFeatured ? "Ya" : "Tidak"}",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                      _formKey.currentState!.reset();
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
