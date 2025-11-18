import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // // Thumbnail
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(6),
                //   child: Image.network(
                //     'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail ?? "")}',
                //     height: 150,
                //     width: double.infinity,
                //     fit: BoxFit.cover,
                //     errorBuilder: (context, error, stackTrace) => Container(
                //       height: 150,
                //       color: Colors.grey[300],
                //       child: const Center(child: Icon(Icons.broken_image)),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 8),


                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: (product.thumbnail != null && product.thumbnail!.isNotEmpty)
                      ? Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail!)}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
                  )
                      : Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 8),



                // Category + Featured Badge
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        product.category,
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Featured indicator
                    if (product.isFeatured)
                      const Text(
                        'Featured',
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),

                // Name
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Seller
                Row(
                  children: [
                    const Icon(Icons.store, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      product.userUsername ?? "Unknown Seller",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Price
                Text(
                  "Rp ${product.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                // Description preview
                Text(
                  product.description.length > 100
                      ? '${product.description.substring(0, 100)}...'
                      : product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),

              ],
            ),
          ),
        ),
      ),
    );
  }
}