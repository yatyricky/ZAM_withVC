#define NUMBER_OF_MAX_PLAYERS 6
#define MOB_PID 10
#define FORCE_NPCS "Adventurers"
#define FORCE_ENEMY "The Dark Below"

#define INIT_X 5822.0
#define INIT_Y -11907.0

#define DAMAGE_NAME_MELEE "Normal Attack"

#define ATT_STR 1
#define ATT_AGI 2
#define ATT_INT 3
#define ATT_NON 4

#define CAREER_TYPE_TANK 32
#define CAREER_TYPE_HEALER 2
#define CAREER_TYPE_DPS 4
#define CAREER_TYPE_MINION 64
#define CAREER_TYPE_BOSS 8
#define CAREER_TYPE_CREEP 16

#define BUFF_CATE_ALL 2
#define BUFF_PHYX 4
#define BUFF_MAGE 5
#define BUFF_POS 10
#define BUFF_NEG 20

#define DUMMY_X -8500
#define DUMMY_Y -11000

#define OID_ATTACK 851983
#define OID_MOVE 851986
#define OID_SMART 851971
#define OID_STOP 851972
#define OID_HOLD 851993
#define OID_FROSTARMORON 852458
#define OID_FROSTARMOROFF 852459
#define OID_IMMOLATIONON 852177
#define OID_IMMOLATIONOFF 852178
#define OID_BEARFORM 852138
#define OID_UNBEARFORM 852139

#define ORDER_TYPE_IMMEDIATE 1
#define ORDER_TYPE_TARGET 4
#define ORDER_TYPE_POINT 2

// dummy ability
#define SIDATTACKLL 1
#define SID_GENERAL_STUN 'A001'
#define SID_HAUNT 'A04A'
#define SIDHEALTESTER 'A04H'

