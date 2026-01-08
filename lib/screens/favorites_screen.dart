import 'package:flutter/material.dart';
import '../models/property.dart';
import '../services/favorites_service.dart';
import '../widgets/property_card.dart';

/// Favorites Screen showing saved properties
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesService _favoritesService = FavoritesService();
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    await _favoritesService.loadFavorites();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B5FE9),
        elevation: 0,
        title: const Text(
          'My Favorites',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (_favoritesService.favoritesCount > 0)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.white),
              onPressed: _showClearConfirmation,
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Stats card
            _buildStatsCard(),
            const SizedBox(height: 16),

            // Filter chips
            if (_favoritesService.favoritesCount > 0) _buildFilterChips(),

            // Favorites list
            Expanded(
              child: _favoritesService.favoritesCount == 0
                  ? _buildEmptyState()
                  : _buildFavoritesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B5FE9), Color(0xFF3DDCFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5B5FE9).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_favoritesService.favoritesCount} Properties Saved',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Your favorite houses',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (_favoritesService.favoritesCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${_favoritesService.favoritesCount}',
                style: const TextStyle(
                  color: Color(0xFF5B5FE9),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = {
      'all': 'All',
      'recent': 'Recent',
      'low_price': 'Low Price',
      'high_price': 'High Price',
    };

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final key = filters.keys.elementAt(index);
          final value = filters[key]!;
          final isSelected = _selectedFilter == key;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(value),
              selected: isSelected,
              onSelected: (selected) {
                setState(() => _selectedFilter = key);
              },
              selectedColor: const Color(0xFF5B5FE9),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFavoritesList() {
    List<Property> properties = _favoritesService.favoriteProperties;

    // Apply filters
    switch (_selectedFilter) {
      case 'recent':
        properties.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'low_price':
        properties.sort((a, b) => a.monthlyPrice.compareTo(b.monthlyPrice));
        break;
      case 'high_price':
        properties.sort((a, b) => b.monthlyPrice.compareTo(a.monthlyPrice));
        break;
    }

    return RefreshIndicator(
      onRefresh: _loadFavorites,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return Dismissible(
            key: Key(property.id),
            direction: DismissDirection.endToStart,
            background: Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            onDismissed: (direction) {
              _favoritesService.removeFavorite(property.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${property.title} removed from favorites'),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      _favoritesService.addFavorite(property);
                    },
                  ),
                ),
              );
            },
            child: PropertyCard(
              title: property.title,
              price: property.getFormattedPrice(RentalPeriod.monthly),
              address: '${property.area}, ${property.region}',
              beds: property.bedrooms,
              baths: property.bathrooms,
              kitchens: property.kitchens ?? 1,
              sqft: property.squareFeet != null
                  ? '${property.squareFeet} sqft'
                  : 'N/A',
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                size: 60,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No Favorites Yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF222222),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Start exploring houses and tap the heart icon to save your favorites',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B5FE9),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.search),
              label: const Text(
                'Browse Properties',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showClearConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Favorites?'),
        content: const Text(
          'This will remove all saved properties. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _favoritesService.clearFavorites();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All favorites cleared')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }
}
