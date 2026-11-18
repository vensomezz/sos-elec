// SOS Électricité — modèles d'e-mails clients (français uniquement).
// À utiliser dans les fonctions Supabase (create_guest_request, attribution
// d'un technicien…) à la place de l'ancien texte FR/EN.
//
// Exemple :
//   import { emailDemandeRecue } from "../_shared/emails.ts";
//   const { subject, html } = emailDemandeRecue({ ... });
//   await resend.emails.send({ from, to, subject, html });

const NAVY = "#0B1D3A";
const BLUE = "#1D4ED8";
const YELLOW = "#FFC400";
const RED = "#E53935";
const INK = "#14213D";
const MUTED = "#5B6478";
const LINE = "#E3E8F2";
const PAPER = "#F4F7FC";
const FONT =
  "'Poppins','Segoe UI',Roboto,Helvetica,Arial,sans-serif";
const TITLE_FONT =
  "'Montserrat','Segoe UI',Roboto,Helvetica,Arial,sans-serif";

const esc = (v: unknown) =>
  String(v ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/\n/g, "<br>");

/** « mardi 18 novembre 2026 à 10 h 24 » (heure de Paris). */
export function dateFr(d: Date | string | null | undefined): string {
  if (!d) return "";
  const date = typeof d === "string" ? new Date(d) : d;
  const jour = new Intl.DateTimeFormat("fr-FR", {
    weekday: "long",
    day: "numeric",
    month: "long",
    year: "numeric",
    timeZone: "Europe/Paris",
  }).format(date);
  const heure = new Intl.DateTimeFormat("fr-FR", {
    hour: "2-digit",
    minute: "2-digit",
    timeZone: "Europe/Paris",
  }).format(date).replace(":", " h ");
  return `${jour} à ${heure}`;
}

/** Un bloc « étiquette / valeur » bien séparé. */
function bloc(icone: string, label: string, valeur: string): string {
  if (!valeur) return "";
  return `
  <tr><td style="padding:0 0 14px 0;">
    <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${PAPER};border:1px solid ${LINE};border-radius:12px;">
      <tr><td style="padding:14px 18px;">
        <div style="font-family:${FONT};font-size:12px;letter-spacing:.3px;color:${MUTED};margin:0 0 6px 0;">${icone}&nbsp;&nbsp;${esc(label)}</div>
        <div style="font-family:${FONT};font-size:16px;line-height:1.5;color:${INK};font-weight:600;">${valeur}</div>
      </td></tr>
    </table>
  </td></tr>`;
}

function bouton(texte: string, url?: string, couleur = RED): string {
  if (!url) return "";
  return `
  <tr><td align="center" style="padding:10px 0 26px 0;">
    <a href="${esc(url)}" style="display:inline-block;background:${couleur};color:#ffffff;text-decoration:none;font-family:${TITLE_FONT};font-weight:700;font-size:16px;padding:15px 30px;border-radius:12px;">${esc(texte)}</a>
  </td></tr>`;
}

function gabarit(opts: {
  preheader: string;
  badge: string;
  badgeCouleur: string;
  titre: string;
  intro: string;
  corps: string;
}): string {
  return `<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>SOS Électricité</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700;800&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body style="margin:0;padding:0;background:${PAPER};">
<div style="display:none;max-height:0;overflow:hidden;">${esc(opts.preheader)}</div>
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:${PAPER};">
<tr><td align="center" style="padding:28px 12px;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:600px;background:#ffffff;border-radius:18px;overflow:hidden;border:1px solid ${LINE};">

    <!-- En-tête -->
    <tr><td style="background:${NAVY};padding:26px 28px;">
      <table role="presentation" cellpadding="0" cellspacing="0"><tr>
        <td style="width:44px;height:44px;background:${YELLOW};border-radius:22px;text-align:center;vertical-align:middle;font-size:24px;line-height:44px;">⚡</td>
        <td style="padding-left:14px;font-family:${TITLE_FONT};font-weight:800;font-size:22px;color:#ffffff;letter-spacing:.3px;">SOS Électricité</td>
      </tr></table>
      <div style="font-family:${FONT};font-size:13px;color:#C9D4EA;margin-top:8px;">Dépannage électrique 24h/24 · 7j/7</div>
    </td></tr>

    <!-- Contenu -->
    <tr><td style="padding:30px 28px 6px 28px;">
      <span style="display:inline-block;background:${opts.badgeCouleur};color:#ffffff;font-family:${FONT};font-size:12px;font-weight:600;padding:6px 12px;border-radius:20px;">${esc(opts.badge)}</span>
      <h1 style="font-family:${TITLE_FONT};font-weight:800;font-size:24px;line-height:1.25;color:${INK};margin:16px 0 10px 0;">${esc(opts.titre)}</h1>
      <p style="font-family:${FONT};font-size:15px;line-height:1.7;color:${MUTED};margin:0 0 24px 0;">${opts.intro}</p>
    </td></tr>
    <tr><td style="padding:0 28px;">
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0">
        ${opts.corps}
      </table>
    </td></tr>

    <!-- Pied -->
    <tr><td style="padding:8px 28px 28px 28px;">
      <div style="border-top:1px solid ${LINE};padding-top:18px;font-family:${FONT};font-size:13px;line-height:1.7;color:${MUTED};">
        Une question ? Répondez simplement à cet e-mail.<br>
        Merci de votre confiance,<br>
        <strong style="color:${INK};">L'équipe SOS Électricité</strong>
      </div>
    </td></tr>
  </table>
  <div style="font-family:${FONT};font-size:11px;color:${MUTED};margin-top:14px;">Vous recevez cet e-mail suite à votre demande d'intervention sur SOS Électricité.</div>
</td></tr>
</table>
</body>
</html>`;
}