// 血精灵防御者
#define UTIDBLOODELFDEFENDER 'Hmkg'
#define SIDSHIELDBLOCK 'A002'
#define SIDSUNFIRESTORM 'A003'
#define SIDARCANESHOCK 'A004'
#define SIDDISCORD 'A005'
#define SIDSHIELDOFSINDOREI 'A006'
// 利爪德鲁依
#define UTIDCLAWDRUID 'Hlgr'
#define SID_LACERATE 'A01F'
#define BID_LACERATE 'A02K'
#define SID_SAVAGE_ROAR 'A010'
#define SID_FOREST_CURE 'A0A1'
#define SID_NATURAL_REFLEX 'A016'
#define SID_SURVIVAL_INSTINCTS 'A0A2'
#define SIDMANGLE 'A014'
#define SIDGNAW 'A015'
// 丛林守护者
#define UTIDKEEPEROFGROVE 'Emfr'
#define SIDLIFEBLOOM 'A00D'
#define BID_LIFE_BLOOM 'A011'
#define SIDREJUVENATION 'A01X'
#define BID_REJUVENATION 'A02G'
#define SIDREGROWTH 'A01Y'
#define BID_REGROWTH 'A02J'
#define SIDSWIFTMEND 'A020'
#define SIDTRANQUILITY 'A01Z'
#define SIDTRANQUILITY1 'A04J'
// 圣骑士
#define UTIDPALADIN 'Hart'
#define SIDFLASHLIGHT 'A00K'
#define SIDFLASHLIGHT1 'A02C'
#define SIDHOLYLIGHT 'A00L'
#define SIDHOLYLIGHT1 'A028'
#define SIDHOLYSHOCK 'A00M'
#define SIDDIVINEFAVOR 'A00N'
#define SIDBEACONOFLIGHT 'A00O'
#define SIDIMPROVEFLASHLIGHT 'A02B'
// 牧师
#define UTIDPRIEST 'Ofar'
#define SIDHEAL 'A03V'
#define BID_HEAL 'A03X'
#define SIDDISPEL 'A00R'
#define SIDSHIELD 'A01C'
#define BID_SHIELD 'A01I'
#define BID_SHIELD_SOUL_WEAK 'A01J'
#define SIDPRAYEROFMENDING 'A01D'
#define SIDPRAYEROFHEALING 'A03W'
// 黑暗猎手
#define UTIDDARKRANGER 'Nbrn'
#define SIDDARKARROW 'A009'
#define SIDCONCERNTRATION 'A00A'
#define SIDFREEZINGTRAP 'A00C'
#define SIDPOWEROFABOMINATION 'A00F'
#define SIDDEATHPACT 'A00G'
#define SIDSUMMONGHOUL 'A02X'
#define UTIDGHOUL 'ugho'
#define SIDLIFELEECH 'A03Y'
#define BID_FREEZING_TRAP 'A041'
// blade master
#define UTIDBLADEMASTER 'Obla'
#define SID_HEROIC_STRIKE 'A0BO'
#define BID_HEROIC_STRIKE 'A0BP'
#define SIDREND 'A00B'
#define SIDOVERPOWER 'A027'
#define SIDMORTALSTRIKE 'A00E'
#define SIDEXECUTELEARN 'A00I'
#define SIDEXECUTESTART 'A02Q'
#define SIDEXECUTE1 'A02R'
#define SIDEXECUTE2 'A02S'
#define SIDEXECUTE3 'A02T'
#define SIDEXECUTE4 'A02U'
#define SIDEXECUTEEND 'A02V'
#define SIDVALOURAURA 'A007'
#define BID_REND 'A008'
// 寒冰法师
#define UTIDFROSTMAGE 'Hjai'
#define SIDFROSTBOLT 'A01S'
#define SIDBLIZZARD 'A01T'
#define SIDBLIZZARD1 'A03H'
#define SIDFROSTNOVA 'A01U'
#define SIDPOLYMORPH 'A01W'
#define SIDPOLYMORPH1 'A03F'
#define SIDPOLYMORPHDUMMY 'A02F'
#define SID_SPELL_TRANSFER 'A00V'
#define SIDINTELLIGENCECHANNEL 'A00Q'
#define BID_POLYMORPH 'A03E'
// 地缚者
#define UTIDEARTHBINDER 'Hapm'
#define UTID_EARTH_BINDER_ASC 'H006'
#define UTIDLIGHTNINGTOTEM 'u000'
#define UTID_EARTH_BIND_TOTEM 'u001'
#define UTID_TORRENT_TOTEM 'u002'
#define SIDSTORMSTRIKE 'A01B'
#define SID_STORM_LASH 'A0AG'
#define SIDEARTHSHOCK 'A01G'
#define SIDEARTHSHOCK1 'A033'
#define SIDPURGE 'A01H'
#define SIDENCHANTEDTOTEM 'A01M'
#define SIDLIGHTNINGTOTEM 'A036'
#define SIDEARTHBINDTOTEM 'A038'
#define SIDTORRENTTOTEM 'A037'
#define SIDCHARGE 'A01P'
#define SID_ASCENDANCE 'A0A0'
#define BID_EARTH_BIND_TOTEM 'A03A'
// 流浪剑客
#define UTIDROGUE 'Edem'
#define SIDAPIV 'Apiv'
#define SIDSINISTERSTRIKE 'A00W'
#define SIDEVISCERATE 'A00X'
#define SIDASSAULT 'A00Z'
#define SIDBLADEFLURRY 'A013'
#define SIDSTEALTH 'A017'
#define SIDGARROTE 'A04N'
#define SIDAMBUSH 'A04O'
#define BID_EVISCERATE 'A0AT'
// Heretic
#define UTIDHEATHEN 'Hblm'
#define SIDPAIN 'A01L'
#define BID_PAIN 'A01V'
#define BID_PAIN_WEAKNESS 'A021'
#define SIDMARROWSQUEEZE 'A01N'
#define SIDMINDFLAY 'A01O'
#define SIDDEATH 'A01Q'
#define SIDTERROR 'A01R'

// BOSS
#define SIDFRENZYCREEP 'A03P'
#define SIDRAGECREEP 'A03Q'

