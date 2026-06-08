import 'package:flutter/material.dart';

// Method 1: Styled SnackBar with custom properties
void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(child: Text(message, style: const TextStyle(fontSize: 16))),
        ],
      ),
      backgroundColor: const Color(0xFF10B981), // Green
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'DISMISS',
        textColor: Colors.white,
        onPressed: () {},
      ),
    ),
  );
}

// Method 2: Fully custom SnackBar widget
void showBeautifulSnackBar(
  BuildContext context, {
  required String message,
  required SnackBarType type,
}) {
  final messenger = ScaffoldMessenger.of(context);

  // Kill any currently showing SnackBar
  messenger.hideCurrentSnackBar();

  final config = _getSnackBarConfig(type);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: config.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: config.backgroundColor.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(config.icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    config.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
    ),
  );
}

// Method 3: Animated custom overlay (not using SnackBar)
void showAnimatedToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => _AnimatedToast(
      message: message,
      onDismiss: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  });
}

// Helper classes
enum SnackBarType { success, error, warning, info }

class _SnackBarConfig {
  final Color backgroundColor;
  final IconData icon;
  final String title;

  _SnackBarConfig({
    required this.backgroundColor,
    required this.icon,
    required this.title,
  });
}

_SnackBarConfig _getSnackBarConfig(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return _SnackBarConfig(
        backgroundColor: const Color(0xFF10B981),
        icon: Icons.check_circle,
        title: 'Success',
      );
    case SnackBarType.error:
      return _SnackBarConfig(
        backgroundColor: const Color(0xFFEF4444),
        icon: Icons.error,
        title: 'Error',
      );
    case SnackBarType.warning:
      return _SnackBarConfig(
        backgroundColor: const Color(0xFFF59E0B),
        icon: Icons.warning,
        title: 'Warning',
      );
    case SnackBarType.info:
      return _SnackBarConfig(
        backgroundColor: const Color(0xFF3B82F6),
        icon: Icons.info,
        title: 'Info',
      );
  }
}

// Animated toast widget
class _AnimatedToast extends StatefulWidget {
  final String message;
  final VoidCallback onDismiss;

  const _AnimatedToast({required this.message, required this.onDismiss});

  @override
  State<_AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: -100,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 16,
      right: 16,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.notifications, color: Colors.white),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Demo screen showing all examples
class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom SnackBar Examples'),
        backgroundColor: const Color(0xFF8B5CF6),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E1B4B), Color(0xFF312E81)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Custom SnackBars',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // Simple custom snackbar
                _buildButton(
                  context,
                  'Simple Custom SnackBar',
                  Colors.green,
                  () => showCustomSnackBar(
                    context,
                    'This is a simple custom snackbar!',
                  ),
                ),

                // Success
                _buildButton(
                  context,
                  'Success Message',
                  const Color(0xFF10B981),
                  () => showBeautifulSnackBar(
                    context,
                    message: 'Your action completed successfully!',
                    type: SnackBarType.success,
                  ),
                ),

                // Error
                _buildButton(
                  context,
                  'Error Message',
                  const Color(0xFFEF4444),
                  () => showBeautifulSnackBar(
                    context,
                    message: 'Something went wrong. Please try again.',
                    type: SnackBarType.error,
                  ),
                ),

                // Warning
                _buildButton(
                  context,
                  'Warning Message',
                  const Color(0xFFF59E0B),
                  () => showBeautifulSnackBar(
                    context,
                    message: 'Please be careful with this action.',
                    type: SnackBarType.warning,
                  ),
                ),

                // Info
                _buildButton(
                  context,
                  'Info Message',
                  const Color(0xFF3B82F6),
                  () => showBeautifulSnackBar(
                    context,
                    message: 'Here is some useful information for you.',
                    type: SnackBarType.info,
                  ),
                ),

                // Animated toast
                _buildButton(
                  context,
                  'Animated Toast (Overlay)',
                  const Color(0xFF8B5CF6),
                  () =>
                      showAnimatedToast(context, 'This is an animated toast!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    Color color,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
