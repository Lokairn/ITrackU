-- French localization file for frFR.
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ITrackU", "frFR")
if not L then return end

 -- Generic
L["LOADING_ADDON"] = "Welcome on ITrackU. Version 1.6.0 To open the configuration panel in game, type /ITU."


 -- Debuff module presentation
L["Module_Debuff_Name"] = "Module des Debuffs"
L["Module_Debuff_Title"] = "Module : Debuffs"
L["Module_Debuff_Activate_Description"] = "Activer le tracker de stuns durant les combats"
L["Module_Debuff_Description_Header"] = "Module des debuffs : Description"
L["Module_Debuff_Description"] = "Le tracker de module de debuff ITrackU a pour objectif de ..."
L["Module_Debuff_Close_Frame"] = "Fermer la fenêtre"
L["Module_Debuff_Open_Frame"] = "Ouvrir la fenêtre"
L["Module_Debuff_Move_Frame_Header"] = "Déplacer la fenêtre"
L["Module_Debuff_Lock_Frame"] = "Déplacer la fenêtre principale"
L["Module_Debuff_Header_Pos_Dimension"] = "Position & Dimension"
L["Module_Debuff_Description_Pos_Dimension"] = "Modifier la position et la dimension de toutes les fenêtres."
L["Module_Debuff_Global_Width"] = "Largeur des barres de personnage"
L["Module_Debuff_Description_Dimension_Heights"] = "Modifier la hauteur de la fênetre de titre ou/et la hauteur des fenêtres de debuff"
L["Module_Debuff_Height_Title"] = "Hauteur des titres"
L["Module_Debuff_Height_Debuffed"] = "Hauteur des barres de personnage"
L["Module_Debuff_Header_Space_Between_Item"] = "Espace entre les éléments"
L["DESCRIPTION_SPACE_BETWEEN_ITEM"] = "Modifier l'espace entre chaque élément"
L["SPACE_TITLE_TITLE"] = "Espace entre les titres"
L["SPACE_TITLE_DEBUFFED"] = "Espace entre titres et barres de personnage"
L["SPACE_DEBUFFED_DEBUFFED"] = "Espace entre barres de personnage"
L["SPACE_BETWEEN_COLUMNS"] = "Espace entre colonnes"
L["ICON_ZOOM_PERCENTAGE"] = "Pourcentage du zoom sur icône"
L["ColorPanel"] = "Couleurs"
L["HEADER_COLOR_TITRE"] = "Titres"
L["HEADER_COLOR_TITRE_DESCRIPTION"] = "Modifier la couleur des fenêtres de titre et de la police."
L["COLOR_BACKGROUND_TITRE"] = "Couleur du Titre"
L["HEADER_COLOR_PLAYERDEBUFFED"] = "Joueur subissant un Debuff"
L["HEADER_COLOR_PLAYERDEBUFFED_DESCRIPTION"] = "Modifier la couleur de la fenêtre d'un joueur subissant un Debuff pour : Vous-même / Cible / Autre Joueur / Max Stacks"
L["ENABLE_CLASS_COLOR_PLAYER"] = "Activer les couleurs par Classe pour le Joueur"
L["ALPHA_CLASS_COLOR_PLAYER"] = "Transparence"
L["COLOR_BACKGROUND_PLAYER"] = "Couleur du Joueur"
L["ENABLE_CLASS_COLOR_FOCUS"] = "Activer les couleurs par Classe pour la Cible"
L["ALPHA_CLASS_COLOR_FOCUS"] = "Transparence"
L["COLOR_BACKGROUND_FOCUS"] = "Couleur de la Cible"
L["ENABLE_CLASS_COLOR_MATE"] = "Activer les couleurs par Classe pour les Alliés"
L["ALPHA_CLASS_COLOR_MATE"] = "Transparence"
L["COLOR_BACKGROUND_MATE"] = "Couleur des membres du groupe"
L["COLOR_BACKGROUND_MAXSTACKS"] = "Couleur des Stacks Maximum"
L["ALPHA_BACKGROUND_PLAYERDEBUFFED"] = "Transparence"
L["HEADER_PLAYERDISTANCE"] = "Distance du Joueur"
L["DESCRIPTION_PLAYERDISTANCE"] = "Modifier la couleur de la fenêtre créée lors de la traque d'un sort ou d'un stack."
L["COLOR_DISTANCE_OK"] = "Fenêtre de Distance : OK"
L["COLOR_DISTANCE_KO"] = "Fenêtre de Distance : KO "
L["HEADER_FONTS"] = "Police"
L["FONTS_TITRE"] = "Police des Titres"
L["FONT_TITRE_SIZE"] = "Taille de Police des Titres"
L["FONTS_DEBUFFED_NAME"] = "Police des Debuffs"
L["FONT_DEBUFFED_NAME_SIZE"] = "Taille de Police des Debuffs"
L["FONTS_DEBUFFED_STACK"] = "Police des Stacks de Debuff"
L["FONT_DEBUFFED_STACK_SIZE"] = "Taille de Police des Stacks de Debuff"
L["HEADER_DEBUFF_SELECT"] = "Selectionner Raid et Boss"
L["DESC_DEBUFF_SELECT"] = "Selectionner le Raid puis le Boss dont vous voulez contrôler les Buffs et Debuffs. Vous pourrez modifier/ajouter/supprimer les sorts."
L["SELECT_EXTENSIONS"] = "Extensions"
L["SELECT_RAID_OR_DUNGEON"] = "Raids ou Donjons"
L["SELECT_DIFFICULTY"] = "Difficulté"
L["HEADER_SELECT_SPELL"] = "Gérer les Sorts"
L["DESC_SELECT_SPELL"] = "Gérer les sorts ici, Ajouter ceux que vous voulez traquer pendant le combat."
L["SELECT_SPELL"] = "Sorts Traqués"
L["ACTIVATE"] = "Activer le tracking des sorts durant le combat."
L["DESACTIVATE"] = "Desactiver le tracking des sorts durant le combat."
L["Activated"] = "Activé"
L["Desactivated"] = "Desactivé"
L["IF_ACTIVE"] = "Fenêtre toujours active"
L["IF_ACTIVE_DESCRIPTION"] = "Ouvrir la fenêtre de titre si buff/debuff n'est pas actif."
L["TYPE"] = "Type de Buff/Debuff"
L["TYPE_DISTANCE"] = "Distance des Buff/Debuff"
L["PLAYERONLY"] = "Joueurs à traquer"
L["MAXSTACKS"] = "Alerte des Stacks"
L["MAXSTACKSNUMBER"] = "Nombre de Stacks"
L["COLUMNS"] = "Séparer vos sorts en 3 colonnes"
L["DELETE_SPELL_BUTTON"] = "Supprimer"
L["HEADER_ADD_SPELL"] = "Ajouter un Sort"
L["DESC_ADD_SPELL"] = "Ajouter un sort en utilisant le Nom ou l'ID."
L["ADD_SPELL_BUTTON"] = "Ajouter un Sort"
L["SPELL_DOESNT_EXIST"] = "Le sort que vous essayez d'ajouter n'existe pas"
L["SPELL_ALREADY_REGISTRED"] = "Vous avez déjà répertorié ce sort"
L["HORIZONTAL_ALIGNEMENT_HEADER"] = "Alignement Horizontal"
L["HORIZONTAL_ALIGNEMENT_SELECT"] = "Alignement"


 -- Stuns module presentation