// 大修补匠
#define UTID_ARCH_TINKER 'Ntin'
#define UTID_ARCH_TINKER_MORPH 'Nrob'
#define SID_GRIP_OF_STATIC_ELECTRICITY 'A0AF'
#define SID_PULSE_BOMB 'A0AH'
#define BID_PULSE_BOMB 'A0AO'
#define SID_LASER_BEAM 'A0AI'
#define SID_TINKER_MORPH 'A0AJ'
#define SID_LIGHTNING_SHIELD 'A0AK'
#define BID_LIGHTNING_SHIELD 'A0AP'
#define BID_LIGHTNING_SHIELD_NEG 'A0AQ'
#define UTID_LIGHTNING_SHIELD_FX 'e00H'
#define SID_POCKET_FACTORY 'A0AL'
#define UTID_POCKET_FACTORY 'nfac'
#define SID_SUMMON_CLOCKWORK_GOBLIN 'A0AR'
#define UTID_CLOCKWORK_GOBLIN 'ncgb'
#define SID_CLUSTER_ROCKETS 'A0AM'
#define SID_SELF_DESTRUCT 'A0AN'

// 娜迦女巫
#define UTIDNAGASEAWITCH 'Hvsh'
#define SID_FUCKED_LIGHTNING 'A03L'
#define BID_FUCKED_LIGHTNING 'A03R'
#define UTID_FLYING_SERPENT 'n003'
#define SID_STRONG_BREEZE 'A03M'
#define SID_SUMMON_SERPENTS 'A03N'
#define SID_THUNDER_STORM 'A03O'

// 潮汐男爵
#define UTIDTIDEBARON 'Udea'
#define UTIDTIDEBARONWATER 'Udre'
#define SIDALKALINEWATER 'A04U'
#define SIDTIDE 'A04V'
#define SIDTIDEBARONMORPH 'A04S'
#define SIDTEARUP 'A04W'
#define SIDLANCINATE 'A04X'
#define SIDRASPYROAR 'A04Y'
#define SIDRASPYROARDUMMY 'A051'

// 术士
#define WLKSQRCENTREX 4608.00
#define WLKSQRCENTREY 768.00
#define UTIDWARLOCK 'Ulic'
#define UTIDFIRERUNE 'e004'
#define UTID_FIRE_BOMB 'e00G'
#define UTID_LAVA_SPAWN 'n009'
#define SIDFLAMETHROW 'A05Z'
#define SIDFLAMEBOMB 'A060'
#define SIDSUMMONLAVASPAWN 'A061'
#define SIDFRENZYWARLOCK 'A062'
#define BID_FRENZY_WARLOCK 'A0AW'

// Abyss Archon
#define UTID_PIT_ARCHON 'Ucrl'

#define SID_IMPALE 'A0B1'
#define UTID_SPIKE 'n00O'

#define SID_SUMMON_POISONOUS_CRAWLER 'A0B2'
#define UTID_POISONOUS_CRAWLER 'ucry'
#define BID_SUMMON_POISONOUS_CRAWLER 'A0B6'

#define SID_SUMMON_ABOMINATION 'A0B4'
#define UTID_ABOMINATION 'uabo'
#define BID_SUMMON_ABOMINATION 'A0B7'

#define SID_SUMMON_WRAITH 'A0B5'
#define UTID_WRAITH 'ushd'
#define BID_SUMMON_WRAITH 'A0B8'

#define SID_LIFE_SIPHON 'A0B3'

// 恶魔守卫 The Felguards
#define UTID_FEL_GUARD 'Nplh'
#define UTID_VOID_LORD '????'
#define SID_FEL_EXECUTION '????'
#define SID_STOMP '????'
#define SID_FEL_FRENZY '????'
#define BID_FEL_FRENZY '????'

