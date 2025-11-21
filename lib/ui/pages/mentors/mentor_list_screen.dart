import 'package:flutter/material.dart';
import '../../../data/services/constants.dart';
import '../../../data/models/mentor_models.dart';
import '../../../core/theme/theme.dart';
import 'mentor_chat_screen.dart';

/// Second screen - shows list of mentors within a selected realm
class MentorListScreen extends StatelessWidget {
  final MentorRealm realm;

  const MentorListScreen({super.key, required this.realm});

  Color _parseColor(String hexColor) {
    final hex = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final mentorsInRealm = MentorConstants.getMentorsByRealm(realm.id);

    return Scaffold(
      backgroundColor: WFColors.base,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // App bar with realm info
          SliverAppBar(
            backgroundColor: _parseColor(realm.gradient[0]),
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    realm.icon,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      realm.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              titlePadding: const EdgeInsets.only(left: 56, bottom: 16, right: 16),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _parseColor(realm.gradient[0]),
                      _parseColor(realm.gradient[1]),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          realm.subtitle,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Mentor count
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Text(
                '${mentorsInRealm.length} Legendary Mentors',
                style: TextStyle(
                  color: WFColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          
          // Mentor cards
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final mentor = mentorsInRealm[index];
                  return AnimatedMentorCard(
                    mentor: mentor,
                    index: index,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MentorChatScreen(mentor: mentor),
                        ),
                      );
                    },
                  );
                },
                childCount: mentorsInRealm.length,
              ),
            ),
          ),
          
          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }
}

/// Mentor card - one per row with image on left, info on right
class AnimatedMentorCard extends StatefulWidget {
  final Mentor mentor;
  final int index;
  final VoidCallback onTap;

  const AnimatedMentorCard({
    super.key,
    required this.mentor,
    required this.index,
    required this.onTap,
  });

  @override
  State<AnimatedMentorCard> createState() => _AnimatedMentorCardState();
}

class _AnimatedMentorCardState extends State<AnimatedMentorCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 400 + (widget.index * 80)),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Start animation
    Future.delayed(Duration(milliseconds: 40 * widget.index), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _parseColor(String hexColor) {
    final hex = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GestureDetector(
            onTap: widget.onTap,
            onTapDown: (_) => setState(() => _isPressed = true),
            onTapUp: (_) => setState(() => _isPressed = false),
            onTapCancel: () => setState(() => _isPressed = false),
            child: AnimatedScale(
              scale: _isPressed ? 0.97 : 1.0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: WFColors.cardDark,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: WFColors.border.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Square portrait on left
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _parseColor(widget.mentor.color[0]),
                            _parseColor(widget.mentor.color[1]),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _parseColor(widget.mentor.color[1])
                                .withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.mentor.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback to emoji avatar
                            return Center(
                              child: Text(
                                widget.mentor.avatar,
                                style: const TextStyle(fontSize: 40),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    
                    // Info on right
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name (bold, larger)
                          Text(
                            widget.mentor.name,
                            style: const TextStyle(
                              color: WFColors.textPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          
                          // Subtitle
                          Text(
                            widget.mentor.subtitle,
                            style: TextStyle(
                              color: _parseColor(widget.mentor.color[0]),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          
                          // Long description (2-3 lines)
                          Text(
                            widget.mentor.longDescription,
                            style: TextStyle(
                              color: WFColors.textSecondary,
                              fontSize: 14,
                              height: 1.4,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    
                    // Arrow icon
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: WFColors.textSecondary.withOpacity(0.6),
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