// ---------------------------------------------------------------------------
// 1) Accusé de réception : envoyé juste après la demande
// ---------------------------------------------------------------------------
export interface DemandeRecue {
  nomClient: string;
  reference: string;
  dateDemande: Date | string;
  adresse: string;
  urgence: boolean; // true = urgence, false = rendez-vous
  creneauRdv?: Date | string | null;
  probleme: string;
  telephone?: string;
  lienSuivi?: string;
}

export function emailDemandeRecue(d: DemandeRecue) {
  const type = d.urgence ? "🚨 Urgence — intervention au plus vite" : "📅 Rendez-vous";
  const corps =
    bloc("🔖", "Référence de la demande", esc(d.reference)) +
    bloc("🕒", "Date et heure de la demande", esc(dateFr(d.dateDemande))) +
    bloc("📍", "Adresse d'intervention", esc(d.adresse)) +
    bloc("⚡", "Type d'intervention", esc(type)) +
    (!d.urgence && d.creneauRdv
      ? bloc("📅", "Créneau souhaité", esc(dateFr(d.creneauRdv)))
      : "") +
    bloc("🛠️", "Problème signalé", esc(d.probleme)) +
    bloc("📞", "Téléphone de contact", esc(d.telephone)) +
    bouton("Suivre ma demande", d.lienSuivi);

  return {
    subject: `Votre demande ${d.reference} a bien été reçue — SOS Électricité`,
    html: gabarit({
      preheader: `Demande ${d.reference} reçue. Nous recherchons un technicien.`,
      badge: "Demande reçue",
      badgeCouleur: BLUE,
      titre: `Bonjour ${d.nomClient}, votre demande est bien enregistrée.`,
      intro:
        "Nous recherchons dès maintenant un électricien disponible près de chez vous. " +
        "Vous recevrez un nouvel e-mail dès qu'un technicien aura confirmé l'intervention.",
      corps,
    }),
  };
}

// ---------------------------------------------------------------------------
// 2) Confirmation d'intervention : envoyée quand un technicien accepte
// ---------------------------------------------------------------------------
export interface InterventionConfirmee {
  nomClient: string;
  reference: string;
  nomTechnicien: string;
  telephoneTechnicien?: string;
  dateIntervention: Date | string; // heure d'arrivée prévue ou créneau
  adresse: string;
  probleme: string;
  dateDemande?: Date | string;
  acompte?: number | null;
  lienPaiementAcompte?: string;
  lienSuivi?: string;
}

const euros = (n?: number | null) =>
  n == null ? "" : `${n.toLocaleString("fr-FR", { minimumFractionDigits: n % 1 ? 2 : 0 })} €`;

export function emailInterventionConfirmee(d: InterventionConfirmee) {
  const corps =
    bloc("🔖", "Référence", esc(d.reference)) +
    bloc("👷", "Votre technicien", esc(d.nomTechnicien) +
      (d.telephoneTechnicien ? `<br><span style="font-weight:400;color:${MUTED};">${esc(d.telephoneTechnicien)}</span>` : "")) +
    bloc("🕒", "Date et heure d'intervention", esc(dateFr(d.dateIntervention))) +
    bloc("📍", "Adresse d'intervention", esc(d.adresse)) +
    bloc("🛠️", "Problème signalé", esc(d.probleme)) +
    (d.dateDemande ? bloc("📨", "Demande envoyée le", esc(dateFr(d.dateDemande))) : "") +
    (d.acompte ? bloc("💶", "Acompte à régler avant l'intervention", esc(euros(d.acompte))) : "") +
    bouton("Payer l'acompte", d.lienPaiementAcompte, RED) +
    bouton("Suivre mon intervention", d.lienSuivi, BLUE);

  return {
    subject: `Intervention confirmée — ${d.reference} — SOS Électricité`,
    html: gabarit({
      preheader: `${d.nomTechnicien} interviendra ${dateFr(d.dateIntervention)}.`,
      badge: "Intervention confirmée",
      badgeCouleur: "#2E7D32",
      titre: `Bonne nouvelle ${d.nomClient}, un technicien arrive !`,
      intro:
        "Votre intervention est confirmée. Voici tous les détails. " +
        "Merci de vous assurer qu'une personne soit présente à l'adresse indiquée.",
      corps,
    }),
  };
}