// 妖术领主
#define UTIDHEXLORD 'Oshd'
#define SIDSPIRITBOLT 'A053'
#define SIDSPIRITHARVEST 'A05Q'
#define SIDSUNFIRESTORMHEX 'A054'
#define SIDSHIELDOFSINDOREIHEX 'A055'
// #define SIDMANGLEHEX 'A056'
// #define SIDRABIESHEX 'A057'
#define SID_SAVAGE_ROAR_HEX 'A0AX'
#define BID_SAVAGE_ROAR_HEX 'A0AZ'
#define SID_NATURAL_REFLEX_HEX 'A0AY'
#define BID_NATURAL_REFLEX_HEX 'A0B0'
#define SIDTRANQUILITYHEX 'A058'
#define SIDLIFEBLOOMHEX 'A059'
#define SIDHOLYBOLTHEX 'A05A'
#define SIDHOLYSHOCKHEX 'A05B'
#define SIDHEALHEX 'A05C'
#define SIDSHIELDHEX 'A05D'
#define SIDMORTALSTRIKEHEX 'A05E'
#define SIDOVERPOWERHEX 'A05F'
#define SIDDARKARROWHEX 'A05G'
#define SIDFREEZINGTRAPHEX 'A05H'
#define SIDFROSTBOLTHEX 'A05I'
#define SIDPOLYMORPHHEX 'A05J'
#define SIDLIGHTNINGTOTEMHEX 'A05K'
#define SIDCHARGEHEX 'A05L'
#define SIDSTEALTHHEX 'A05M'
#define SIDSTEALTHAMBUSH 'A05W'
#define SIDBLADEFLURRYHEX 'A05N'
#define SIDPAINHEX 'A05O'
#define SIDTERRORHEX 'A05P'

// God of Death
#define UTID_GOD_OF_DEATH 'Uear'

// # All creeps

// ## Area 1
// naga siren
#define UTID_NAGA_SIREN 'n000'
#define SID_LIGHTNING_BOLT 'A02W'
#define SID_FROST_SHOCK 'A097'
// naga tide priest
#define UTID_NAGA_TIDE_PRIEST 'n00B'
#define SID_CHAIN_HEALING 'A098'
#define SID_HEALING_WARD 'A099'
#define SID_PROTECTION_WARD 'A09A'
#define UTID_NTR_HEALING_WARD 'h004'
#define UTID_NTR_PROTECTION_WARD 'h005'
// naga myrmidon
#define UTID_NAGA_MYRMIDON 'n00A'
#define UTID_CHMP_NAGA_MYRMIDON 'n00Q'
#define SID_NAGA_FRENZY 'A09C'
#define SID_ARMOR_CRUSHING 'A09D'
// naga royal guard
#define UTID_NAGA_ROYAL_GUARD 'n00E'
#define SID_THUNDER_CLAP 'A09E'
#define SID_RAGE_ROAR 'A09F'
// sea lizard
#define UTID_SEA_LIZARD 'n00F'
#define SID_STING 'A09G'
// murloc slave
#define UTID_MURLOC_SLAVE 'n00G'
// wind serpent
#define UTID_WIND_SERPENT 'n00N'
#define SID_CHARGED_BREATH 'A0AU'
#define SID_MANA_LEECH 'A0AV'

// ## Area 3
// fel grunt
#define UTID_FEL_GRUNT 'n00C'
#define SID_UNHOLY_FRENZY 'A09H'
#define BID_UNHOLY_FRENZY 'A0B9'
// fel rider
#define UTID_FEL_RIDER 'n00H'
#define SID_CHAOS_LEAP 'A09I'
#define BID_CHAOS_LEAP 'A0BA'
// fel war bringer
#define UTID_FEL_WAR_BRINGER 'n00D'
#define SID_WAR_STOMP 'A0BB'
#define SID_BATTLE_COMMAND 'A0BC'
#define BID_BATTLE_COMMAND 'A0BD'
// demonic witch
#define UTID_DEMONIC_WITCH 'n001'
#define SID_BLAZING_HASTE 'A02Y'
#define BID_BLAZING_HASTE 'A02Z'
#define SID_FIRE_BALL 'A09L'
#define SID_FLAME_SHOCK 'A09M'
#define BID_FLAME_SHOCK 'A0BE'

