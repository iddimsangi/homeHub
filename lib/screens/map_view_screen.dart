import 'package:flutter/material.dart';
import '../models/property.dart';

/// Map View Screen for Home Hub
/// Shows properties on an interactive map with user location
/// Phase 1: Placeholder UI - Phase 2: Full Google Maps integration
class MapViewScreen extends StatefulWidget {
  final List<Property>? properties;
  final Property? selectedProperty;

  const MapViewScreen({
    super.key,
    this.properties,
    this.selectedProperty,
  });

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map placeholder - Will be replaced with Google Maps in Phase 2
          _buildMapPlaceholder(),

          // Top app bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _buildCircleButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  _buildCircleButton(
                    icon: Icons.layers_outlined,
                    onTap: _showMapTypeOptions,
                  ),
                  const SizedBox(width: 12),
                  _buildCircleButton(
                    icon: Icons.my_location,
                    onTap: _centerOnUserLocation,
                  ),
                ],
              ),
            ),
          ),

          // Bottom property preview card
          if (widget.selectedProperty != null)
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: _buildPropertyPreviewCard(widget.selectedProperty!),
            ),

          // Floating action buttons
          Positioned(
            right: 16,
            bottom: widget.selectedProperty != null ? 180 : 100,
            child: Column(
              children: [
                _buildFAB(
                  icon: Icons.directions,
                  label: 'Directions',
                  onTap: _getDirections,
                ),
                const SizedBox(height: 12),
                _buildFAB(
                  icon: Icons.list,
                  label: 'List View',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      color: const Color(0xFFE8F5E9),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 80,
                    color: Colors.green[700],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Map View',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Coming Soon',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.info_outline, color: Colors.blue[700], size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Google Maps integration in Phase 2',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Simulated map pins
            _buildSimulatedMapPins(),
          ],
        ),
      ),
    );
  }

  Widget _buildSimulatedMapPins() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green.withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          const Text(
            'Planned Features:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildFeatureItem('📍 Live user location'),
          _buildFeatureItem('🏠 Property markers on map'),
          _buildFeatureItem('🔍 Tap pins to view details'),
          _buildFeatureItem('🚗 Directions to properties'),
          _buildFeatureItem('🎯 Cluster properties by area'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0xFF5B5FE9)),
      ),
    );
  }

  Widget _buildPropertyPreviewCard(Property property) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: property.images.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      property.images.first,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(Icons.home, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  property.area,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  property.getFormattedPrice(RentalPeriod.monthly),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5B5FE9),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 20),
            onPressed: () {
              // Navigate to property details
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFAB({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF5B5FE9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5B5FE9).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMapTypeOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Map Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildMapTypeOption('Normal', Icons.map, true),
            _buildMapTypeOption('Satellite', Icons.satellite, false),
            _buildMapTypeOption('Terrain', Icons.terrain, false),
          ],
        ),
      ),
    );
  }

  Widget _buildMapTypeOption(String title, IconData icon, bool selected) {
    return ListTile(
      leading:
          Icon(icon, color: selected ? const Color(0xFF5B5FE9) : Colors.grey),
      title: Text(title),
      trailing:
          selected ? const Icon(Icons.check, color: Color(0xFF5B5FE9)) : null,
      onTap: () {
        Navigator.pop(context);
        // Change map type
      },
    );
  }

  void _centerOnUserLocation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Centering on your location...')),
    );
  }

  void _getDirections() {
    // Show directions options
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get Directions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDirectionOption('Google Maps', 'assets/google.png'),
            _buildDirectionOption('Bolt', 'assets/bolt.png'),
            _buildDirectionOption('Uber', 'assets/uber.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildDirectionOption(String title, String? icon) {
    return ListTile(
      leading: icon != null
          ? Image.asset(icon, width: 30, height: 30)
          : const Icon(Icons.navigation),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Opening $title...')),
        );
      },
    );
  }
}
