import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';

/// Bucket Supabase où sont rangées les photos et vidéos des demandes.
const String kRequestMediaBucket = 'service_request_photos';

/// Vrai si l'adresse pointe vers une vidéo.
bool isVideoUrl(String url) {
  final u = url.toLowerCase().split('?').first;
  return u.endsWith('.mp4') ||
      u.endsWith('.mov') ||
      u.endsWith('.webm') ||
      u.endsWith('.m4v');
}

/// Transforme le champ `photo_urls` (liste JSON, texte JSON ou liste)
/// en liste d'adresses propres.
List<String> mediaUrlsFrom(dynamic value) {
  dynamic v = value;
  if (v is String) {
    final s = v.trim();
    if (s.isEmpty) return [];
    try {
      v = jsonDecode(s);
    } catch (_) {
      return [s];
    }
  }
  if (v is List) {
    final out = <String>[];
    for (final e in v) {
      if (e is List) {
        out.addAll(mediaUrlsFrom(e));
      } else if (e != null && e.toString().trim().isNotEmpty) {
        out.add(e.toString().trim());
      }
    }
    return out;
  }
  return [];
}

/// Boutons « Ajouter une photo » et « Ajouter une vidéo ».
/// Envoie le fichier dans Supabase Storage puis renvoie son adresse.
class MediaPickerButtons extends StatefulWidget {
  const MediaPickerButtons({super.key, required this.onAdded});

  final void Function(String url) onAdded;

  @override
  State<MediaPickerButtons> createState() => _MediaPickerButtonsState();
}

class _MediaPickerButtonsState extends State<MediaPickerButtons> {
  bool _uploading = false;

  Future<void> _pick({required bool video}) async {
    if (_uploading) return;
    final selected = await selectMediaWithSourceBottomSheet(
      context: context,
      storageFolderPath: 'service_request',
      allowPhoto: !video,
      allowVideo: video,
      imageQuality: 80,
      maxWidth: 1600,
    );
    if (selected == null || selected.isEmpty) return;
    if (!selected.every((m) => validateFileFormat(m.storagePath, context))) {
      return;
    }
    for (final m in selected) {
      if (video && m.bytes.length > 50 * 1024 * 1024) {
        _snack('Vidéo trop lourde (50 Mo maximum). / Video too large (50 MB max).');
        return;
      }
    }
    setState(() => _uploading = true);
    try {
      final urls = await uploadSupabaseStorageFiles(
        bucketName: kRequestMediaBucket,
        selectedFiles: selected,
      );
      for (final u in urls) {
        if (u.isNotEmpty) widget.onAdded(u);
      }
    } catch (_) {
      _snack(video
          ? 'La vidéo n\'a pas pu être envoyée. Réessayez. / The video could not be uploaded.'
          : 'La photo n\'a pas pu être envoyée. Réessayez. / The photo could not be uploaded.');
    } finally {
      if (mounted) setState(() => _uploading = false);
    }
  }

  void _snack(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    Widget btn(IconData icon, String label, bool video) => Expanded(
          child: OutlinedButton.icon(
            onPressed: _uploading ? null : () => _pick(video: video),
            icon: Icon(icon, size: 22),
            label: Text(
              label,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: theme.primary,
              minimumSize: const Size(0, 52),
              side: BorderSide(color: theme.primary, width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
        );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            btn(Icons.photo_camera_rounded, 'Photo', false),
            const SizedBox(width: 12),
            btn(Icons.videocam_rounded, 'Vidéo', true),
          ],
        ),
        if (_uploading)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: theme.primary),
                ),
                const SizedBox(width: 10),
                Text('Envoi en cours… / Uploading…',
                    style: GoogleFonts.poppins(fontSize: 13)),
              ],
            ),
          ),
      ],
    );
  }
}

/// Galerie horizontale de photos et vidéos. Un appui ouvre le fichier.
/// Si [onRemove] est fourni, une croix permet de retirer un élément.
class MediaGallery extends StatelessWidget {
  const MediaGallery({
    super.key,
    required this.urls,
    this.height = 96,
    this.onRemove,
    this.emptyText,
  });

  final List<String> urls;
  final double height;
  final void Function(String url)? onRemove;
  final String? emptyText;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    if (urls.isEmpty) {
      if (emptyText == null) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(emptyText!,
            style: GoogleFonts.poppins(
                fontSize: 13, color: theme.secondaryText)),
      );
    }
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: urls.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final url = urls[i];
          final video = isVideoUrl(url);
          final tile = ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: height * 1.25,
              height: height,
              color: video ? const Color(0xFF14181B) : theme.alternate,
              child: video
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_circle_fill_rounded,
                            color: Colors.white, size: 36),
                        const SizedBox(height: 4),
                        Text('Vidéo',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12)),
                      ],
                    )
                  : Image.network(
                      url,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Icon(
                          Icons.broken_image_outlined,
                          color: theme.secondaryText),
                    ),
            ),
          );
          return Stack(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => launchURL(url),
                child: tile,
              ),
              if (onRemove != null)
                Positioned(
                  top: 4,
                  right: 4,
                  child: InkWell(
                    onTap: () => onRemove!(url),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(3),
                      child: const Icon(Icons.close,
                          color: Colors.white, size: 16),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Raccourci : galerie directement à partir du champ `photo_urls`.
class RequestMediaGallery extends StatelessWidget {
  const RequestMediaGallery({super.key, required this.photoUrls, this.height = 110});

  final dynamic photoUrls;
  final double height;

  @override
  Widget build(BuildContext context) => MediaGallery(
        urls: mediaUrlsFrom(photoUrls),
        height: height,
        emptyText: 'Aucune photo ni vidéo / No photo or video',
      );
}