// ## Area 4
// Noxious Spider
#define UTID_NOXIOUS_SPIDER 'u003'
// Parasitical Roach
#define UTID_PARASITICAL_ROACH 'ucs1'
#define SID_PARASITE 'A0BL'
#define BID_PARASITE 'A0BM'
// Zombie
#define UTID_ZOMBIE 'nzom'
#define SID_GNAW 'A0BK'
// Obsdian Statue
#define UTID_OBSIDIAN_CONSTRUCT 'uobs'
#define BID_REFLECTION_AURA 'A0BH'
#define SID_MANA_TAP 'A0BI'
#define BID_MANA_TAP 'A0BJ'
// Dracolich
#define UTID_DRACOLICH 'ufro'
#define SID_DEATH_AND_DECAY 'A0BF'
#define SID_FROST_GRAVE 'A0BG'

// ## Area 5
// Void Walker
#define UTID_VOID_WALKER 'n00I'
#define SID_NETHER_BOLT 'A09N'
#define SID_SHADOW_SHIFT '????'

// Fel Hound
#define UTID_FEL_HOUND 'n00J'
// Maid of Agony
#define UTID_MAID_OF_AGONY 'n00K'
// Nether Drake
// Nether Hatchling
// Inferno Construct
#define UTID_INFERNO_CONSTRUCT 'ninf'
#define SID_METEOR 'A0BN'
#define SID_BURNING '????'
#define BID_BURNING '????'
#define SID_RAGE_STRIKE '????'

// ## Area 6
// Forest Troll
#define UTID_FOREST_TROLL 'n00L'
#define SID_CRUSHING_BLOW '????'
// Cursed Hunter
#define UTID_CURSED_HUNTER '????'
#define BID_ZEAL '????'
// Deranged Priest
// Gargantuan
// Twilight Witch Doctor
#define UTID_TWILIGHT_WITCH_DOCTOR '????'
#define UTID_GRIM_TOTEM '????'
#define SID_GRIM_TOTEM '????'
#define BID_GRIM_TOTEM '????'
#define SID_POISON_DART '????'
// Faceless One
#define SID_VICIOUS_STRIKE '????'
#define BID_VICIOUS_STRIKE '????'
#define SID_FILTHY_LAND '????'

// test unit type id
#define UTID_STATIC_TARGET 'h000'
#define UTID_TARGET 'h001'
#define UTID_TANK_TESTER 'h002'
#define UTID_HEALER_TESTER 'h003'

// Items
// Consumable
// Scrolls
#define ITID_ARMAGEDDON_SCROLL 'I003'
#define SID_ARMAGEDDON_SCROLL 'A070'
#define ITID_WEAKEN_CURSE_SCROLL 'I00D'
#define SID_WEAKEN_CURSE_SCROLL 'A07O'

#define ITID_HEAL_SCROLL 'shea'
#define SID_HEAL_SCROLL 'A06Z'
#define ITID_SLAYER_SCROLL 'srrc'
#define SID_SLAYER_SCROLL 'A074'
#define ITID_SANCTUARY_SCROLL 'I006'
#define SID_SANCTUARY_SCROLL 'A076'
#define ITID_BANSHEE_SCROLL 'I00C'
#define SID_BANSHEE_SCROLL 'A07M'

#define ITID_ARANS_COUNTER_SPELL_SCROLL 'Ial0'
#define SID_ARANS_COUNTER_SPELL_SCROLL 'A06H'
#define ITID_SPEED_SCROLL 'shas'
#define SID_SPEED_SCROLL 'A06T'
#define ITID_FRENZY_SCROLL 'Ifz0'
#define SID_FRENZY_SCROLL 'A06V'
#define ITID_DEFEND_SCROLL 'spro'
#define SID_DEFEND_SCROLL 'A06X'
#define ITID_MANA_SCROLL 'sman'
#define SID_MANA_SCROLL 'A06Y'
#define ITID_ROAR_SCROLL 'sror'
#define SID_ROAR_SCROLL 'A072'
#define ITID_SPELL_REFLECTION_SCROLL 'I00M'
#define SID_SPELL_REFLECTION_SCROLL 'A078'
#define ITID_MASS_DISPEL_SCROLL 'I017'
#define SID_MASS_DISPEL_SCROLL 'A07G'
#define ITID_MASS_TELEPORT_SCROLL 'I002'
#define SID_MASS_TELEPORT_SCROLL 'A07H'
#define ITID_CORRUPTION_SCROLL 'I004'
#define SID_CORRUPTION_SCROLL 'A07I'

