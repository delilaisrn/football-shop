import 'package:flutter/material.dart';
import 'package:football_shop/models/products_entry.dart';

class ProductsEntryCard extends StatelessWidget {
  final ProductsEntry products;
  final VoidCallback onTap;

  const ProductsEntryCard({
    super.key,
    required this.products,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: const Color.fromARGB(255, 204, 145, 255)),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(products.thumbnail)}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  products.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Category
                Text('Category: ${products.category}'),
                const SizedBox(height: 6),

                // Content preview
                Text(
                  products.description.length > 100
                      ? '${products.description.substring(0, 100)}...'
                      : products.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),

                // Price
                Text(
                  'Price: Rp ${products.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 120, 76, 175),
                  ),
                ),
                const SizedBox(height: 6),

                // Featured indicator
                if (products.isFeatured)
                  const Text(
                    'Featured',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}