L["Module_Stuns_Name"] = "Module des Stuns"
L["Module_Stuns_Title"] = "Module : Stuns"
L["Module_Stuns_Description_Header"] = "Module des Stuns : Description"
L["Module_Stuns_Description"] = "Le tracker de module de stuns ITrackU a pour objectif de ..."
L["Module_Stuns_Activate_Name"] = "Activer"
L["Module_Stuns_Activate_Description"] = "Activer le traqueur des stuns en donjons"
L["Module_Stuns_Header_Pos"] = "Position"
L["Module_Stuns_Header_Dimension"] = "Dimension"
L["STUN_POSITION_X"] = "Position X"
L["STUN_POSITION_Y"] = "Position Y"
L["STUN_HEIGHT"] = "Hauteur"
L["STUN_HEIGHT_BETWEEN_STUNS"] = "Hauteur entre chaque fenêtre"
L["COLORS_STUNS_SPELLS_OK"] = "Couleur de Sort Prêt"
L["COLORS_STUNS_SPELLS_KO"] = "Couleur de Sort en Recharge"
L["COLORS_A_STUNS_SPELL_STATUSBAR_KO"] = "Transparence du sort en Recharge"
L["FONT_STUNS_HEADER"] = "Police"
L["VERTICAL_ALIGNEMENT_HEADER"] = "Alignement Vertical"
L["VERTICAL_ALIGNEMENT_SELECT"] = "Alignement"
L["STUN_DIFFICULTY_ACTIVATION_HEADER"] = "Activation du module par difficulté de donjons"
L["FONT_STUNS_SIZE"] = "Taille de police"

 L["ADD_ADDED_TO_BDD"] = "Une nouvel ennemi a été ajouté à la liste des stuns : "


 -- Profiles module