// potions
#define ITID_MANA_SOURCE_POTION 'I00E'
#define SID_MANA_SOURCE_POTION 'A08J'

#define ITID_ARCH_MAGE_POTION 'I00J'
#define SID_ARCH_MAGE_POTION 'A08L'
#define ITID_COMBAT_MASTER_POTION 'I00N'
#define SID_COMBAT_MASTER_POTION 'A08M'
#define ITID_SHIELD_POTION 'I00S'
#define SID_SHIELD_POTION 'A08P'
#define ITID_FORTRESS_POTION 'I00V'
#define SID_FORTRESS_POTION 'A08Q'
#define ITID_INVUL_POTION 'pnvu'
#define SID_INVUL_POTION 'A08T'
#define ITID_UNSTABLE_POTION 'I010'
#define SID_UNSTABLE_POTION 'A090'

#define ITID_LEECH_POTION 'I00A'
#define SID_LEECH_POTION 'A08G'
#define ITID_LIFE_REGEN_POTION 'I00Q'
#define SID_LIFE_REGEN_POTION 'A08H'
#define ITID_MANA_REGEN_POTION 'I00R'
#define SID_MANA_REGEN_POTION 'A08I'
#define ITID_TRANQUILITY_POTION 'I00F'
#define SID_TRANQUILITY_POTION 'A08K'
#define ITID_BIG_LIFE_POTION 'I00I'
#define SID_BIG_LIFE_POTION 'A094'
#define ITID_EMPERORS_NEW_POTION 'I00O'
#define SID_EMPERORS_NEW_POTION 'A08N'
#define ITID_TRANSFER_POTION 'I01J'
#define SID_TRANSFER_POTION 'A08O'
#define ITID_DODGE_POTION 'I00W'
#define SID_DODGE_POTION 'A08R'
#define ITID_SMALL_INVUL_POTION 'pnvl'
#define SID_SMALL_INVUL_POTION 'A08S'
#define ITID_STONE_SKIN_POTION 'I008'
#define SID_STONE_SKIN_POTION 'A08U'
#define ITID_SPELL_POWER_POTION 'I00B'
#define SID_SPELL_POWER_POTION 'A08V'
#define ITID_SPELL_MASTER_POTION 'I00X'
#define SID_SPELL_MASTER_POTION 'A08W'
#define ITID_ARCANE_POTION 'I01Q'
#define SID_ARCANE_POTION 'A08X'
#define ITID_ANGRY_CAST_POTION 'I007'
#define SID_ANGRY_CAST_POTION 'A08Y'
#define ITID_SPELL_PIERCE_POTION 'I00Z'
#define SID_SPELL_PIERCE_POTION 'A08Z'
#define ITID_AGILITY_POTION 'I009'
#define SID_AGILITY_POTION 'A091'
#define ITID_ACUTE_POTION 'I011'
#define SID_ACUTE_POTION 'A092'
#define ITID_DEXTERITY_POTION 'I00Y'
#define SID_DEXTERITY_POTION 'A093'

#define ITID_LIFE_POTION 'phea'
#define SID_LIFE_POTION 'A07P'
#define ITID_MANA_POTION 'pman'
#define SID_MANA_POTION 'A07Q'

// Charms
#define ITID_CHARM_OF_CHAIN_LIGHTNING 'I005'
#define SID_CHARM_OF_CHAIN_LIGHTNING 'A0A8'
#define ITID_CHARM_OF_DEATH_FINGER 'I00G'
#define SID_CHARM_OF_DEATH_FINGER 'A0A9'

#define ITID_CHARM_OF_SIMPLE_HEAL 'I01I'
#define SID_CHARM_OF_SIMPLE_HEAL 'A0A4'
#define ITID_CHARM_OF_DISPEL 'I01G'
#define SID_CHARM_OF_DISPEL 'A0A5'
#define ITID_CHARM_OF_HEALING_WARD 'I01F'
#define SID_CHARM_OF_HEALING_WARD 'A0A6'
#define ITID_CHARM_OF_INNER_FIRE 'I01E'
#define SID_CHARM_OF_INNER_FIRE 'A0A7'
#define ITID_CHARM_OF_SIPHON_LIFE 'I020'
#define SID_CHARM_OF_SIPHON_LIFE 'A0AA'
#define ITID_DEMONIC_RUNE 'I012'
#define SID_DEMONIC_RUNE 'A0AB'
#define ITID_STRANGE_WAND 'I023'
#define SID_STRANGE_WAND 'A0AC'

// origin common gear
#define ITID_BOOTS_OF_SLOW 'I000'
#define ITID_HELM_OF_VALOUR 'hval'
#define ITID_HOOD_OF_CUNNING 'hcun'
#define ITID_MEDALION_OF_COURAGE 'mcou'
// origin uncommon gear
#define ITID_CRUEL_COLOSSUS_BLADE_OF_QUICKNESS 'I01Y'
#define ITID_HEALTH_STONE 'hlst'
#define SID_HEALTH_STONE 'A06I'
#define ITID_ICON_OF_THE_UNGLAZED_CRESCENT 'I01K'
#define SID_ICON_OF_THE_UNGLAZED_CRESCENT 'A06G'
#define ITID_MANA_STONE 'mnst'
#define SID_MANA_STONE 'A06J'
#define ITID_MOROES_LUCKY_GEAR 'I01H'
#define SID_MOROES_LUCKY_GEAR 'A06L'
#define ITID_ROMULOS_EXPIRED_POISON 'I00T'
#define ITID_RUNED_BRACERS 'brac'
// origin rare gear
#define ITID_ARANS_SOOTHING_AGATE 'I019'
#define ITID_BULWARK_OF_THE_AMANI_EMPIRE 'Iams'
#define ITID_CORE_HOUND_TOOTH 'I015'
#define ITID_CURSED_CUIRASS 'I00K'
#define ITID_DRUM 'I014'
#define ITID_GOBLIN_ROCKET_BOOTS_LIMITED_EDITION 'I013'
#define SID_GOBLIN_ROCKET_BOOTS_LIMITED_EDITION 'A079'
#define ITID_GORE_HOWL 'I01N'
#define ITID_HEX_SHRUNKEN_HEAD 'I02I'
#define SID_HEX_SHRUNKEN_HEAD 'A07F'
#define ITID_LION_HORN 'I018'
#define ITID_PURE_ARCANE 'I00H'
#define ITID_SIGNET_OF_THE_LAST_DEFENDER 'I01A'
#define ITID_STAFF_OF_THE_SHADOW_FLAME 'I01B'
#define ITID_THE_21_RING 'I012'
#define ITID_TIDAL_LOOP 'I01C'
#define ITID_TROLL_BANE 'I022'
#define ITID_VISKAG 'I016'
// class spec gear
#define ITIDORBOFTHESINDOREI 'Isin'
#define ITIDREFORGEDBADGEOFTENACITY 'Idru'
#define SIDREFORGEDBADGEOFTENACITY 'A06B'
#define ITIDLIGHTSJUSTICE 'I00U'
#define SIDLIGHTSJUSTICE 'A06C'
#define ITIDBENEDICTION 'Iben'
#define ITIDHORNOFCENARIUS 'Ihor'
#define ITIDORCCAPTUREFLAG 'Ifla'
#define ITIDDAGGEROFASSASSINATION 'Iass'
#define ITIDRHOKDELAR 'Ihun'
#define ITIDRAGEWINTERCHILLSPHYLACTERY 'Ifro'
#define ITIDANATHEMA 'Iana'
#define ITIDRARESHIMMERWEED 'Ithu'
// legendary
#define ITIDBREATHOFTHEDYING 'I001'
#define ITIDCALLTOARMS 'Icta'
#define SIDCALLTOARMS 'A069'
#define ITID_CTHUNS_DERANGEMENT 'I00L'
#define SID_CTHUNS_DERANGEMENT 'A06Q'
#define ITIDENIGMA 'Ieng'
#define SIDENIGMA 'A064'
#define ITIDINFINITY 'I01P'
#define ITIDINSIGHT 'Iins'
#define ITID_TYRAELS_MIGHT 'I01D'
#define SID_TYRAELS_MIGHT 'A07K'
#define ITID_VOODOO_VIAL 'I00P'
#define SID_VOODOO_VIAL 'A06N'
#define ITIDWOESTAVE 'Iwoe'
#define ITIDWINDFORCE 'Iwf0'
// relic set
// Athas's Corruption
#define ITID_DETERMINATION_OF_VENGEANCE 'I01S'
#define ITID_DETERMINATION_OF_VENGEANCE1 'I01R'
#define ITID_STRATHOLME_TRAGEDY 'I01T'
#define ITID_STRATHOLME_TRAGEDY1 'I01U'
#define ITID_PATRICIDE 'I01X'
#define ITID_PATRICIDE1 'I01W'
#define ITID_PATRICIDE2 'I01V'
#define ITID_FROSTMOURNE 'I01O'
#define ITID_FROSTMOURNE1 'I01L'
#define ITID_FROSTMOURNE2 'I01M'