L["Profiles"] = "Profils"
L["SELECT_PROFILE"] = "Selectionner un profil"



 --Dungeons 
L["Atal Dazar"] = "Atal'Dazar"
  L["Alunza"] = "Prêtresse Alun'za"
  L["Rezan"] = "Rezan"
  L["Vol'kaal"] = "Vol'kaal"
  L["Yazma"] = "Yazma"
 L["Freehold"] = "Port-Liberté"
  L["Ring of Booty"] = "Arène du Butin"
  L["Council o' Captains"] = "Conseil des Capitaines"
  L["Skycap'n Kragg"] = "Cap'taine céleste Kragg"
  L["Harlan Sweete"] = "Harlan Sweete"
 L["Kings Rest"] = "Repos des Rois"
  L["Dazar"] = "Dazar, le premier roi"
  L["The Golden Serpent"] = "Le serpent doré"
  L["Mummification Construct"] = "Mchimba l'Embaumeur"
  L["The Warring Warlords"] = "Le conseil des tribus"
  
L["Shrine Of The Storm"] = "Sanctuaire des Tempêtes"
  L["Aqu'sirr"] = "Aqu'sire"
  L["Tidesage Coucil"] = "Conseil des Augures"
  L["Lord Stormsong"] = "Seigneur Chantorage"
  L["Volzith"] = "Vol'zith l'Insidieuse"
  
L["Siege Of Boralus"] = "Siège de Boralus"
  L["Behamat"] = "Viq'Goth"
  L["Sergeant Bainbridge"] = "Sergent Bainbridge"
  L["Hadal Darkfathom"] = "Hadal Sombrabysse"
  L["Dread Captain Lockwood"] = "Capitaine de l'effroi Boisclos"
  
L["Temple Of Sethraliss"] = "Temple de Sephraliss"
  L["Adderis and Aspix"] = "Viperis et Aspis"
  L["Avatar of Sethraliss"] = "Avatar de Sephraliss"
  L["Galvazzt"] = "Galvazzt"
  L["Merektha"] = "Merekpha"
  
L["The Motherlode"] = "Le Filon"
  L["Tik'ali"] = "Azerokk"
  L["Rixxa Fluxflame"] = "Rixxa Fluxifuge"
  L["Mogul Razzdunk"] = "Nabab Razzbam"
  L["Coin-Operated Crowd Pummeler"] = "Disperseur de foule automatique"
  
L["Tol Dagor"] = "Tol Dagor"
  L["Jes Howlis"] = "Jes Hurley"
  L["Overseer Korgus"] = "Surveillant Korgus"
  L["The Sand Queen"] = "La Reine des Sables"
  L["Knight Captain Valyri"] = "Chevalier-capitaine Valyri"
  
L["Underrot"] = "Les tréfonds Putrides"
  L["Unbound Abomination"] = "Monstruosité Déchaînée"
  L["Infested Crawg"] = "Gueule-de-pierre l'Infesté"
  L["Elder Leaxa"] = "Leaxa l'Aînée"
  L["Sporecaller Zancha"] = "Zancha le Mande-spores"
  
L["Waycrest Manor"] = "Manoir Malvoie"
  L["Soulbound Goliath"] = "Goliath des âmes"
  L["Gorak Tul"] = "Gorak Tul"
  L["Heartsbane Triad"] = "Triade malecarde"
  L["Raal the Gluttonous"] = "Raal le Bâfreur"
  L["Lord and Lady Waycrest"] = "Seigneur et Dame Malvoie"
  
-- Raids
L["Uldir"] = "Uldir"
  L["Devourer"] = "Devoreur fétide"
  L["Ghuun"] = "G'huun"
  L["Mother"] = "DAME"
  L["Mythrax"] = "Mythrax le Disloqueur"
  L["Taloc"] = "Taloc"
  L["Vectis"] = "Vectis"
  L["Zekvoz"] = "Zek'voz, héraut de N'zoth"
  L["Zul"] = "Zul, ressucité" 