#define ART_ANGEL "Abilities\\Spells\\Human\\Resurrect\\ResurrectCaster.mdl"
#define ART_ANNIHILATION_MISSILE "Abilities\\Spells\\Undead\\OrbOfDeath\\AnnihilationMissile.mdl"
#define ART_BLEED "Objects\\Spawnmodels\\Human\\HumanBlood\\HeroBloodElfBlood.mdl"
#define ART_BLINK "????"
#define ART_BLOOD_LUST_LEFT "Abilities\\Spells\\Orc\\Bloodlust\\BloodlustTarget.mdl"
#define ART_BLOOD_LUST_RIGHT "Abilities\\Spells\\Orc\\Bloodlust\\BloodlustSpecial.mdl"
#define ART_CRATER "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl"
#define ART_DEATH_AND_DECAY "Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayTarget.mdl"
#define ART_DISPEL "Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl"
#define ART_DOOM "Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl"
#define ART_DUST "Objects\\Spawnmodels\\Undead\\ImpaleTargetDust\\ImpaleTargetDust.mdl"
#define ART_FREEZING_BREATH "Abilities\\Spells\\Undead\\FreezingBreath\\FreezingBreathTargetArt.mdl"
#define ART_FROST_NOVA "Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl"
#define ART_GORE "Objects\\Spawnmodels\\Orc\\OrcLargeDeathExplode\\OrcLargeDeathExplode.mdl"
#define ART_HEAL "Abilities\\Spells\\Items\\AIhe\\AIheTarget.mdl"
#define ART_HEAL_SALVE "Abilities\\Spells\\Items\\HealingSalve\\HealingSalveTarget.mdl"
#define ART_IMPACT "Abilities\\Weapons\\Bolt\\BoltImpact.mdl"
#define ART_INFERNAL_BIRTH "Units\\Demon\\Infernal\\InfernalBirth.mdl"
#define ART_INVULNERABLE "Abilities\\Spells\\Human\\DivineShield\\DivineShieldTarget.mdl"
#define ART_MANA "Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl"
#define ART_MANA_DRAIN_TARGET "Abilities\\Spells\\Other\\Drain\\ManaDrainTarget.mdl"
#define ART_PARASITE_TARGET "Abilities\\Spells\\Other\\Parasite\\ParasiteTarget.mdl"
#define ART_PHOENIX_MISSILE "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl"
#define ART_PLAGUE "units\\undead\\PlagueCloud\\PlagueCloud.mdl"
#define ART_POISON "Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl"
#define ART_RED_IMPACT "Abilities\\Spells\\Demon\\DemonBoltImpact\\DemonBoltImpact.mdl"
#define ART_SHIELD "Abilities\\Spells\\Items\\StaffOfSanctuary\\Staff_Sanctuary_Target.mdl"
#define ART_SLOW "Abilities\\Spells\\Human\\slow\\slowtarget.mdl"
#define ART_SPELLSTEAL "Abilities\\Spells\\Human\\SpellSteal\\SpellStealTarget.mdl"
#define ART_STOMP "Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl"
#define ART_WATER "Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl"