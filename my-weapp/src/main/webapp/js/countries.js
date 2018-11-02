
var country_arr = new Array("Afghanistan:AF", "Albania:AL", "Algeria:DZ", "American Samoa:AS", "Angola:AO", "Anguilla:AI", "Antartica:AQ", "Antigua and Barbuda:AG", "Argentina:AR", "Armenia:AM", 
"Aruba:AW", "Ashmore and Cartier Island", "Australia:AU", "Austria:AT", "Azerbaijan:AZ", "Bahamas:BS", "Bahrain:BH", "Bangladesh:BD", "Barbados:BB", "Belarus:BY",
"Belgium:BE", "Belize:BZ", "Benin:BJ", "Bermuda:BM", "Bhutan:BT", "Bolivia:BO", "Bosnia and Herzegovina:BA", "Botswana:BW", "Brazil:BR", "British Virgin Islands:VG", 
"Brunei:BN", "Bulgaria:BG", "Burkina Faso:BF", "Burma:MM", "Burundi:BI", "Cambodia:KH", "Cameroon:CM", "Canada:CA", "Cape Verde:CV", "Cayman Islands:KY", 
"Central African Republic:CF", "Chad:TD", "Chile:CL", "China:CN", "Christmas Island:CX", "Clipperton Island", "Cocos (Keeling) Islands:CC", "Colombia:CO", "Comoros:KM", "Congo, Democratic Republic of the:CD",
"Congo, Republic of the:CG", "Cook Islands:CK", "Costa Rica:CR", "Cote d'Ivoire:CI", "Croatia:HR", "Cuba:CU", "Cyprus:CY", "Czeck Republic:CZ", "Denmark:DK", "Djibouti:DJ", 
"Dominica:DM", "Dominican Republic:DO", "Ecuador:EC", "Egypt:EG", "El Salvador:SV", "Equatorial Guinea:GQ", "Eritrea:ER", "Estonia:EE", "Ethiopia:ET", "Europa Island",
"Falkland Islands (Islas Malvinas):FK", "Faroe Islands:FO", "Fiji:FJ", "Finland:FI", "France:FR", "French Guiana:GF", "French Polynesia:PF", "French Southern and Antarctic Lands:TF", "Gabon:GA", "Gambia, The:GM",
"Gaza Strip", "Georgia:GE", "Germany:DE", "Ghana:GH", "Gibraltar:GI", "Glorioso Islands", "Greece:GR", "Greenland:GL", "Grenada:GD", "Guadeloupe:GP", 
"Guam:GU", "Guatemala:GT", "Guernsey:GG", "Guinea:GN", "Guinea-Bissau:GW", "Guyana:GY", "Haiti:HT", "Heard Island and McDonald Islands:HM", "Holy See (Vatican City):VA", "Honduras:HN", 
"Hong Kong:HK", "Howland Island", "Hungary:HU", "Iceland:IS", "India:IN", "Indonesia:ID", "Iran:IR", "Iraq:IQ", "Ireland:IE", "Ireland, Northern",
"Israel:IL", "Italy:IT", "Jamaica:JM", "Jan Mayen", "Japan:JP", "Jarvis Island", "Jersey:JE", "Johnston Atoll", "Jordan:JO", "Juan de Nova Island", 
"Kazakhstan:KZ", "Kenya:KE", "Kiribati:KI", "Korea, Democratic People's Republic of:KP", "Korea, Republic of:KR", "Kuwait:KW", "Kyrgyzstan:KG", "Laos:LA", "Latvia:LV", "Lebanon:LB", 
"Lesotho:LS", "Liberia:LR", "Libya:LY", "Liechtenstein:LI", "Lithuania:LT", "Luxembourg:LU", "Macau:MO", "Macedonia, Former Yugoslav Republic of:MK", "Madagascar:MG","Malawi:MW",
"Malaysia:MY", "Maldives:MV", "Mali:ML", "Malta:MT", "Man, Isle of", "Marshall Islands:MH", "Martinique:MQ", "Mauritania:MR", "Mauritius:MU", "Mayotte:YT", 
"Mexico:MX", "Micronesia, Federated States of:FM", "Midway Islands", "Moldova:MD", "Monaco:MC", "Mongolia:MN", "Montserrat:MS", "Morocco:MA", "Mozambique:MZ","Namibia:NA", 
"Nauru:NR", "Nepal:NP", "Netherlands:NL", "Netherlands Antilles", "New Caledonia:NC", "New Zealand:NZ", "Nicaragua:NI", "Niger:NE", "Nigeria:NG", "Niue:NU",
"Norfolk Island:NF", "Northern Mariana Islands:MP", "Norway:NO", "Oman:OM", "Pakistan:PK", "Palau:PW", "Panama:PA", "Papua New Guinea:PG", "Paraguay:PY", "Peru:PE", 
"Philippines:PH", "Pitcaim Islands:PN", "Poland:PL", "Portugal:PT", "Puerto Rico:PR", "Qatar:QA", "Reunion:RE", "Romainia:RO", "Russia:RU", "Rwanda:RW", 
"Saint Helena:SH", "Saint Kitts and Nevis:KN", "Saint Lucia:LC", "Saint Pierre and Miquelon:PM", "Saint Vincent and the Grenadines:VC", "Samoa:WS", "San Marino:SM", "Sao Tome and Principe:ST", "Saudi Arabia:SA", "Scotland", 
"Senegal:SN", "Seychelles:SC", "Sierra Leone:SL", "Singapore:SG", "Slovakia:SK", "Slovenia:SI", "Solomon Islands:SB", "Somalia:SO", "South Africa:ZA", "South Georgia and South Sandwich Islands:GS", 
"Spain:ES", "Spratly Islands", "Sri Lanka:LK", "Sudan:SD", "Suriname:SR", "Svalbard:SJ", "Swaziland:SZ", "Sweden:SE", "Switzerland:CH", "Syria:SY", 
"Taiwan:TW", "Tajikistan:TJ", "Tanzania:TZ", "Thailand:TH", "Tobago", "Toga:TG", "Tokelau:TK", "Tonga:TO", "Trinidad And Tobago:TT", "Tunisia:TN", 
"Turkey:TR", "Turkmenistan:TM", "Tuvalu:TV", "Uganda:UG", "Ukraine:UA", "United Arab Emirates:AE", "United Kingdom:GB", "Uruguay:UY", "USA:US", "Uzbekistan:UZ", 

"Vanuatu:VU", "Venezuela:VE", "Vietnam:VN", "Virgin Islands:VG", "Wales", "Wallis and Futuna:WF", "West Bank", "Western Sahara:EH", "Yemen:YE", "Yugoslavia", 
"Zambia:ZM", "Zimbabwe:ZW");

// States
var s_a = new Array();
s_a[0]="";
s_a[1]="Badakhshan:BDS|Badghis:BDG|Baghlan:BGL|Balkh:BAL|Bamyan:BAM|Daykundi:DAY|Farah:FRA|Faryab:FYB|Ghazni:GHA|Ghor:GHO|Helmand:HEL|Herat:HER|Jowzjan:JOW|Kabul:KAB|Kandahar:KAN|Kapisa:KAP|Khost:KHO|Kuna?:KNR|Kunduz:KDZ|Laghman:LAG|Logar:LOG|Nangarhar:NAN|Nimroz:NIM|Nuristan:NUR|Paktika:PKA|Paktiya:PIA|Panjshayr:PAN|Parwan:PAR|Samangan:SAM|Sar-e Pul:SAR|Takhar:TAK|Uruzgan:URU|Wardak:WAR|Zabul:ZAB";
s_a[2]="Berat:BR|Bulqizë:BU|Delvinë:DL|Devoll:DV|Dibër:DI|Durrës:DR|Elbasan:EL|Fier:FR|Gjirokastër:GJ|Gramsh:GR|Has:HA|Kavajë:KA|Kolonjë:ER|Korçë:KO|Krujë:KR|Kuçovë:KC|Kukës:KU|Kurbin:KB|Lezhë:LE|Librazhd:LB|Lushnjë:LU|Malësi e Madhe:MM|Mallakastër:MK|Mat:MT|Mirditë:MR|Peqin:PQ|Përmet:PR|Pogradec:PG|Pukë:PU|Sarandë:SR|Shkodër:SH|Skrapar:SK|Tepelenë:TE|Tiranë:TR|Tropojë:TP|Vlorë:VL";
s_a[3]="Adrar:1|Aïn Defla:44|Aïn Témouchent:46|Alger:16|Annaba:23|Batna:5|Béchar:8|Béjaïa:6|Biskra:7|Blida:9|Bordj Bou Arréridj:34|Bouira:10|Boumerdès:35|Chlef:2|Constantine:25|Djelfa:17|El Bayadh:32|El Oued:39|El Tarf:36|Ghardaïa:47|Guelma:24|Illizi:33|Jijel:18|Khenchela:40|Laghouat:3|Mascara:29|Médéa:26|Mila:43|Mostaganem:27|M'sila:28|Naama:45|Oran:31|Ouargla:30|Oum el Bouaghi:4|Relizane:48|Saïda:20|Sétif:19|Sidi Bel Abbès:22|Skikda:21|Souk Ahras:41|Tamanrasset:11|Tébessa:12|Tiaret:14|Tindouf:37|Tipaza:42|Tissemsilt:38|Tizi Ouzou:15|Tlemcen:13";
s_a[4]="Eastern|Manu'a|Rose Island|Swains Island|Western";
s_a[5]="Bengo:BGO|Benguela:BGU|Bié:BIE|Cabinda:CAB|Kuando Kubango:CCU|Cunene:CNN|Kwanza Norte:CNO|Kwanza Sul:CUS|Huambo:HUA|Huíla:HUI|Lunda Norte:LNO|Lunda Sul:LSU|Luanda:LUA|Malange:MAL|Moxico:MOX|Namibe:NAM|Uíge:UIG|Zaire:ZAI";
s_a[6]="Anguilla:AI";
s_a[7]="Antartica:AQ";
s_a[8]="Barbuda:10|Redonda:11|Saint George:3|Saint John:4|Saint Mary:5|Saint Paul:6|Saint Peter:7|Saint Philip:8";
s_a[9]="Buenos Aires:B|Catamarca:K|Chaco:H|Chubut:U|Ciudad Autónoma de Buenos Aires:C|Córdoba:X|Corrientes:W|Entre Ríos:E|Formosa:P|Jujuy:Y|La Pampa:L|La Rioja:F|Mendoza:M|Misiones:N|Neuquén:Q|Río Negro:R|Salta:A|San Juan:J|San Luis:D|Santa Cruz:Z|Santa Fe:S|Santiago del Estero:G|Tierra del Fuego:V|Tucumán:T";
s_a[10]="Aragatsotn:AG|Ararat:AR|Armavir:AV|Yerevan:ER|Gegharkunik:GR|Kotayk:KT|Lori:LO|Shirak:SH|Syunik:SU|Tavush:TV|Vayots Dzor:VD";
s_a[11]="Aruba:AW";
s_a[12]="Ashmore and Cartier Island";
s_a[13]="Australian Capital Territory:ACT|New South Wales:NSW|Northern Territory:NT|Queensland:QLD|South Australia:SA|Tasmania:TAS|Victoria:VIC|Western Australia:WA";
s_a[14]="Burgenland:1|Kaernten:2|Niederoesterreich:3|Oberoesterreich:4|Salzburg:5|Steiermark:6|Tirol:7|Vorarlberg:8|Wien:9";
s_a[15]="Absheron:ABS|Agdam:AGM|Agdash:AGS|Aghjabadi:AGC|Agstafa:AGA|Agsu:AGU|Astara:AST|Babek:BAB|Baku:BA|Balakan:BAL|Barda:BAR|Beylagan:BEY|Bilasuvar:BIL|Dashkasan:DAS|Fuzuli:FUZ|Gadabay:GAD|Ganja:GA|Gobustan:QOB|Goranboy:GOR|Goychay:GOY|Goygol:GYG|Hajigabul:HAC|Imishli:IMI|Ismailli:ISM|Jabrayil:CAB|Jalilabad:CAL|Julfa:CUL|Kalbajar:KAL|Kangarli:KAN|Khachmaz:XAC|Khizi:XIZ|Khojaly:XCI|Khojavend:XVD|Kurdamir:KUR|Lachin:LAC|Lankaran:LA|Lankaran:LAN|Lerik:LER|Masally:MAS|Mingachevir:MI|Naftalan:NA|Nakhchivan:NV|Neftchala:NEF|Oghuz:OGU|Ordubad:ORD|Qakh:QAX|Qazakh:QAZ|Qbala:QAB|Quba:QBA|Qubadlı:QBI|Qusar:QUS|Saatly:SAT|Sabirabad:SAB|Sadarak:SAD|Salyan:SAL|Samukh:SMX|Shabran:SBN|Shahbuz:SAH|Shaki:SA|Shaki:SAK|Shamakhi:SMI|Shamkir:SKR|Sharur:SAR|Shirvan:SR|Shusha:SUS|Siazan:SIY|Stepanakert:XA|Sumqayıt:SM|Tartar:TAR|Tovuz:TOV|Ujar:UCA|Yardymli:YAR|Yevlakh:YE|Yevlakh:YEV|Zangilan:ZAN|Zaqatala:ZAQ|Zardab:ZAR";
s_a[16]="Acklins:AK|Bimini:BI|Black Point:BP|Berry Islands:BY|Central Eleuthera:CE|Cat Island:CI|Crooked Island and Long Cay:CK|Central Abaco:CO|Central Andros:CS|East Grand Bahama:EG|Exuma:EX|City of Freeport:FP|Grand Cay:GC|Harbour Island:HI|Hope Town:HT|Inagua:IN|Long Island:LI|Mangrove Cay:MC|Mayaguana:MG|Moore's Island:MI|North Eleuthera:NE|North Abaco:NO|North Andros:NS|Rum Cay:RC|Ragged Island:RI|South Andros:SA|South Eleuthera:SE|South Abaco:SO|San Salvador:SS|Spanish Wells:SW|West Grand Bahama:WG";
s_a[17]="Al Ḩadd:1|Al Manāmah:3|Al Minţaqah al Gharbīyah:10|Al Minţaqah al Wusţá:7|Al Minţaqah ash Shamālīyah:5|Al Muḩarraq:2|Ar Rifāٰ:9|Jidd Ḩafş:4|Madīnat Ḩamad:12|Madīnat ٰĪsá:8|Minţaqat Juzur Ḩawār:11|Sitrah:6";
s_a[18]="Bagerhat:5|Bandarban:1|Barguna:2|Barisal:6|Bhola:7|Bogra:3|Brahmanbaria:4|Chandpur:9|Chapai Nawabganj:45|Chittagong:10|Chuadanga:12|Comilla:8|Cox's Bazar:11|Dhaka:13|Dinajpur:14|Faridpur:15|Feni:16|Gaibandha:19|Gazipur:18|Gopalganj:17|Habiganj:20|Jamalpur:21|Jessore:22|Jhalakathi:25|Jhenaidah:23|Joypurhat:24|Khagrachhari:29|Khulna:27|Kishoreganj:26|Kurigram:28|Kushtia:30|Lakshmipur:31|Lalmonirhat:32|Madaripur:36|Magura:37|Manikganj:33|Meherpur:39|Moulvibazar:38|Munshiganj:35|Mymensingh:34|Naogaon:48|Narail:43|Narayanganj:40|Narsingdi:42|Natore:44|Netrakona:41|Nilphamari:46|Noakhali:47|Pabna:49|Panchagarh:52|Patuakhali:51|Pirojpur:50|Rajbari:53|Rajshahi:54|Rangamati:56|Rangpur:55|Satkhira:58|Shariatpur:62|Sherpur:57|Sirajganj:59|Sunamganj:61|Sylhet:60|Tangail:63|Thakurgaon:64";
s_a[19]="Christ Church:1|Saint Andrew:2|Saint George:3|Saint James:4|Saint John:5|Saint Joseph:6|Saint Lucy:7|Saint Michael:8|Saint Peter:9|Saint Philip:10|Saint Thomas:11";
s_a[20]="Brest Region:BR|City of Minsk:HM|Gomel Region:HO|Grodno Region:HR|Minsk Region:MI|Mogilev Region:MA|Vitebsk Region:VI";
s_a[21]="Antwerpen:VAN|Brabant wallon:WBR|Bruxelles-Capitale, Région de:BRU|Hainaut:WHT|Liège:WLG|Limburg:VLI|Luxembourg:WLX|Namur:WNA|Oost-Vlaanderen:VOV|Vlaams Brabant:VBR|West-Vlaanderen:VWV";
s_a[22]="Belize:BZ|Cayo:CY|Corozal:CZL|Orange Walk:OW|Stann Creek:SC|Toledo:TOL";
s_a[23]="Alibori:AL|Atacora:AK|Atlantique:AQ|Borgou:BO|Collines:CO|Couffo:KO|Donga:DO|Littoral:LI|Mono:MO|Ouémé:OU|Plateau:PL|Zou:ZO";
s_a[24]="Devonshire|Hamilton|Hamilton|Paget|Pembroke|Saint George|Saint Georges|Sandys|Smiths|Southampton|Warwick";
s_a[25]="Bumthang:33|Chhukha:12|Dagana:22|Gasa:GA|Ha:13|Lhuentse:44|Monggar:42|Paro:11|Pemagatshel:43|Punakha:23|Samdrup Jongkha:45|Samtse:14|Sarpang:31|Thimphu:15|Trashi Yangtse:TY|Trashigang:41|Trongsa:32|Tsirang:21|Wangdue Phodrang:24|Zhemgang:34";
s_a[26]="Chuquisaca:H|Cochabamba:C|El Beni:B|La Paz:L|Oruro:O|Pando:N|Potosí:P|Santa Cruz:S|Tarija:T";
s_a[27]="Brcko distrikt:BRC|Federacija Bosne i Hercegovine:BIH|Republika Srpska:SRP";
s_a[28]="Central:CE|Chobe:CH|Francistown:FR|Gaborone:GA|Ghanzi:GH|Jwaneng:JW|Kgalagadi:KG|Kgatleng:KL|Kweneng:KW|Lobatse:LO|North East:NE|North West:NW|Selibe Phikwe:SP|South East:SE|Southern:SO|Sowa Town:ST";
s_a[29]="Acre:AC|Alagoas:AL|Amapá:AP|Amazonas:AM|Bahia:BA|Ceará:CE|Distrito Federal:DF|Espírito Santo:ES|Goiás:GO|Maranhão:MA|Mato Grosso:MT|Mato Grosso do Sul:MS|Minas Gerais:MG|Pará:PA|Paraíba:PB|Paraná:PR|Pernambuco:PE|Piauí:PI|Rio de Janeiro:RJ|Rio Grande do Norte:RN|Rio Grande do Sul:RS|Rondônia:RO|Roraima:RR|Santa Catarina:SC|São Paulo:SP|Sergipe:SE|Tocantins:TO";
s_a[30]="Anegada|Jost Van Dyke|Tortola|Virgin Gorda";
s_a[31]="Belait:BE|Brunei-Muara:BM|Temburong:TE|Tutong:TU";
s_a[32]="Blagoevgrad:1|Burgas:2|Dobrich:8|Gabrovo:7|Haskovo:26|Kardzhali:9|Kyustendil:10|Lovech:11|Montana:12|Pazardzhik:13|Pernik:14|Pleven:15|Plovdiv:16|Razgrad:17|Ruse:18|Shumen:27|Silistra:19|Sliven:20|Smolyan:21|Sofia:23|Sofia (stolitsa):22|Stara Zagora:24|Targovishte:25|Varna:3|Veliko Tarnovo:4|Vidin:5|Vratsa:6|Yambol:28";
s_a[33]="Balé:BAL|Bam:BAM|Banwa:BAN|Bazègaga:BAZ|Bougouriba:BGR|Boulgou:BLG|Boulkiemdé:BLK|Comoé:COM|Ganzourgou:GAN|Gnagna:GNA|Gourma:GOU|Houet:HOU|Ioba:IOB|Kadiogo:KAD|Kénédougou:KEN|Komondjari:KMD|Kompienga:KMP|Kossi:KOS|Koulpélogo:KOP|Kouritenga:KOT|Kourwéogo:KOW|Léraba:LER|Loroum:LOR|Mouhoun:MOU|Nahouri:NAO|Namentenga:NAM|Nayala:NAY|Noumbiel:NOU|Oubritenga:OUB|Oudalan:OUD|Passoré:PAS|Poni:PON|Sanguié:SNG|Sanmatenga:SMT|Séno:SEN|Sissili:SIS|Soum:SOM|Sourou:SOR|Tapoa:TAP|Tuy:TUI|Yagha:YAG|Yatenga:YAT|Ziro:ZIR|Zondoma:ZON|Zoundwéogo:ZOU";
s_a[34]="Ayeyawady:7|Bago:2|Chin:14|Kachin:11|Kayah:12|Kayin:13|Magway:3|Mandalay:4|Mon:15|Nay Pyi Taw:18|Rakhine:16|Sagaing:1|Shan:17|Taninthayi:5|Yangon:6";
s_a[35]="Bubanza:BB|Bujumbura Mairie:BM|Bujumbura Rural:BL|Bururi:BR|Cankuzo:CA|Cibitoke:CI|Gitega:GI|Karuzi:KR|Kayanza:KY|Kirundo:KI|Makamba:MA|Muramvya:MU|Muyinga:MY|Mwaro:MW|Ngozi:NG|Rumonge:RM|Rutana:RT|Ruyigi:RY";
s_a[36]="Banteay Mean Chey:1|Batt Dambang:2|Kampong Chaam:3|Kampong Chhnang:4|Kampong Spueu:5|Kampong Thum:6|Kampot:7|Kandaal:8|Kaoh Kong:9|Kracheh:10|Krong Kaeb:23|Krong Pailin:24|Krong Preah Sihanouk:18|Mondol Kiri:11|Otdar Mean Chey:22|Phnom Penh:12|Pousaat:15|Preah Vihear:13|Prey Veaeng:14|Rotanak Kiri:16|Siem Reab:17|Stueng Traeng:19|Svaay Rieng:20|Taakaev:21|Tbong Khmum:25";
s_a[37]="Adamaoua:AD|Centre:CE|East:ES|Far North:EN|Littoral:LT|North:NO|North-West:NW|South:SU|South-West:SW|West:OU";
s_a[38]="Alberta:AB|British Columbia:BC|Manitoba:MB|New Brunswick:NB|Newfoundland and Labrador:NL|Northwest Territories:NT|Nova Scotia:NS|Nunavut:NU|Ontario:ON|Prince Edward Island:PE|Quebec:QC|Saskatchewan:SK|Yukon:YT";
s_a[39]="Boa Vista:BV|Brava:BR|Maio:MA|Mosteiros:MO|Paul:PA|Porto Novo:PN|Praia:PR|Ribeira Brava:RB|Ribeira Grande:RG|Ribeira Grande de Santiago:RS|Sal:SL|Santa Catarina:CA|Santa Catarina do Fogo:CF|Santa Cruz:CR|São Domingos:SD|São Filipe:SF|São Lourenço dos Órgãos:SO|São Miguel:SM|São Salvador do Mundo:SS|São Vicente:SV|Tarrafal:TA|Tarrafal de São Nicolau:TS";
s_a[40]="Creek|Eastern|Midland|South Town|Spot Bay|Stake Bay|West End|Western";
s_a[41]="Bamingui-Bangoran:BB|Bangui:BGF|Basse-Kotto:BK|Gribingui:KB|Haute-Kotto:HK|Haut-Mbomou:HM|Kémo-Gribingui:KG|Lobaye:LB|Mambéré-Kadéï:HS|Mbomou:MB|Nana-Mambéré:NM|Ombella-Mpoko:MP|Ouaka:UK|Ouham:AC|Ouham-Pendé:OP|Sangha:SE|Vakaga:VK";
s_a[42]="Bahr el Gazel:BG|Batha:BA|Borkou:BO|Chari-Baguirmi:CB|Ennedi-Est:EE|Ennedi-Ouest:EO|Guéra:GR|Hadjer Lamis:HL|Kanem:KA|Lac:LC|Logone-Occidental:LO|Logone-Oriental:LR|Mandoul:MA|Mayo-Kébbi-Est:ME|Mayo-Kébbi-Ouest:MO|Moyen-Chari:MC|Ouaddaï:OD|Salamat:SA|Sila:SI|Tandjilé:TA|Tibesti:TI|Ville de Ndjamena:ND|Wadi Fira:WF";
s_a[43]="Aisén del General Carlos Ibañez del Campo:AI|Antofagasta:AN|Arica y Parinacota:AP|Atacama:AT|Biobío:BI|Coquimbo:CO|La Araucanía:AR|Libertador General Bernardo O'Higgins:LI|Los Lagos:LL|Los Ríos:LR|Magallanes:MA|Maule:ML|Región Metropolitana de Santiago:RM|Tarapacá:TA|Valparaíso:VS";
s_a[44]="Anhui:AH|Beijing:BJ|Chongqing:CQ|Fujian:FJ|Gansu:GS|Guangdong:GD|Guangxi:GX|Guizhou:GZ|Hainan:HI|Hebei:HE|Heilongjiang:HL|Henan:HA|Hong Kong (en):HK|Hubei:HB|Hunan:HN|Jiangsu:JS|Jiangxi:JX|Jilin:JL|Liaoning:LN|Macao (en):MO|Nei Mongol (mn):NM|Ningxia:NX|Qinghai:QH|Shaanxi:SN|Shandong:SD|Shanghai:SH|Shanxi:SX|Sichuan:SC|Taiwan:TW|Tianjin:TJ|Xinjiang:XJ|Xizang:XZ|Yunnan:YN|Zhejiang:ZJ";
s_a[45]="Christmas Island";
s_a[46]="Clipperton Island";
s_a[47]="Direction Island|Home Island|Horsburgh Island|North Keeling Island|South Island|West Island";
s_a[48]="Amazonas:AMA|Antioquia:ANT|Arauca:ARA|Atlántico:ATL|Bolívar:BOL|Boyacá:BOY|Caldas:CAL|Caquetá:CAQ|Casanare:CAS|Cauca:CAU|Cesar:CES|Chocó:CHO|Córdoba:COR|Cundinamarca:CUN|Distrito Capital de Bogotá:DC|Guainía:GUA|Guaviare:GUV|Huila:HUI|La Guajira:LAG|Magdalena:MAG|Meta:MET|Nariño:NAR|Norte de Santander:NSA|Putumayo:PUT|Quindío:QUI|Risaralda:RIS|San Andrés, Providencia y Santa Catalina:SAP|Santander:SAN|Sucre:SUC|Tolima:TOL|Valle del Cauca:VAC|Vaupés:VAU|Vichada:VID";
// <!-- -->
s_a[49]="Anjouan (Nzwani):A|Grande Comore (Njazidja):G|Moheli (Mwali):M";
s_a[50]="Bas-Uélé:BU|Équateur:EQ|Haut-Katanga:HK|Haut-Lomami:HL|Haut-Uélé:HU|Ituri:IT|Kasaï:KS|Kasaï Central:KC|Kasaï Oriental:KE|Kinshasa:KN|Kongo Central:BC|Kwango:KG|Kwilu:KL|Lomami:LO|Lualaba:LU|Mai-Ndombe:MN|Maniema:MA|Mongala:MO|Nord-Kivu:NK|Nord-Ubangi:NU|Sankuru:SA|Sud-Kivu:SK|Sud-Ubangi:SU|Tanganyika:TA|Tshopo:TO|Tshuapa:TU";
s_a[51]="Brazzaville:BZV|Bouenza:11|Cuvette:8|Cuvette-Ouest:15|Kouilou:5|Lékoumou:2|Likouala:7|Niari:9|Plateaux:14|Pointe-Noire:16|Pool:12|Sangha:13";
s_a[52]="Aitutaki|Atiu|Avarua|Mangaia|Manihiki|Manuae|Mauke|Mitiaro|Nassau Island|Palmerston|Penrhyn|Pukapuka|Rakahanga|Rarotonga|Suwarrow|Takutea";
s_a[53]="Alajuela:A|Cartago:C|Guanacaste:G|Heredia:H|Limón:L|Puntarenas:P|San José:SJ";
s_a[54]="Comoé:CM|Abidjan:AB|Bas-Sassandra:BS|Denguélé:DN|Gôh-Djiboua:GD|Lacs:LC|Lagunes:LG|Montagnes:MG|Sassandra-Marahoué:SM|Savanes:SV|Vallée du Bandama:VB|Woroba:WR|Yamoussoukro:YM|Zanzan:ZZ";
s_a[55]="Bjelovar-Bilogora:7|Brod-Posavina:12|Dubrovnik-Neretva:19|Istria:18|Karlovac:4|Koprivnica-Križevci:6|Krapina-Zagorje:2|Lika-Senj:9|Međimurje:20|Osijek-Baranja:14|Požega-Slavonia:11|Primorje-Gorski Kotar:8|Šibenik-Knin:15|Sisak-Moslavina:3|Split-Dalmatia:17|Varaždin:5|Virovitica-Podravina:10|Vukovar-Srijem:16|Zadar:13|Zagreb City:21|Zagreb County:1";
s_a[56]="Artemisa:15|Camagüey:9|Ciego de Ávila:8|Cienfuegos:6|Granma:12|Guantánamo:14|Holguín:11|Isla de la Juventud:99|La Habana:3|Las Tunas:10|Matanzas:4|Mayabeque:16|Pinar del Río:1|Sancti Spíritus:7|Santiago de Cuba:13|Villa Clara:5";
s_a[57]="Famagusta:04|Kyrenia:06|Larnaca:03|Limassol:02|Nicosia:01|Paphos:05";
s_a[58]="Central Bohemia:20|Hradec Králové:52|Karlovy Vary:41|Liberec:51|Moravia-Silesia:80|Olomouc:71|Pardubice:53|Plzeň:32|Prague:10|South Bohemia:31|South Moravia:64|Ústí nad Labem:42|Vysočina:63|Zlín:72";
s_a[59]="Århus:70|Bornholm:40|Frederiksberg:147|Frederiksborg:20|Fyn:42|København:101|København:15|Nordjylland:80|Ribe:55|Ringkøbing:65|Roskilde:25|Sønderjylland:50|Storstrøm:35|Vejle:60|Vestsjælland:30|Viborg:76";
s_a[60]="Ali Sabieh:AS|Arta:AR|Dikhil:DI|Djibouti:DJ|Obock:OB|Tadjourah:TA";
s_a[61]="Saint Andrew:2|Saint David:3|Saint George:4|Saint John:5|Saint Joseph:6|Saint Luke:7|Saint Mark:8|Saint Patrick:9|Saint Paul:10|Saint Peter:11";
s_a[62]="Azua:2|Baoruco:3|Barahona:4|Dajabón:5|Distrito Nacional (Santo Domingo):1|Duarte:6|El Seibo:8|Elías Piña:7|Espaillat:9|Hato Mayor:30|Hermanas Mirabal:19|Independencia:10|La Altagracia:11|La Romana:12|La Vega:13|María Trinidad Sánchez:14|Monseñor Nouel:28|Monte Cristi:15|Monte Plata:29|Pedernales:16|Peravia:17|Puerto Plata:18|Samaná:20|San Cristóbal:21|San José de Ocoa:31|San Juan:22|San Pedro de Macorís:23|Sánchez Ramírez:24|Santiago:25|Santiago Rodríguez:26|Santo Domingo:32|Valverde:27";
// <!-- -->
s_a[63]="Azuay:A|Bolívar:B|Cañar:F|Carchi:C|Chimborazo:H|Cotopaxi:X|El Oro:O|Esmeraldas:E|Galápagos:W|Guayas:G|Imbabura:I|Loja:L|Los Ríos:R|Manabí:M|Morona-Santiago:S|Napo:N|Orellana:D|Pastaza:Y|Pichincha:P|Santa Elena:SE|Santo Domingo de los Tsáchilas:SD|Sucumbíos:U|Tungurahua:T|Zamora-Chinchipe:Z";
s_a[64]="Ad Daqahliyah:DK|AI Fayyum:FYM|AI Gharbiyah:GH|AI Iskandariyah:ALX|AI Isma 'iliyah:IS|AI Jizah:GZ|AI Minufiyah:MNF|AI Minya:MN|AI Qahirah:C|AI Qalyubiyah:KB|AI Wadi al Jadid:WAD|Al Ba?r al A?mar:BA|Al Bu?ayrah:BH|Al Uqsur:LX|As Suways:SUZ|Ash Sharqiyah:SHR|Aswan:ASN|Asyut:AST|Bani Suwayf:BNS|Bur Sa'id:PTS|Dumyat:DT|Janub Sina':JS|Kafr ash Shaykh:KFS|Matruh:MT|Qina:KN|Shamal Sina':SIN|Suhaj:SHG";
s_a[65]="Ahuachapán:AH|Cabañas:CA|Chalatenango:CH|Cuscatlán:CU|La Libertad:LI|La Paz:PA|La Unión:UN|Morazán:MO|San Miguel:SM|San Salvador:SS|San Vicente:SV|Santa Ana:SA|Sonsonate:SO|Usulután:US";
s_a[66]="Annobón:AN|Bioko Norte:BN|Bioko Sur:BS|Centro Sur:CS|Kié-Ntem:KN|Litoral:LI|Wele-Nzas:WN";
s_a[67]="Akele Guzai:AG|Asmara:AS|Barka:BA|Denkalia:DE|Gash-Setit:GS|Hamasien:HA|Sahel:SA|Semhar:SM|Senhit:SN|Seraye:SR";
s_a[68]="Harjumaa:37|Hiiumaa:39|Ida-Virumaa:44|Järvamaa:51|Jõgevamaa:49|Läänemaa:57|Lääne-Virumaa:59|Pärnumaa:67|Põlvamaa:65|Raplamaa:70|Saaremaa:74|Tartumaa:78|Valgamaa:82|Viljandimaa:84|Võrumaa:86"
s_a[69]="Adis Abeba:AA|Afar:AF|Amara:AM|Binshangul Gumuz:BE|Dire Dawa:DD|Gambela Hizboch:GA|Hareri Hizb:HA|Oromiya:OR|Sumale:SO|Tigray:TI|YeDebub Biheroch Bihereseboch na Hizboch:SN";
s_a[70]="Europa Island";
s_a[71]="Falkland Islands (Islas Malvinas):FK"
s_a[72]="Bordoy|Eysturoy|Mykines|Sandoy|Skuvoy|Streymoy|Suduroy|Tvoroyri|Vagar";
s_a[73]="Central:C|Eastern:E|Northern:N|Rotuma:R|Western:W";
s_a[74]="Aland:AL|Etela-Suomen Laani:ES|Ita-Suomen Laani:IS|Lansi-Suomen Laani:LS|Lappi:LL|Oulun Laani:OL";
s_a[75]="Auvergne-Rhône-Alpes:ARA|Bourgogne-Franche-Comté:BFC|Bretagne:BRE|Centre-Val de Loire:CVL|Corse:COR|Grand Est:GES|Guadeloupe:GUA|Hauts-de-France:HDF|Île-de-France:IDF|La Réunion:LRE|Mayotte:MAY|Normandie:NOR|Nouvelle-Aquitaine:NAQ|Occitanie:OCC|Pays de la Loire:PDL|Provence-Alpes-Côte d'Azur:PAC";
s_a[76]="French Guiana";
s_a[77]="Archipel des Marquises|Archipel des Tuamotu|Archipel des Tubuai|Iles du Vent|Iles Sous-le-Vent";
s_a[78]="Adelie Land|Ile Crozet|Iles Kerguelen|Iles Saint-Paul et Amsterdam";
s_a[79]="Estuaire:1|Haut-Ogooue:2|Moyen-Ogooue:3|Ngounie:4|Nyanga:5|Ogooue-Ivindo:6|Ogooue-Lolo:7|Ogooue-Maritime:8|Woleu-Ntem:9";
s_a[80]="Banjul:B|Lower River:L|Central River:M|North Bank:N|Upper River:U|Western:W";
s_a[81]="Gaza Strip";
s_a[82]="Abkhazia:AB|Ajaria:AJ|Guria:GU|Imeret'i:IM|Kakhet'i:KA|K'vemo K'art'li:KK|Mts'khet'a-Mt'ianet'i:MM|Racha-Lech’khumi-K’vemo Svanet’i:RL|Samts'khe-Javakhet'i:SJ|Shida K'art'li:SK|Samegrelo-Zemo Svanet'i:SZ|T'bilisi:TB";
s_a[83]="Baden-Württemberg:BW|Bayern:BY|Berlin:BE|Brandenburg:BB|Bremen:HB|Hamburg:HH|Hessen:HE|Mecklenburg-Vorpommern:MV|Niedersachsen:NI|Nordrhein-Westfalen:NW|Rheinland-Pfalz:RP|Saarland:SL|Sachsen:SN|Sachsen-Anhalt:ST|Schleswig-Holstein:SH|Thüringen:TH";
s_a[84]="Ashanti:AH|Brong-Ahafo:BA|Central:CP|Eastern:EP|Greater Accra:AA|Northern:NP|Upper East:UE|Upper West:UW|Volta:TV|Western:WP";
s_a[85]="Gibraltar";
s_a[86]="Ile du Lys|Ile Glorieuse";
s_a[87]="Thessalía:E|Anatolikí Makedonía kai Thráki:A|Attikí:I|Dytikí Elláda:G|Dytiki Makedonia:C|Ionía Nísia:F|Ípeiros:D|Kentrikí Makedonía:B|Kríti:M|Notío Aigaío:L|Peloponnísos:J|Stereá Elláda:H|Voreío Aigaío:K";
s_a[88]="Kommune Kujalleq:KU|Kommuneqarfik Sermersooq:SM|Qaasuitsup Kommunia:QA|Qeqqata Kommunia:QE"
s_a[89]="Saint Andrew:01|Saint David:02|Saint George:03|Saint John:04|Saint Mark:05|Saint Patrick:06|Southern Grenadine Islands:10";
s_a[90]="Basse-Terre|Grande-Terre|Iles de la Petite Terre|Iles des Saintes|Marie-Galante";
s_a[91]="Guam";
s_a[92]="Alta Verapaz:AV|Baja Verapaz:BV|Chimaltenango:CM|Chiquimula:CQ|El Progreso:PR|Escuintla:ES|Guatemala:GU|Huehuetenango:HU|Izabal:IZ|Jalapa:JA|Jutiapa:JU|Petén:PE|Quetzaltenango:QZ|Quiché:QC|Retalhuleu:RE|Sacatepéquez:SA|San Marcos:SM|Santa Rosa:SR|Sololá:SO|Suchitepéquez:SU|Totonicapán:TO|Zacapa:ZA";
s_a[93]="Castel|Forest|St. Andrew|St. Martin|St. Peter Port|St. Pierre du Bois|St. Sampson|St. Saviour|Torteval|Vale";
s_a[94]="Beyla:BE|Boffa:BF|Boké:BK|Coyah:CO|Dabola:DB|Dalaba:DL|Dinguiraye:DI|Dubréka:DU|Faranah:FA|Forécariah:FO|Fria:FR|Gaoual:GA|Guékédou:GU|Kankan:KA|Kérouané:KE|Kindia:KD|Kissidougou:KS|Koubia:KB|Koundara:KN|Kouroussa:KO|Labé:LA|Lélouma:LE|Lola:LO|Macenta:MC|Mali:ML|Mamou:MM|Mandiana:MD|Nzérékoré:NZ|Pita:PI|Siguiri:SI|Télimélé:TE|Tougué:TO|Yomou:YO";
s_a[95]="Bafatá:BA|Biombo:BM|Bissau:BS|Bolama:BL|Cacheu:CA|Gabú:GA|Oio:OI|Quinara:QU|Tombali:TO";
s_a[96]="Barima-Waini:BA|Cuyuni-Mazaruni:CU|Demerara-Mahaica:DE|East Berbice-Corentyne:EB|Essequibo Islands-West Demerara:ES|Mahaica-Berbice:MA|Pomeroon-Supenaam:PM|Potaro-Siparuni:PT|Upper Demerara-Berbice:UD|Upper Takutu-Upper Essequibo:UT";
s_a[97]="Artibonite:AR|Centre:CE|Grande’Anse:GA|Nippes:NI|Nord:ND|Nord-Est:NE|Nord-Ouest:NO|Ouest:OU|Sud:SD|Sud-Est:SE";
s_a[98]="Heard Island and McDonald Islands";
s_a[99]="Holy See (Vatican City)"
s_a[100]="Atlántida:AT|Choluteca:CH|Colón:CL|Comayagua:CM|Copán:CP|Cortés:CR|El Paraíso:EP|Francisco Morazán:FM|Gracias a Dios:GD|Islas de la Bahía:IB|Intibucá:IN|Lempira:LE|La Paz:LP|Ocotepeque:OC|Olancho:OL|Santa Bárbara:SB|Valle:VA|Yoro:YO";
s_a[101]="Hong Kong";
s_a[102]="Howland Island";
s_a[103]="Bács-Kiskun:BK|Baranya:BA|Békés:BE|Békéscsaba:BC|Borsod-Abaúj-Zemplén:BZ|Budapest:BU|Csongrád:CS|Debrecen:DE|Dunaújváros:DU|Eger:EG|Érd:ER|Fejér:FE|Gyor:GY|Gyor-Moson-Sopron:GS|Hajdú-Bihar:HB|Heves:HE|Hódmezovásárhely:HV|Jász-Nagykun-Szolnok:JN|Kaposvár:KV|Kecskemét:KM|Komárom-Esztergom:KE|Miskolc:MI|Nagykanizsa:NK|Nógrád:NO|Nyíregyháza:NY|Pécs:PS|Pest:PE|Salgótarján:ST|Somogy:SO|Sopron:SN|Szabolcs-Szatmár-Bereg:SZ|Szeged:SD|Székesfehérvár:SF|Szekszárd:SS|Szolnok:SK|Szombathely:SH|Tatabánya:TB|Tolna:TO|Vas:VA|Veszprém:VE|Veszprém:VM|Zala:ZA|Zalaegerszeg:ZE";
s_a[104]="Austurland:7|Höfuðborgarsvæði utan Reykjavíkur:1|Norðurland eystra:6|Norðurland vestra:5|Suðurland:8|Suðurnes:2|Vestfirðir:4|Vesturland:3";
s_a[105]="Andaman and Nicobar Islands:AN|Andhra Pradesh:AP|Arunachal Pradesh:AR|Assam:AS|Bihar:BR|Chandigarh:CH|Chhattisgarh:CT|Dadra and Nagar Haveli:DN|Daman and Diu:DD|Delhi:DL|Goa:GA|Gujarat:GJ|Haryana:HR|Himachal Pradesh:HP|Jammu and Kashmir:JK|Jharkhand:JH|Karnataka:KA|Kerala:KL|Lakshadweep:LD|Madhya Pradesh:MP|Maharashtra:MH|Manipur:MN|Meghalaya:ML|Mizoram:MZ|Nagaland:NL|Odisha:OR|Puducherry:PY|Punjab:PB|Rajasthan:RJ|Sikkim:SK|Tamil Nadu:TN|Telangana:TG|Tripura:TR|Uttar Pradesh:UP|Uttarakhand:UT|West Bengal:WB";
s_a[106]="Aceh:AC|Bali:BA|Banten:BT|Bengkulu:BE|Gorontalo:GO|Jakarta Raya:JK|Jambi:JA|Jawa Barat:JB|Jawa Tengah:JT|Jawa Timur:JI|Kalimantan Barat:KB|Kalimantan Selatan:KS|Kalimantan Tengah:KT|Kalimantan Timur:KI|Kalimantan Utara:KU|Kepulauan Bangka Belitung:BB|Kepulauan Riau:KR|Lampung:LA|Maluku:MA|Maluku Utara:MU|Nusa Tenggara Barat:NB|Nusa Tenggara Timur:NT|Papua:PA|Papua Barat:PB|Riau:RI|Sulawesi Barat:SR|Sulawesi Selatan:SN|Sulawesi Tengah:ST|Sulawesi Tenggara:SG|Sulawesi Utara:SA|Sumatera Barat:SB|Sumatera Selatan:SS|Sumatera Utara:SU|Yogyakarta:YO";
s_a[107]="Alborz:32|Ardabīl:3|Āz̄arbāyjān-e Gharbī:2|Āz̄arbāyjān-e Sharqī:1|Būshehr:6|Chahār Maḩāl va Bakhtīārī:8|Eşfahān:4|Fārs:14|Gīlān:19|Golestān:27|Hamadān:24|Hormozgān:23|Īlām:5|Kermān:15|Kermānshāh:17|Khorāsān-e Jonūbī:29|Khorāsān-e Raẕavī:30|Khorāsān-e Shomālī:31|Khūzestān:10|Kohgīlūyeh va Bowyer Aḩmad:18|Kordestān:16|Lorestān:20|Markazī:22|Māzandarān:21|Qazvīn:28|Qom:26|Semnān:12|Sīstān va Balūchestān:13|Tehrān:7|Yazd:25|Zanjān:11";
s_a[108]="AI Anbar:AN|AI Muthanná:MU|Al Basrah:BA|Al Qadisiyah:QA|An Najaf:NA|Arbil:AR|As Sulaymaniyah:SU|Babil:BB|Baghdad:BG|Dahuk:DA|Dhi Qar:DQ|Diyalá:DI|Karbala':KA|Kirkuk:KI|Maysan:MA|Ninawá:NI|Salah ad Din:SD|Wasit:WA";
s_a[109]="Carlow:CW|Cavan:CN|Clare:CE|Cork:CO|Donegal:DL|Dublin:D|Galway:G|Kerry:KY|Kildare:KE|Kilkenny:KK|Laois:LS|Leitrim:LM|Limerick:LK|Longford:LD|Louth:LH|Mayo:MO|Meath:MH|Monaghan:MN|Offaly:OY|Roscommon:RN|Sligo:SO|Tipperary:TA|Waterford:WD|Westmeath:WH|Wexford:WX|Wicklow:WW";
s_a[110]="Antrim|Ards|Armagh|Ballymena|Ballymoney|Banbridge|Belfast|Carrickfergus|Castlereagh|Coleraine|Cookstown|Craigavon|Derry|Down|Dungannon|Fermanagh|Larne|Limavady|Lisburn|Magherafelt|Moyle|Newry and Mourne|Newtownabbey|North Down|Omagh|Strabane";
s_a[111]="Al Awsat:M|Al Janubi:D|Ash Shamali:Z|H_efa:HA|Tel-Aviv:TA|Yerushalayim:JM";
s_a[112]="Agrigento:AG|Alessandria:AL|Ancona:AN|Aosta / Aoste (fr):AO|Arezzo:AR|Ascoli Piceno:AP|Asti:AT|Avellino:AV|Bari:BA|Barletta-Andria-Trani:BT|Belluno:BL|Benevento:BN|Bergamo:BG|Biella:BI|Bologna:BO|Bolzano / Bozen (de):BZ|Brescia:BS|Brindisi:BR|Cagliari:CA|Caltanissetta:CL|Campobasso:CB|Carbonia-Iglesias:CI|Caserta:CE|Catania:CT|Catanzaro:CZ|Chieti:CH|Como:CO|Cosenza:CS|Cremona:CR|Crotone:KR|Cuneo:CN|Enna:EN|Fermo:FM|Ferrara:FE|Firenze:FI|Foggia:FG|Forlì-Cesena:FC|Frosinone:FR|Genova:GE|Gorizia:GO|Grosseto:GR|Imperia:IM|Isernia:IS|La Spezia:SP|L'Aquila:AQ|Latina:LT|Lecce:LE|Lecco:LC|Livorno:LI|Lodi:LO|Lucca:LU|Macerata:MC|Mantova:MN|Massa-Carrara:MS|Matera:MT|Medio Campidano:VS|Messina:ME|Milano:MI|Modena:MO|Monza e Brianza:MB|Napoli:NA|Novara:NO|Nuoro:NU|Ogliastra:OG|Olbia-Tempio:OT|Oristano:OR|Padova:PD|Palermo:PA|Parma:PR|Pavia:PV|Perugia:PG|Pesaro e Urbino:PU|Pescara:PE|Piacenza:PC|Pisa:PI|Pistoia:PT|Pordenone:PN|Potenza:PZ|Prato:PO|Ragusa:RG|Ravenna:RA|Reggio Calabria:RC|Reggio Emilia:RE|Rieti:RI|Rimini:RN|Roma:RM|Rovigo:RO|Salerno:SA|Sassari:SS|Savona:SV|Siena:SI|Siracusa:SR|Sondrio:SO|Taranto:TA|Teramo:TE|Terni:TR|Torino:TO|Trapani:TP|Trento:TN|Treviso:TV|Trieste:TS|Udine:UD|Varese:VA|Venezia:VE|Verbano-Cusio-Ossola:VB|Vercelli:VC|Verona:VR|Vibo Valentia:VV|Vicenza:VI|Viterbo:VT";
s_a[113]="Clarendon:13|Hanover:9|Kingston:1|Manchester:12|Portland:4|Saint Andrew:2|Saint Ann:6|Saint Catherine:14|Saint Elizabeth:11|Saint James:8|Saint Mary:5|Saint Thomas:3|Trelawny:7|Westmoreland:10";
s_a[114]="Jan Mayen";
s_a[115]="Aichi:23|Akita:5|Aomori:2|Chiba:12|Ehime:38|Fukui:18|Fukuoka:40|Fukushima:7|Gifu:21|Gunma:10|Hiroshima:34|Hokkaido:1|Hyogo:28|Ibaraki:8|Ishikawa:17|Iwate:3|Kagawa:37|Kagoshima:46|Kanagawa:14|Kochi:39|Kumamoto:43|Kyoto:26|Mie:24|Miyagi:4|Miyazaki:45|Nagano:20|Nagasaki:42|Nara:29|Niigata:15|Oita:44|Okayama:33|Okinawa:47|Osaka:27|Saga:41|Saitama:11|Shiga:25|Shimane:32|Shizuoka:22|Tochigi:9|Tokushima:36|Tokyo:13|Tottori:31|Toyama:16|Wakayama:30|Yamagata:6|Yamaguchi:35|Yamanashi:19";
s_a[116]="Jarvis Island";
s_a[117]="Jersey";
s_a[118]="Johnston Atoll";
s_a[119]="‘Ajlun:AJ|Al ‘Aqabah:AQ|AI Karak:KA|AI Mafraq:MA|Al ‘A¯simah:AM|Al Balqa’:BA|At Tafilah:AT|Az Zarqa’:AZ|Irbid:IR|Jarash:JA|Ma‘an:MN|Madaba:MD";
s_a[120]="Juan de Nova Island";
s_a[121]="Almaty:ALA|Almaty oblysy:ALM|Aqmola oblysy:AKM|Aqtöbe oblysy:AKT|Astana:AST|Atyrau oblysy:ATY|Batys Qazaqstan oblysy:ZAP|Bayqonyr:BAY|Mangghystau oblysy:MAN|Ongtüstik Qazaqstan oblysy:YUZ|Pavlodar oblysy:PAV|Qaraghandy oblysy:KAR|Qostanay oblysy:KUS|Qyzylorda oblysy:KZY|Shyghys Qazaqstan oblysy:VOS|Soltüstik Qazaqstan oblysy:SEV|Zhambyl oblysy:ZHA";
s_a[122]="Central:200|Coast:300|Eastern:400|Nairobi Area:110|North Eastern:500|Nyanza:600|Rift Valley:700|Western:800";
s_a[123]="Gilbert Islands:G|Line Islands:L|Phoenix Islands:P";
s_a[124]="Chagang:4|Kangwon:7|North Hamgyong:9|North Hwanghae:6|North Pyongan:3|Pyongyang:1|Rason:13|Ryanggang:10|South Hamgyong:8|South Hwanghae:5|South Pyongan:2"
s_a[125]="Busan:26|Daegu:27|Daejeon:30|Gangwon:42|Gwangju:29|Gyeonggi:41|Incheon:28|Jeju:49|North Chungcheong:43|North Gyeongsang:47|North Jeolla:45|Sejong:50|Seoul:11|South Chungcheong:44|South Gyeongsang:48|South Jeolla:46|Ulsan:31";
s_a[126]="Al ‘Asimah:KU|?awalli:HA|Al A?madi:AH|Al Farwaniyah:FA|Al Jahra’:JA|Mubarak al Kabir:MU";
s_a[127]="Batken:B|Bishkek:GB|Chüy:C|Jalal-Abad:J|Naryn:N|Osh:GO|Osh:O|Talas:T|Ysyk-Köl:Y"
s_a[128]="Attapu [Attopeu]:AT|Bokèo:BK|Bolikhamxai [Borikhane]:BL|Champasak [Champassak]:CH|Houaphan:HO|Khammouan:KH|Louang Namtha:LM|Louangphabang [Louang Prabang):LP|Oudômxai [Oudomsai]:OU|Phôngsali [Phong Saly]:PH|Salavan [Saravane]:SL|Savannakhét:SV|Vientiane:VI|Vientiane:VT|Xaignabouli [Sayaboury]:XA|Xaisômboun:XS|Xékong [Sékong]:XE|Xiangkhouang [Xieng Khouang]:XI";
s_a[129]="Aizkraukles Apriņķis:AI|Alūksnes Apriņķis:AL|Balvu Apriņķis:BL|Bauskas Apriņķis:BU|Cēsu Apriņķis:CE|Daugavpils Apriņķis:DA|Dobeles Apriņķis:DO|Gulbenes Apriņķis:GU|Jēkabpils Apriņķis:JK|Jelgavas Apriņķis:JL|Krāslavas Apriņķis:KR|Kuldīgas Apriņķis:KU|Liepājas Apriņķis:LE|Limbažu Apriņķis:LM|Ludzas Apriņķis:LU|Madonas Apriņķis:MA|Ogres Apriņķis:OG|Preiļu Apriņķis:PR|Rēzeknes Apriņķis:RE|Rīgas Apriņķis:RI|Saldus Apriņķis:SA|Talsu Apriņķis:TA|Tukuma Apriņķis:TU|Valkas Apriņķis:VK|Valmieras Apriņķis:VM|Ventspils Apriņķis:VE";
s_a[130]="Aakkâr:AK|Baalbek-Hermel:BH|Beyrouth:BA|El Béqaa:BI|Liban-Nord:AS|Liban-Sud:JA|Mont-Liban:JL|Nabatîyé:NA";
s_a[131]="Berea:D|Butha-Buthe:B|Leribe:C|Mafeteng:E|Maseru:A|Mohale's Hoek:F|Mokhotlong:J|Qacha's Nek:H|Quthing:G|Thaba-Tseka:K";
s_a[132]="Bomi:BM|Bong:BG|Gbarpolu:GP|Grand Bassa:GB|Grand Cape Mount:CM|Grand Gedeh:GG|Grand Kru:GK|Lofa:LO|Margibi:MG|Maryland:MY|Montserrado:MO|Nimba:NI|River Cess:RI|River Gee:RG|Sinoe:SI";
s_a[133]="Al Butnan:BU|Al Jabal al Akh?ar:JA|Al Jabal al Gharbi:JG|Al Jafarah:JI|Al Jufrah:JU|Al Kufrah:KF|Al Marj:MJ|Al Marqab:MB|Al Wa?at:WA|An Nuqat al Khams:NQ|Az Zawiyah:ZA|Banghazi:BA|Darnah:DR|Ghat:GT|Misratah:MI|Murzuq:MQ|Nalut:NL|Sabha:SB|Surt:SR|Tarabulus:TB|Wadi al Hayat:WD|Wadi ash Shati?:WS";
s_a[134]="Balzers:01|Eschen:02|Gamprin:03|Mauren:04|Planken:05|Ruggell:06|Schaan:07|Schellenberg:08|Triesen:09|Triesenberg:10|Vaduz:11";
s_a[135]="Alytaus Apskritis:AL|Kauno Apskritis:KU|Klaipėdos Apskritis:KL|Marijampolės Apskritis:MR|Panevėžio Apskritis:PN|Šiaulių Apskritis:SA|Tauragės Apskritis:TA|Telšių Apskritis:TE|Utenos Apskritis:UT|Vilniaus Apskritis:VL";
s_a[136]="Capellen:CA|Clervaux:CL|Diekirch:DI|Echternach:EC|Esch-sur-Alzette:ES|Gréivemaacher:GR|Luxembourg:LU|Mersch:ME|Redange:RD|Remich:RM|Vianden:VD|Wiltz:WI";
s_a[137]="Macau";
s_a[138]="Aračinovo:2|Berovo:3|Bitola:4|Bogdanci:5|Bogovinje:6|Bosilovo:7|Brvenica:8|Čaška:80|Centar Župa:78|Češinovo-Obleševo:81|Čučer Sandevo:82|Debar:21|Debarca:22|Delčevo:23|Demir Hisar:25|Demir Kapija:24|Dojran:26|Dolneni:27|Gevgelija:18|Gostivar:19|Gradsko:20|Ilinden:34|Jegunovce:35|Karbinci:37|Kavadarci:36|Kičevo:40|Kočani:42|Konče:41|Kratovo:43|Kriva Palanka:44|Krivogaštani:45|Kruševo:46|Kumanovo:47|Lipkovo:48|Lozovo:49|Makedonska Kamenica:51|Makedonski Brod:52|Mavrovo i Rostuša:50|Mogila:53|Negotino:54|Novaci:55|Novo Selo:56|Ohrid:58|Pehčevo:60|Petrovec:59|Plasnica:61|Prilep:62|Probištip:63|Radoviš:64|Rankovce:65|Resen:66|Rosoman:67|Skopje:85|Sopište:70|Staro Nagoričane:71|Štip:83|Struga:72|Strumica:73|Studeničani:74|Sveti Nikole:69|Tearce:75|Tetovo:76|Valandovo:10|Vasilevo:11|Veles:13|Vevčani:12|Vinica:14|Vrapčište:16|Zelenikovo:32|Želino:30|Zrnovci:33";
s_a[139]="Antananarivo:T|Antsiranana:D|Fianarantsoa:F|Mahajanga:M|Toamasina:A|Toliara:U";
s_a[140]="Balaka:BA|Blantyre:BL|Central:C|Chikwawa:CK|Chiradzulu:CR|Chitipa:CT|Dedza:DE|Dowa:DO|Karonga:KR|Kasungu:KS|Likoma:LK|Lilongwe:LI|Machinga:MH|Mangochi:MG|Mchinji:MC|Mulanje:MU|Mwanza:MW|Mzimba:MZ|Neno:NE|Nkhata Bay:NB|Nkhotakota:NK|Northern:N|Nsanje:NS|Ntcheu:NU|Ntchisi:NI|Phalombe:PH|Rumphi:RU|Salima:SA|Southern:S|Thyolo:TH|Zomba:ZO";
s_a[141]="Johor:1|Kedah:2|Kelantan:3|Melaka:4|Negeri Sembilan:5|Pahang:6|Perak:8|Perlis:9|Pulau Pinang:7|Sabah:12|Sarawak:13|Selangor:10|Terengganu:11|Wilayah Persekutuan Kuala Lumpur:14|Wilayah Persekutuan Labuan:15|Wilayah Persekutuan Putrajaya:16";
s_a[142]="Alifu Alifu:2|Alifu Dhaalu:0|Baa:20|Dhaalu:17|Faafu:14|Gaafu Alifu:27|Gaafu Dhaalu:28|Gnaviyani:29|Haa Alifu:7|Haa Dhaalu:23|Kaafu:26|Laamu:5|Lhaviyani:3|Meemu:12|Noonu:25|Raa:13|Seenu:1|Shaviyani:24|Thaa:8|Vaavu:4";
s_a[143]="Gao:7|Kayes:1|Kidal:8|Koulikoro:2|Mopti:5|Segou:4|Sikasso:3|Tombouctou:6";
s_a[144]="Attard:1|Balzan:2|Birgu:3|Birkirkara:4|Birżebbuġa:5|Bormla:6|Dingli:7|Fgura:8|Floriana:9|Fontana:10|Għajnsielem:13|Għarb:14|Għargħur:15|Għasri:16|Għaxaq:17|Gudja:11|Gżira:12|Ħamrun:18|Iklin:19|Isla:20|Kalkara:21|Kerċem:22|Kirkop:23|Lija:24|Luqa:25|Marsa:26|Marsaskala:27|Marsaxlokk:28|Mdina:29|Mellieħa:30|Mġarr:31|Mosta:32|Mqabba:33|Msida:34|Mtarfa:35|Munxar:36|Nadur:37|Naxxar:38|Paola:39|Pembroke:40|Pietà:41|Qala:42|Qormi:43|Qrendi:44|Rabat Gozo:45|Rabat Malta:46|Safi:47|Saint John:49|Saint Julian's:48|Saint Lawrence:50|Saint Lucia's:53|Saint Paul's Bay:51|Sannat:52|Santa Venera:54|Siġġiewi:55|Sliema:56|Swieqi:57|Ta' Xbiex:58|Tarxien:59|Valletta:60|Xagħra:61|Xewkija:62|Xgħajra:63|Żabbar:64|Żebbuġ Gozo:65|Żebbuġ Malta:66|Żejtun:67|Żurrieq:68";
s_a[145]="Man, Isle of";
s_a[146]="Ailinglapalap:ALL|Ailuk:ALK|Arno:ARN|Aur:AUR|Bikini and Kili:KIL|Ebon:EBO|Enewetak and Ujelang:ENI|Jabat:JAB|Jaluit:JAL|Kwajalein:KWA|Lae:LAE|Lib:LIB|Likiep:LIK|Majuro:MAJ|Maloelap:MAL|Mejit:MEJ|Mili:MIL|Namdrik:NMK|Namu:NMU|Ralik chain:L|Ratak chain:T|Rongelap:RON|Ujae:UJA|Utrik:UTI|Wotho:WTH|Wotje:WTJ";
s_a[147]="Martinique";
s_a[148]="Adrar:7|Assaba:3|Brakna:5|Dakhlet Nouâdhibou:8|Gorgol:4|Guidimaka:10|Hodh ech Chargui:1|Hodh el Gharbi:2|Inchiri:12|Nouakchott Nord:14|Nouakchott Ouest:13|Nouakchott Sud:15|Tagant:9|Tiris Zemmour:11|Trarza:6";
s_a[149]="Agalega Islands:AG|Beau Bassin-Rose Hill:BR|Black River:BL|Cargados Carajos Shoals [Saint Brandon Islands]:CC|Curepipe:CU|Flacq:FL|Grand Port:GP|Moka:MO|Pamplemousses:PA|Plaines wilhems:PW|Port Louis:PL|Port Louis:PU|Quatre Bornes:QB|Rivière du Rempart:RR|Rodrigues Island:RO|Savanne:SA|Vacoas-Phoenix:VP";
s_a[150]="Mayotte";
s_a[151]="Aguascalientes:AGU|Baja California:BCN|Baja California Sur:BCS|Campeche:CAM|Chiapas:CHP|Chihuahua:CHH|Ciudad de Mexico:CMX|Coahuila de Zaragoza:COA|Colima:COL|Durango:DUR|Guanajuato:GUA|Guerrero:GRO|Hidalgo:HID|Jalisco:JAL|México:MEX|Michoacán de Ocampo:MIC|Morelos:MOR|Nayarit:NAY|Nuevo León:NLE|Oaxaca:OAX|Puebla:PUE|Querétaro:QUE|Quintana Roo:ROO|San Luis Potosí:SLP|Sinaloa:SIN|Sonora:SON|Tabasco:TAB|Tamaulipas:TAM|Tlaxcala:TLA|Veracruz de Ignacio de la Llave:VER|Yucatán:YUC|Zacatecas:ZAC";
s_a[152]="Chuuk:TRK|Kosrae:KSA|Pohnpei:PNI|Yap:YAP";
s_a[153]="Midway Islands";
s_a[154]="Anenii Noi:AN|Balti:BA|Basarabeasca:BS|Bender [Tighina]:BD|Briceni:BR|Cahul:CA|Calarasi:CL|Cantemir:CT|Causeni:CS|Chisinau:CU|Cimislia:CM|Criuleni:CR|Donduseni:DO|Drochia:DR|Dubasari:DU|Edinet:ED|Falesti:FA|Floresti:FL|Gagauzia, Unitatea teritorialaautonoma (UTAG):GA|Glodeni:GL|Hîncesti:HI|Ialoveni:IA|Leova:LE|Nisporeni:NI|Ocniþa:OC|Orhei:OR|Rezina:RE|Rîscani:RI|Sîngerei:SI|Soldanesti:SD|Soroca:SO|Stefan Voda:SV|Stînga Nistrului, unitatea teritoriala din:SN|Straseni:ST|Taraclia:TA|Telenesti:TE|Ungheni:UN";
s_a[155]="Fontvieille:FO|Jardin Exotique:JE|La Colle:CL|La Condamine:CO|La Gare:GA|La Source:SO|Larvotto:LA|Malbousquet:MA|Monaco-Ville:MO|Moneghetti:MG|Monte-Carlo:MC|Moulins:MU|Port-Hercule:PH|Sainte-Dévote:SD|Saint-Roman:SR|Spélugues:SP|Vallon de la Rousse:VR";
s_a[156]="Arhangay:73|Bayanhongor:69|Bayan-Ölgiy:71|Bulgan:67|Darhan uul:37|Dornod:61|Dornogovĭ:63|Dundgovĭ:59|Dzavhan:57|Govĭ-Altay:65|Govĭ-Sümber:64|Hentiy:39|Hovd:43|Hövsgöl:41|Ömnögovĭ:53|Orhon:35|Övörhangay:55|Selenge:49|Sühbaatar:51|Töv:47|Ulaanbaatar:1|Uvs:46";
s_a[157]="Saint Anthony|Saint Georges|Saint Peter's";
s_a[158]="Agadir-Ida-Outanane:AGD|Al Haouz:HAO|Al Hoceïma:HOC|Aousserd:AOU|Assa-Zag:ASZ|Azilal:AZI|Ben Slimane:BES|Beni Mellal:BEM|Berkane:BER|Boujdour:BOD|Boulemane:BOM|Casablanca [Dar el Beïda]:CAS|Chefchaouen:CHE|Chichaoua:CHI|Chtouka-Ait Baha:CHT|El Hajeb:HAJ|El Jadida:JDI|Errachidia:ERR|Es Smara:ESM|Essaouira:ESI|Fahs-Beni Makada:FAH|Fès-Dar-Dbibegh:FES|Figuig:FIG|Guelmim:GUE|Ifrane:IFR|Inezgane-Ait Melloul:INE|Jrada:JRA|Kelaat es Sraghna:KES|Kénitra:KEN|Khemisset:KHE|Khenifra:KHN|Khouribga:KHO|Laâyoune:LAA|Larache:LAR|Marrakech-Medina:MMD|Marrakech-Menara:MMN|Médiouna:MED|Meknès:MEK|Mohammadia:MOH|Moulay Yacoub:MOU|Nador:NAD|Nouaceur:NOU|Ouarzazate:OUA|Oued ed Dahab:OUD|Oujda-Angad:OUJ|Rabat:RAB|Safi:SAF|Salé:SAL|Sefrou:SEF|Settat:SET|Sidi Kacem:SIK|Sidi Youssef Ben Ali:SYB|Skhirate-Témara:SKH|Tanger-Assilah:TNG|Tan-Tan:TNT|Taounate:TAO|Taourirt:TAI|Taroudannt:TAR|Tata:TAT|Taza:TAZ|Tétouan:TET|Tiznit:TIZ|Zagora:ZAG";
s_a[159]="Cabo Delgado:P|Gaza:G|Inhambane:I|Manica:B|Maputo:L|Maputo:MPM|Nampula:N|Niaosa:A|Sofala:S|Tete:T|Zambézia:Q";
s_a[160]="Erongo:ER|Hardap:HA|Karas:KA|Kavango East:KE|Kavango West:KW|Khomas:KH|Kunene:KU|Ohangwena:OW|Omaheke:OH|Omusati:OS|Oshana:ON|Oshikoto:OT|Otjozondjupa:OD|Zambezi:CA";
s_a[161]="Aiwo:1|Anabar:2|Anetan:3|Anibare:4|Baiti:5|Boe:6|Buada:7|Denigomodu:8|Ewa:9|Ijuw:10|Meneng:11|Nibok:12|Uaboe:13|Yaren:14";
s_a[162]="Bagmati:BA|Bheri:BH|Dhawalagiri:DH|Gandaki:GA|Janakpur:JA|Karnali:KA|Kosi [Koshi]:KO|Lumbini:LU|Mahakali:MA|Mechi:ME|Narayani:NA|Rapti:RA|Sagarmatha:SA|Seti:SE";
s_a[163]="Drenthe:DR|Flevoland:FL|Fryslân:FR|Gelderland:GE|Groningen:GR|Limburg:LI|Noord-Brabant:NB|Noord-Holland:NH|Overijssel:OV|Utrecht:UT|Zeeland:ZE|Zuid-Holland:ZH";
s_a[164]="Netherlands Antilles";
s_a[165]="Iles Loyaute|Nord|Sud";
s_a[166]="Auckland:AUK|Bay of Plenty:BOP|Canterbury:CAN|Chatham Islands Territory:CIT|Gisborne:GIS|Hawkes's Bay:HKB|Manawatu-Wanganui:MWT|Marlborough:MBH|Nelson:NSN|Northland:NTL|Otago:OTA|Southland:STL|Taranaki:TKI|Tasman:TAS|Waikato:WKO|Wellington:WGN|West Coast:WTC";
s_a[167]="Atlántico Norte:AN|Atlántico Sur:AS|Boaco:BO|Carazo:CA|Chinandega:CI|Chontales:CO|Estelí:ES|Granada:GR|Jinotega:JI|León:LE|Madriz:MD|Managua:MN|Masaya:MS|Matagalpa:MT|Nueva Segovia:NS|Río San Juan:SJ|Rivas:RI";
s_a[168]="Agadez:1|Diffa:2|Dosso:3|Maradi:4|Niamey:8|Tahoua:5|Tillaberi:6|Zinder:7";
s_a[169]="Abia:AB|Abuja Capital Territory:FC|Adamawa:AD|Akwa Ibom:AK|Anambra:AN|Bauchi:BA|Bayelsa:BY|Benue:BE|Borno:BO|Cross River:CR|Delta:DE|Ebonyi:EB|Edo:ED|Ekiti:EK|Enugu:EN|Gombe:GO|Imo:IM|Jigawa:JI|Kaduna:KD|Kano:KN|Katsina:KT|Kebbi:KE|Kogi:KO|Kwara:KW|Lagos:LA|Nasarawa:NA|Niger:NI|Ogun:OG|Ondo:ON|Osun:OS|Oyo:OY|Plateau:PL|Rivers:RI|Sokoto:SO|Taraba:TA|Yobe:YO|Zamfara:ZA";
s_a[170]="Niue";
s_a[171]="Norfolk Island";
s_a[172]="Northern Islands|Rota|Saipan|Tinian";
s_a[173]="Akershus:2|Aust-Agder:9|Buskerud:6|Finnmark:20|Hedmark:4|Hordaland:12|Jan Mayen:22|Møre og Romsdal:15|Nordland:18|Nord-Trøndelag:17|Oppland:5|Oslo:3|Østfold:1|Rogaland:11|Sogn og Fjordane:14|Sør-Trøndelag:16|Svalbard:21|Telemark:8|Troms:19|Vest-Agder:10|Vestfold:7";
s_a[174]="Ad Dakhiliyah:DA|AI Wusta:WU|Al Buraymi:BU|Az Zahirah:ZA|Janub al Batinah:BJ|Janub ash Sharqiyah:SJ|Masqat:MA|Musandam:MU|Shamal al Batinah:BS|Shamal ash Sharqiyah:SS|Z¸ufar:ZU";
s_a[175]="Azad Kashmir:JK|Balochistan:BA|Federally Administered Tribal Areas:TA|Gilgit-Baltistan:GB|Islamabad:IS|Khyber Pakhtunkhwa:KP|Punjab:PB|Sindh:SD";
s_a[176]="Aimeliik:2|Airai:4|Angaur:10|Hatobohei:50|Kayangel:100|Koror:150|Melekeok:212|Ngaraard:214|Ngarchelong:218|Ngardmau:222|Ngatpang:224|Ngchesar:226|Ngeremlengui:227|Ngiwal:228|Peleliu:350|Sonsorol:370";
s_a[177]="Bocas del Toro:1|Chiriquí:4|Coclé:2|Colón:3|Darién:5|Emberá:EM|Herrera:6|Kuna Yala:KY|Los Santos:7|Ngöbe-Buglé:NB|Panamá:8|Panamá Oeste:10|Veraguas:9";
s_a[178]="Bougainville:NSB|Central:CPM|Chimbu:CPK|East New Britain:EBR|East Sepik:ESW|Eastern Highlands:EHG|Enga:EPW|Gulf:GPK|Hela:HLA|Jiwaka:JWK|Madang:MPM|Manus:MRL|Milne Bay:MBA|Morobe:MPL|National Capital District (Port Moresby):NCD|New Ireland:NIK|Northern:NPP|Southern Highlands:SHM|West New Britain:WBK|West Sepik:SAN|Western:WPD|Western Highlands:WHM";
s_a[179]="Asunción:ASU|Alto Paraguay:16|Alto Paraná:10|Amambay:13|Boquerón:19|Caaguazú:5|Caazapá:6|Canindeyú:14|Central:11|Concepción:1|Cordillera:3|Guairá:4|Itapúa:7|Misiones:8|Ñeembucú:12|Paraguarí:9|Presidente Hayes:15|San Pedro:2";
s_a[180]="Amazonas:AMA|Ancash:ANC|Apurímac:APU|Arequipa:ARE|Ayacucho:AYA|Cajamarca:CAJ|Cuzco [Cusco]:CUS|El Callao:CAL|Huancavelica:HUV|Huánuco:HUC|Ica:ICA|Junín:JUN|La Libertad:LAL|Lambayeque:LAM|Lima:LIM|Lima hatun llaqta:LMA|Loreto:LOR|Madre de Dios:MDD|Moquegua:MOQ|Pasco:PAS|Piura:PIU|Puno:PUN|San Martín:SAM|Tacna:TAC|Tumbes:TUM|Ucayali:UCA";
s_a[181]="Abra:ABR|Agusan del Norte:AGN|Agusan del Sur:AGS|Aklan:AKL|Albay:ALB|Antique:ANT|Apayao:APA|Aurora:AUR|Basilan:BAS|Bataan:BAN|Batanes:BTN|Batangas:BTG|Benguet:BEN|Biliran:BIL|Bohol:BOH|Bukidnon:BUK|Bulacan:BUL|Cagayan:CAG|Camarines Norte:CAN|Camarines Sur:CAS|Camiguin:CAM|Capiz:CAP|Catanduanes:CAT|Cavite:CAV|Cebu:CEB|Compostela Valley:COM|Davao del Norte:DAV|Davao del Sur:DAS|Davao Oriental:DAO|Dinagat Islands:DIN|Eastern Samar:EAS|Guimaras:GUI|Ifugao:IFU|Ilocos Norte:ILN|Ilocos Sur:ILS|Iloilo:ILI|Isabela:ISA|Kalinga-Apayao:KAL|Kanlurang Dabaw:DVO|Kotabato:NCO|La Union:LUN|Laguna:LAG|Lanao del Norte:LAN|Lanao del Sur:LAS|Leyte:LEY|Maguindanao:MAG|Marinduque:MAD|Masbate:MAS|Mindoro Occidental:MDC|Mindoro Oriental:MDR|Misamis Occidental:MSC|Misamis Oriental:MSR|Mountain Province:MOU|Negros occidental:NEC|Negros oriental:NER|Northern Samar:NSA|Nueva Ecija:NUE|Nueva Vizcaya:NUV|Palawan:PLW|Pampanga:PAM|Pangasinan:PAN|Quezon:QUE|Quirino:QUI|Rizal:RIZ|Romblon:ROM|Sarangani:SAR|Siquijor:SIG|Sorsogon:SOR|South Cotabato:SCO|Southern Leyte:SLE|Sultan Kudarat:SUK|Sulu:SLU|Surigao del Norte:SUN|Surigao del Sur:SUR|Tarlac:TAR|Tawi-Tawi:TAW|Western Samar:WSA|Zambales:ZMB|Zamboanga del Norte:ZAN|Zamboanga del Sur:ZAS|Zamboanga Sibuguey [Zamboanga Sibugay]:ZSI";
s_a[182]="Pitcaim Islands";
s_a[183]="Dolnoslaskie:DS|Kujawsko-pomorskie:KP|Lódzkie:LD|Lubelskie:LU|Lubuskie:LB|Malopolskie:MA|Mazowieckie:MZ|Opolskie:OP|Podkarpackie:PK|Podlaskie:PD|Pomorskie:PM|Slaskie:SL|Swietokrzyskie:SK|Warminsko-mazurskie:WN|Wielkopolskie:WP|Zachodniopomorskie:ZP";
s_a[184]="Acores (Azores)|Aveiro|Beja|Braga|Braganca|Castelo Branco|Coimbra|Evora|Faro|Guarda|Leiria|Lisboa|Madeira|Portalegre|Porto|Santarem|Setubal|Viana do Castelo|Vila Real|Viseu";
s_a[185]="Adjuntas|Aguada|Aguadilla|Aguas Buenas|Aibonito|Anasco|Arecibo|Arroyo|Barceloneta|Barranquitas|Bayamon|Cabo Rojo|Caguas|Camuy|Canovanas|Carolina|Catano|Cayey|Ceiba|Ciales|Cidra|Coamo|Comerio|Corozal|Culebra|Dorado|Fajardo|Florida|Guanica|Guayama|Guayanilla|Guaynabo|Gurabo|Hatillo|Hormigueros|Humacao|Isabela|Jayuya|Juana Diaz|Juncos|Lajas|Lares|Las Marias|Las Piedras|Loiza|Luquillo|Manati|Maricao|Maunabo|Mayaguez|Moca|Morovis|Naguabo|Naranjito|Orocovis|Patillas|Penuelas|Ponce|Quebradillas|Rincon|Rio Grande|Sabana Grande|Salinas|San German|San Juan|San Lorenzo|San Sebastian|Santa Isabel|Toa Alta|Toa Baja|Trujillo Alto|Utuado|Vega Alta|Vega Baja|Vieques|Villalba|Yabucoa|Yauco";
s_a[186]="Ad Dawhah:DA|Al Khawr wa adh Dhakhirah:KH|Al Wakrah:WA|Ar Rayyan:RA|Ash Shamal:MS|Az¸ Z¸a‘ayin:ZA|Umm Salal:US";
s_a[187]="Reunion";
s_a[188]="Alba:AB|Arad:AR|Arges:AG|Bacau:BC|Bihor:BH|Bistrita-Nasaud:BN|Botosani:BT|Braila:BR|Brasov:BV|Bucuresti:B|Buzau:BZ|Calarasi:CL|Caras-Severin:CS|Cluj:CJ|Constarta:CT|Covasna:CV|Dâmbovita:DB|Dolj:DJ|Galati:GL|Giurgiu:GR|Gorj:GJ|Harghita:HR|Hunedoara:HD|Ialomita:IL|Iasi:IS|Ilfov:IF|Maramures:MM|Mehedinti:MH|Mures:MS|Neamt:NT|Olt:OT|Prahova:PH|Salaj:SJ|Satu Mare:SM|Sibiu:SB|Suceava:SV|Teleorman:TR|Timis:TM|Tulcea:TL|Vâlcea:VL|Vaslui:VS|Vrancea:VN";
s_a[189]="Adygeya, Respublika:AD|Altay, Respublika:AL|Altayskiy kray:ALT|Amurskaya oblast':AMU|Arkhangel'skaya oblast,:ARK|Astrakhanskaya oblast':AST|Bashkortostan, Respublika:BA|Belgorodskaya oblast':BEL|Bryanskaya oblast':BRY|Buryatiya, Respublika:BU|Chechenskaya Respublika:CE|Chelyabinskaya oblast':CHE|Chukotskiy avtonomnyy okrug:CHU|Chuvashskaya Respublika:CU|Dagestan, Respublika:DA|Ingushskaya Respublika [Respublika Ingushetiya]:IN|Irkutskaya oblast':IRK|Ivanovskaya oblast':IVA|Kabardino-Balkarskaya Respublika:KB|Kaliningradskaya oblast,:KGD|Kalmykiya, Respublika:KL|Kaluzhskaya oblast':KLU|Kamchatskaya oblast':KAM|Karachayevo-Cherkesskaya Respublika:KC|Kareliya, Respublika:KR|Kemerovskaya oblast':KEM|Khabarovskiy kray:KHA|Khakasiya, Respublika:KK|Khanty-Mansiyskiy avtonomnyy okrug:KHM|Kirovskaya oblast':KIR|Komi, Respublika:KO|Kostromskaya oblast':KOS|Krasnodarskiy kray:KDA|Krasnoyarskiy kray:KYA|Kurganskaya oblast':KGN|Kurskaya oblast':KRS|Leningradskaya oblast':LEN|Lipetskaya oblast':LIP|Magadanskaya oblast':MAG|Mariy El, Respublika:ME|Mordoviya, Respublika:MO|Moskovskaya oblast':MOS|Moskva:MOW|Murmanskaya oblast':MUR|Nenetskiy avtonomnyy okrug:NEN|Nizhegorodskaya oblast':NIZ|Novgorodskaya oblast':NGR|Novosibirskaya oblast':NVS|Omskaya oblast':OMS|Orenburgskaya oblast':ORE|Orlovskaya oblast':ORL|Penzenskaya oblast':PNZ|Perm:PER|Primorskiy kray:PRI|Pskovskaya oblast':PSK|Rostovskaya oblast':ROS|Ryazanskaya oblast':RYA|Sakha, Respublika [Yakutiya]:SA|Sakhalinskaya oblast':SAK|Samarskaya oblast':SAM|Sankt-Peterburg:SPE|Saratovskaya oblast':SAR|Severnaya Osetiya, Respublika Alaniya] [Respublika Severnaya Osetiya-Alaniya]:SE|Smolenskaya oblast':SMO|Stavropol'skiy kray:STA|Sverdlovskaya oblast':SVE|Tambovskaya oblast':TAM|Tatarstan, Respublika:TA|Tomskaya oblast':TOM|Tul'skaya oblast':TUL|Tverskaya oblast':TVE|Tyumenskaya oblast':TYU|Tyva, Respublika [Tuva]:TY|Udmurtskaya Respublika:UD|Ul'yanovskaya oblast':ULY|Vladimirskaya oblast':VLA|Volgogradskaya oblast':VGG|Vologodskaya oblast':VLG|Voronezhskaya oblast':VOR|Yamalo-Nenetskiy avtonomnyy okrug:YAN|Yaroslavskaya oblast':YAR|Yevreyskaya avtonomnaya oblast':YEV|Zabaykal'skiy kray:ZAB";
s_a[190]="City of Kigali:1|Eastern:2|Northern:3|Southern:5|Western:4";
s_a[191]="Ascension:AC|Saint Helena:HL|Tristan da Cunha:TA";
s_a[192]="Christ Church Nichola Town:1|Saint Anne Sandy Point:2|Saint George Basseterre:3|Saint George Gingerland:4|Saint James Windward:5|Saint John Capisterre:6|Saint John Figtree:7|Saint Mary Cayon:8|Saint Paul Capisterre:9|Saint Paul Charlestown:10|Saint Peter Basseterre:11|Saint Thomas Lowland:12|Saint Thomas Middle Island:13|Trinity Palmetto Point:15";
s_a[193]="Anse la Raye:1|Canaries:12|Castries:2|Choiseul:3|Dennery:5|Gros Islet:6|Laborie:7|Micoud:8|Soufrière:10|Vieux Fort:11";
s_a[194]="Miquelon|Saint Pierre";
s_a[195]="Charlotte:01|Grenadines:06|Saint Andrew:02|Saint David:03|Saint George:04|Saint Patrick:05";
s_a[196]="A'ana:AA|Aiga-i-le-Tai:AL|Atua:AT|Fa'asaleleaga:FA|Gaga'emauga:GE|Gagaifomauga:GI|Palauli:PA|Satupa 'itea:SA|Tuamasaga:TU|Va'a-o-Fonoti:VF|Vaisigano:VS";
s_a[197]="Acquaviva:01|Borgo Maggiore:06|Chiesanuova:02|Domagnano:03|Faetano:04|Fiorentino:05|Monte Giardino:08|San Marino:07|Serravalle:09";
s_a[198]="Principe:P|Sao Tome:S";
s_a[199]="Al Bāḩah:11|Al Ḩudūd ash Shamālīyah:8|Al Jawf:12|Al Madīnah al Munawwarah:3|Al Qaşīm:5|Ar Riyāḑ:1|Ash Sharqīyah:4|'Asīr:14|Ḩā'il:6|Jāzān:9|Makkah al Mukarramah:2|Najrān:10|Tabūk:7";
s_a[200]="Aberdeen City|Aberdeenshire|Angus|Argyll and Bute|City of Edinburgh|Clackmannanshire|Dumfries and Galloway|Dundee City|East Ayrshire|East Dunbartonshire|East Lothian|East Renfrewshire|Eilean Siar (Western Isles)|Falkirk|Fife|Glasgow City|Highland|Inverclyde|Midlothian|Moray|North Ayrshire|North Lanarkshire|Orkney Islands|Perth and Kinross|Renfrewshire|Shetland Islands|South Ayrshire|South Lanarkshire|Stirling|The Scottish Borders|West Dunbartonshire|West Lothian";
s_a[201]="Dakar:DK|Diourbel:DB |Fatick:FK|Kaffrine:KA|Kaolack:KL|Kédougou:KE|Kolda:KD|Louga:LG|Matam:MT|Saint-Louis:SL|Sédhiou:SE|Tambacounda:TC|Thiès:TH|Ziguinchor:ZG";
s_a[202]="Anse aux Pins:1|Anse Boileau:2|Anse Etoile:3|Anse Royale:5|Au Cap:4|Baie Lazare:6|Baie Sainte Anne:7|Beau Vallon:8|Bel Air:9|Bel Ombre:10|Cascade:11|English River:16|Glacis:12|Grand Anse Mahe:13|Grand Anse Praslin:14|La Digue:15|Les Mamelles:24|Mont Buxton:17|Mont Fleuri:18|Plaisance:19|Pointe Larue:20|Port Glaud:21|Roche Caiman:25|Saint Louis:22|Takamaka:23";
s_a[203]="Eastern:E|Northern:N|Southern:S|Western:W";
s_a[204]="Central Singapore:1|North East:2|North West:3|South East:4|South West:5";
s_a[205]="Banskobystrický kraj:BC|Bratislavský kraj:BL|Košický kraj:KI|Nitriansky kraj:NI|Prešovský kraj:PV|Trenciansky kraj:TC|Trnavský kraj:TA|Žilinský kraj:ZI";
s_a[206]="Ajdovščina:1|Ankaran:213|Apače:195|Beltinci:2|Benedikt:148|Bistrica ob Sotli:149|Bled:3|Bloke:150|Bohinj:4|Borovnica:5|Bovec:6|Braslovče:151|Brda:7|Brežice:9|Brezovica:8|Cankova:152|Celje:11|Cerklje na Gorenjskem:12|Cerknica:13|Cerkno:14|Cerkvenjak:153|Cirkulane:196|Črenšovci:15|Črna na Koroškem:16|Črnomelj:17|Destrnik:18|Divača:19|Dobje:154|Dobrepolje:20|Dobrna:155|Dobrova–Polhov Gradec:21|Dobrovnik:156|Dol pri Ljubljani:22|Dolenjske Toplice:157|Domžale:23|Dornava:24|Dravograd:25|Duplek:26|Gorenja vas–Poljane:27|Gorišnica:28|Gorje:207|Gornja Radgona:29|Gornji Grad:30|Gornji Petrovci:31|Grad:158|Grosuplje:32|Hajdina:159|Hoče–Slivnica:160|Hodoš:161|Horjul:162|Hrastnik:34|Hrpelje-Kozina:35|Idrija:36|Ig:37|Ilirska Bistrica:38|Ivančna Gorica:39|Izola:40|Jesenice:41|Jezersko:163|Juršinci:42|Kamnik:43|Kanal:44|Kidričevo:45|Kobarid:46|Kobilje:47|Kočevje:48|Komen:49|Komenda:164|Koper:50|Kostanjevica na Krki:197|Kostel:165|Kozje:51|Kranj:52|Kranjska Gora:53|Križevci:166|Krško:54|Kungota:55|Kuzma:56|Laško:57|Lenart:58|Lendava:59|Litija:60|Ljubljana:61|Ljubno:62|Ljutomer:63|Logatec:64|Log-Dragomer:208|Loška Dolina:65|Loški Potok:66|Lovrenc na Pohorju:167|Luče:67|Lukovica:68|Majšperk:69|Makole:198|Maribor:70|Markovci:168|Medvode:71|Mengeš:72|Metlika:73|Mežica:74|Miklavž na Dravskem Polju:169|Miren-Kostanjevica:75|Mirna:212|Mirna Peč:170|Mislinja:76|Mokronog-Trebelno:199|Moravče:77|Moravske Toplice:78|Mozirje:79|Murska Sobota:80|Muta:81|Naklo:82|Nazarje:83|Nova Gorica:84|Novo Mesto:85|Odranci:86|Oplotnica:171|Ormož:87|Osilnica:88|Pesnica:89|Piran:90|Pivka:91|Podčetrtek:92|Podlehnik:172|Podvelka:93|Poljčane:200|Polzela:173|Postojna:94|Prebold:174|Preddvor:95|Prevalje:175|Ptuj:96|Puconci:97|Rače–Fram:98|Radeče:99|Radenci:100|Radlje ob Dravi:101|Radovljica:102|Ravne na Koroškem:103|Razkrižje:176|Rečica ob Savinji:209|Renče-Vogrsko:201|Ribnica:104|Ribnica na Pohorju:177|Rogaška Slatina:106|Rogašovci:105|Rogatec:107|Ruše:108|Šalovci:33|Selnica ob Dravi:178|Semič:109|Šempeter-Vrtojba:183|Šenčur:117|Šentilj:118|Šentjernej:119|Šentjur:120|Šentrupert:211|Sevnica:110|Sežana:111|Škocjan:121|Škofja Loka:122|Škofljica:123|Slovenj Gradec:112|Slovenska Bistrica:113|Slovenske Konjice:114|Šmarje pri Jelšah:124|Šmarješke Toplice:206|Šmartno ob Paki:125|Šmartno pri Litiji:194|Sodražica:179|Solčava:180|Šoštanj:126|Središče ob Dravi:202|Starše:115|Štore:127|Straža:203|Sveta Ana:181|Sveta Trojica v Slovenskih Goricah:204|Sveti Andraž v Slovenskih Goricah:182|Sveti Jurij:116|Sveti Jurij v Slovenskih Goricah:210|Sveti Tomaž:205|Tabor:184|Tišina:10|Tolmin:128|Trbovlje:129|Trebnje:130|Trnovska Vas:185|Tržič:131|Trzin:186|Turnišče:132|Velenje:133|Velika Polana:187|Velike Lašče:134|Veržej:188|Videm:135|Vipava:136|Vitanje:137|Vodice:138|Vojnik:139|Vransko:189|Vrhnika:140|Vuzenica:141|Zagorje ob Savi:142|Žalec:190|Zavrč:143|Železniki:146|Žetale:191|Žiri:147|Žirovnica:192|Zreče:144|Žužemberk:193";
s_a[207]="Capital Territory (Honiara):CT|Central:CE|Choiseul:CH|Guadalcanal:GU|Isabel:IS|Makira-Ulawa:MK|Malaita:ML|Rennell and Bellona:RB|Temotu:TE|Western:WE";
s_a[208]="Awdal:AW|Bakool:BK|Banaadir:BN|Bari:BR|Bay:BY|Galguduud:GA|Gedo:GE |Hiiraan:HI|Jubbada Dhexe:JD|Jubbada Hoose:JH|Mudug:MU|Nugaal:NU|Sanaag:SA|Shabeellaha Dhexe:SD|Shabeellaha Hoose:SH|Sool:SO|Togdheer:TO|Woqooyi Galbeed:WO";
s_a[209]="Eastern Cape:EC|Free State:FS|Gauteng:GT|Kwazulu-Natal:NL|Limpopo:LP|Mpumalanga:MP|Northern Cape:NC|North-West:NW|Western Cape:WC";
s_a[210]="Bird Island|Bristol Island|Clerke Rocks|Montagu Island|Saunders Island|South Georgia|Southern Thule|Traversay Islands";
s_a[211]="A Coruña  [La Coruña]:C|Álava / Araba:VI|Albacete:AB|Alicante / Alacant:A|Almería:AL|Asturias:O|Ávila:AV|Badajoz:BA|Balears  [Baleares]:PM|Barcelona  [Barcelona]:B|Biskaia:BI|Burgos:BU|Cáceres:CC|Cádiz:CA|Cantabria:S|Castellón / Castelló:CS|Ceuta:CE|Ciudad Real:CR|Córdoba:CO|Cuenca:CU|Gipuzkoa:SS|Girona  [Gerona]:GI|Granada:GR|Guadalajara:GU|Huelva:H|Huesca:HU|Jaén:J|La Rioja:LO|Las Palmas:GC|León:LE|Lleida  [Lérida]:L|Lugo  [Lugo]:LU|Madrid:M|Málaga:MA|Melilla:ML|Murcia:MU|Navarra / Nafarroa:NA|Ourense  [Orense]:OR|Palencia:P|Pontevedra  [Pontevedra]:PO|Salamanca:SA|Santa Cruz de Tenerife:TF|Segovia:SG|Sevilla:SE|Soria:SO|Tarragona  [Tarragona]:T|Teruel:TE|Toledo:TO|Valencia / València:V|Valladolid:VA|Zamora:ZA|Zaragoza:Z";
s_a[212]="Spratly Islands";
s_a[213]="Central Province:2|Eastern Province:5|North Central Province:7|North Western Province:6|Northern Province:4|Sabaragamuwa Province:9|Southern Province:3|Uva Province:8|Western Province:1";
s_a[214]="Al Ba?r al A?mar:RS|Al Jazirah:GZ|Al Khartum:KH|Al Qadarif:GD|An Nil al Abya?:NW|An Nil al Azraq:NB|Ash Shamaliyah:NO|Gharb Darfur:DW|Gharb Kurdufan:GK|Janub Darfur:DS|Janub Kurdufan:KS|Kassala:KA|Nahr an Nil:NR|Shamal Darfur:DN|Sharq Darfur:DE|Shiamal Kurdufan:KN|Sinnar:SI|Wasat Darfur Zalinjay:DC";
s_a[215]="Brokopondo:BR|Commewijne:CM|Coronie:CR|Marowijne:MA|Nickerie:NI|Para:PR|Paramaribo:PM|Saramacca:SA|Sipaliwini:SI|Wanica:WA";
s_a[216]="Barentsoya|Bjornoya|Edgeoya|Hopen|Kvitoya|Nordaustandet|Prins Karls Forland|Spitsbergen";
s_a[217]="Hhohho:HH|Lubombo:LU|Manzini:MA|Shiselweni:SH";
s_a[218]="Blekinge län:K|Dalarnes län:W|Gävleborgs län:X|Gotlands län:I|Hallands län:N|Jämtlands län:Z|Jönköpings län:F|Kalmar län:H|Kronoborgs län:G|Norrbottens län:BD|Örebro län:T|Östergötlands län:E|Skåne län:M|Södermanlands län:D|Stockholms län:AB|Uppsala län:C|Värmlands län:S|Västerbottens län:AC|Västernorrlands län:Y|Västmanlands län:U|Västra Götalands län:O";
s_a[219]="Aargau (de):AG|Appenzell Ausserrhoden (de):AR|Appenzell Innerrhoden (de):AI|Basel-Landschaft (de):BL|Basel-Stadt (de):BS|Bern (de):BE|Fribourg (fr):FR|Genève (fr):GE|Glarus (de):GL|Graubünden (de):GR|Jura (fr):JU|Luzern (de):LU|Neuchâtel (fr):NE|Nidwalden (de):NW|Obwalden (de):OW|Sankt Gallen (de):SG|Schaffhausen (de):SH|Schwyz (de):SZ|Solothurn (de):SO|Thurgau (de):TG|Ticino (it):TI|Uri (de):UR|Valais (fr):VS|Vaud (fr):VD|Zug (de):ZG|Zürich (de):ZH";
s_a[220]="AI Hasakah:HA|AI Ladhiqiyah:LA|AI Qunaytirah:QU|Ar Raqqah:RA|As Suwayda':SU|Dar'a:DR|Dayr az Zawr:DY|Dimashq:DI|Halab:HL|Hamah:HM|Hims:HI|Idlib:ID|Rif Dimashq:RD|Tartus:TA";
s_a[221]="Changhua:CHA|Chiayi:CYI|Chiayi:CYQ|Hsinchu:HSQ|Hsinchu:HSZ|Hualien:HUA|Kaohsiung:KHH|Keelung:KEE|Kinmen:KIN|Lienchiang:LIE|Miaoli:MIA|Nantou:NAN|New Taipei:NWT|Penghu:PEN|Pingtung:PIF|Taichung:TXG|Tainan:TNN|Taipei:TPE|Taitung:TTT|Taoyuan:TAO|Yilan:ILA|Yunlin:YUN";
s_a[222]="Dushanbe:DU|Khatlon:KT|Kuhistoni Badakhshon:GB|Nohiyahoi Tobei Jumhurí:RA|Sughd:SU";
s_a[223]="Arusha:1|Coast:19|Dar es Salaam:2|Dodoma:3|Geita:27|Iringa:4|Kagera:5|Katavi:28|Kigoma:8|Kilimanjaro:9|Lindi:12|Manyara:26|Mara:13|Mbeya:14|Morogoro:16|Mtwara:17|Mwanza:18|Njombe:29|Pemba North:6|Pemba South:10|Rukwa:20|Ruvuma:21|Shinyanga:22|Simiyu:30|Singida:23|Tabora:24|Tanga:25|Zanzibar North:7|Zanzibar South:11|Zanzibar West:15";
s_a[224]="Amnat Charoen:37|Ang Thong:15|Bueng Kan:38|Buriram:31|Chachoengsao:24|Chai Nat:18|Chaiyaphum:36|Chanthaburi:22|Chiang Mai:50|Chiang Rai:57|Chon Buri:20|Chumphon:86|Kalasin:46|Kamphaeng Phet:62|Kanchanaburi:71|Khon Kaen:40|Krabi:81|Krung Thep Maha Nakhon [Bangkok]:10|Lampang:52|Lamphun:51|Loei:42|Lopburi:16|Mae Hong Son:58|Maha Sarakham:44|Mukdahan:49|Nakhon Nayok:26|Nakhon Pathom:73|Nakhon Phanom:48|Nakhon Ratchasima:30|Nakhon Sawan:60|Nakhon Si Thammarat:80|Nan:55|Narathiwat:96|Nong Bua Lam Phu:39|Nong Khai:43|Nonthaburi:12|Pathum Thani:13|Pattani:94|Pattaya:S|Phangnga:82|Phatthalung:93|Phayao:56|Phetchabun:67|Phetchaburi:76|Phichit:66|Phitsanulok:65|Phra Nakhon Si Ayutthaya:14|Phrae:54|Phuket:83|Prachin Buri:25|Prachuap Khiri Khan:77|Ranong:85|Ratchaburi:70|Rayong:21|Roi Et:45|Sa Kaeo:27|Sakon Nakhon:47|Samut Prakan:11|Samut Sakhon:74|Samut Songkhram:75|Saraburi:19|Satun:91|Sing Buri:17|Sisaket:33|Songkhla:90|Sukhothai:64|Suphan Buri:72|Surat Thani:84|Surin:32|Tak:63|Trang:92|Trat:23|Ubon Ratchathani:34|Udon Thani:41|Uthai Thani:61|Uttaradit:53|Yala:95|Yasothon:35";
s_a[225]="Tobago";
s_a[226]="De La Kara:K|Des Plateaux:P|Des Savanes:S|Du Centre:C|Maritime:M";
s_a[227]="Atafu|Fakaofo|Nukunonu";
s_a[228]="'Eua:01|Ha'apai:02|Niuas:03|Tongatapu:04|Vava'u:05";
s_a[229]="Arima:ARI|Chaguanas:CHA|Couva-Tabaquite-Talparo:CTT|Diego Martin:DMN|Mayaro-Rio Claro:MRC|Penal-Debe:PED|Port of Spain:POS|Princes Town:PRT|Point Fortin:PTF|San Fernando:SFO|Sangre Grande:SGE|Siparia:SIP|San Juan-Laventille:SJL|Tobago:TOB|Tunapuna-Piarco:TUP";
s_a[230]="Béja:31|Ben Arous:13|Bizerte:23|Gabès:81|Gafsa:71|Jendouba:32|Kairouan:41|Kasserine:42|Kébili:73|La Manouba:14|L'Ariana:12|Le Kef:33|Mahdia:53|Médenine:82|Monastir:52|Nabeul:21|Sfax:61|Sidi Bouzid:43|Siliana:34|Sousse:51|Tataouine:83|Tozeur:72|Tunis:11|Zaghouan:22";
s_a[231]="Adana:1|Adıyaman:2|Afyonkarahisar:3|Ağrı:4|Aksaray:68|Amasya:5|Ankara:6|Antalya:7|Ardahan:75|Artvin:8|Aydın:9|Balıkesir:10|Bartın:74|Batman:72|Bayburt:69|Bilecik:11|Bingöl:12|Bitlis:13|Bolu:14|Burdur:15|Bursa:16|Çanakkale:17|Çankırı:18|Çorum:19|Denizli:20|Diyarbakır:21|Düzce:81|Edirne:22|Elazığ:23|Erzincan:24|Erzurum:25|Eskişehir:26|Gaziantep:27|Giresun:28|Gümüşhane:29|Hakkâri:30|Hatay:31|Iğdır:76|Isparta:32|İstanbul:34|İzmir:35|Kahramanmaraş:46|Karabük:78|Karaman:70|Kars:36|Kastamonu:37|Kayseri:38|Kilis:79|Kırıkkale:71|Kırklareli:39|Kırşehir:40|Kocaeli:41|Konya:42|Kütahya:43|Malatya:44|Manisa:45|Mardin:47|Mersin:33|Muğla:48|Muş:49|Nevşehir:50|Niğde:51|Ordu:52|Osmaniye:80|Rize:53|Sakarya:54|Samsun:55|Şanlıurfa:63|Siirt:56|Sinop:57|Şırnak:73|Sivas:58|Tekirdağ:59|Tokat:60|Trabzon:61|Tunceli:62|Uşak:64|Van:65|Yalova:77|Yozgat:66|Zonguldak:67";
s_a[232]="Ahal:A|Asgabat:S|Balkan:B|Dasoguz:D|Lebap:L|Mary:M";
s_a[233]="Funafuti:FUN|Niutao:NIT|Nui:NIU|Nukufetau:NKF|Nukulaelae:NKL|Nanumea:NMA|Nanumaga:NMG|Vaitupu:VAI";
s_a[234]="Abim:314|Adjumani:301|Agago:322|Alebtong:323|Amolatar:315|Amudat:324|Amuria:216|Amuru:316|Apac:302|Arua:303|Budaka:217|Bududa:218|Bugiri:201|Buhweju:420|Buikwe:117|Bukedea:219|Bukomansimbi:118|Bukwa:220|Bulambuli:225|Buliisa:416|Bundibugyo:401|Bushenyi:402|Busia:202|Butaleja:221|Butambala:119|Buvuma:120|Buyende:226|Dokolo:317|Gomba:121|Gulu:304|Hoima:403|Ibanda:417|Iganga:203|Isingiro:418|Jinja:204|Kaabong:318|Kabale:404|Kabarole:405|Kaberamaido:213|Kalangala:101|Kaliro:222|Kalungu:122|Kampala:102|Kamuli:205|Kamwenge:413|Kanungu:414|Kapchorwa:206|Kasese:406|Katakwi:207|Kayunga:112|Kibaale:407|Kiboga:103|Kibuku:227|Kiruhura:419|Kiryandongo:421|Kisoro:408|Kitgum:305|Koboko:319|Kole:325|Kotido:306|Kumi:208|Kween:228|Kyankwanzi:123|Kyegegwa:422|Kyenjojo:415|Lamwo:326|Lira:307|Luuka:229|Luwero:104|Lwengo:124|Lyantonde:114|Manafwa:223|Maracha:320|Masaka:105|Masindi:409|Mayuge:214|Mbale:209|Mbarara:410|Mitooma:423|Mityana:115|Moroto:308|Moyo:309|Mpigi:106|Mubende:107|Mukono:108|Nakapiripirit:311|Nakaseke:116|Nakasongola:109|Namayingo:230|Namutumba:224|Napak:327|Nebbi:310|Ngora:231|Ntoroko:424|Ntungamo:411|Nwoya:328|Otuke:329|Oyam:321|Pader:312|Pallisa:210|Rakai:110|Rubirizi:425|Rukungiri:412|Sembabule:111|Serere:232|Sheema:426|Sironko:215|Soroti:211|Tororo:212|Wakiso:113|Yumbe:313|Zombo:330";
s_a[235]="Avtonomna Respublika Krym:43|Cherkaska oblast:71|Chernihivska oblast:74|Chernivetska oblast:77|Dnipropetrovska oblast:12|Donetska oblast:14|Ivano-Frankivska oblast:26|Kharkivska oblast:63|Khersonska oblast:65|Khmelnytska oblast:68|Kirovohradska oblast:35|Kyiv:30|Kyivska oblast:32|Luhanska oblast:9|Lvivska oblast:46|Mykolaivska oblast:48|Odeska oblast:51|Poltavska oblast:53|Rivnenska oblast:56|Sevastopol:40|Sumska oblast:59|Ternopilska oblast:61|Vinnytska oblast:5|Volynska oblast:7|Zakarpatska oblast:21|Zaporizka oblast:23|Zhytomyrska oblast:18"
s_a[236]="Ajman:AJ|Abu Z¸aby [Abu Dhabi]:AZ|Dubayy [Dubai]:DU|Al Fujayrah:FU|Ra’s al Khaymah:RK|Ash Shariqah [Sharjah]:SH|Umm al Qaywayn:UQ";
s_a[237]="Aberdeen City:ABE|Aberdeenshire:ABD|Angus:ANS|Antrim and Newtownabbey:ANN|Ards and North Down:AND|Argyll and Bute:AGB|Armagh:ARM|Armagh, Banbridge and Craigavon:ABC|Barking and Dagenham:BDG|Barnet:BNE|Barnsley:BNS|Bath and North East Somerset:BAS|Bedford:BDF|Belfast:BFS|Bexley:BEX|Birmingham:BIR|Blackburn with Darwen:BBD|Blackpool:BPL|Blaenau Gwent:BGW|Bolton:BOL|Bournemouth:BMH|Bracknell Forest:BRC|Bradford:BRD|Brent:BEN|Bridgend [Pen-y-bont ar Ogwr GB-POG]:BGE|Brighton and Hove:BNH|Bristol, City of:BST|Bromley:BRY|Buckinghamshire:BKM|Bury:BUR|Caerphilly [Caerffili GB-CAF]:CAY|Calderdale:CLD|Cambridgeshire:CAM|Camden:CMD|Cardiff [Caerdydd GB-CRD]:CRF|Carmarthenshire [Sir Gaerfyrddin GB-GFY]:CMN|Causeway Coast and Glens:CCG|Central Bedfordshire:CBF|Ceredigion [Sir Ceredigion]:CGN|Cheshire East:CHE|Cheshire West and Chester:CHW|Clackmannanshire:CLK|Conwy:CWY|Cornwall:CON|Coventry:COV|Croydon:CRY|Cumbria:CMA|Darlington:DAL|Denbighshire [Sir Ddinbych GB-DDB]:DEN|Derby:DER|Derbyshire:DBY|Derry and Strabane:DRS|Devon:DEV|Doncaster:DNC|Dorset:DOR|Dudley:DUD|Dumfries and Galloway:DGY|Dundee City:DND|Durham:DUR|Ealing:EAL|East Ayrshire:EAY|East Dunbartonshire:EDU|East Lothian:ELN|East Renfrewshire:ERW|East Riding of Yorkshire:ERY|East Sussex:ESX|Edinburgh, City of:EDH|Eilean Siar:ELS|Enfield:ENF|Essex:ESS|Falkirk:FAL|Fermanagh and Omagh:FMO|Fife:FIF|Flintshire [Sir y Fflint GB-FFL]:FLN|Gateshead:GAT|Glasgow City:GLG|Gloucestershire:GLS|Greenwich:GRE|Gwynedd:GWN|Hackney:HCK|Halton:HAL|Hammersmith and Fulham:HMF|Hampshire:HAM|Haringey:HRY|Harrow:HRW|Hartlepool:HPL|Havering:HAV|Herefordshire:HEF|Hertfordshire:HRT|Highland:HLD|Hillingdon:HIL|Hounslow:HNS|Inverclyde:IVC|Isle of Anglesey [Sir Ynys Môn GB-YNM]:AGY|Isle of Wight:IOW|Isles of Scilly:IOS|Islington:ISL|Kensington and Chelsea:KEC|Kent:KEN|Kingston upon Hull:KHL|Kingston upon Thames:KTT|Kirklees:KIR|Knowsley:KWL|Lambeth:LBH|Lancashire:LAN|Leeds:LDS|Leicester:LCE|Leicestershire:LEC|Lewisham:LEW|Lincolnshire:LIN|Lisburn and Castlereagh:LBC|Liverpool:LIV|London, City of:LND|Luton:LUT|Manchester:MAN|Medway:MDW|Merthyr Tydfil [Merthyr Tudful GB-MTU]:MTY|Merton:MRT|Mid and East Antrim:MEA|Mid Ulster:MUL|Middlesbrough:MDB|Midlothian:MLN|Milton Keynes:MIK|Monmouthshire [Sir Fynwy GB-FYN]:MON|Moray:MRY|Neath Port Talbot [Castell-nedd Port Talbot GB-CTL]:NTL|Newcastle upon Tyne:NET|Newham:NWM|Newport [Casnewydd GB-CNW]:NWP|Newry, Mourne and Down:NMD|Norfolk:NFK|North Ayrshire:NAY|North East Lincolnshire:NEL|North Lanarkshire:NLK|North Lincolnshire:NLN|North Somerset:NSM|North Tyneside:NTY|North Yorkshire:NYK|Northamptonshire:NTH|Northumberland:NBL|Nottingham:NGM|Nottinghamshire:NTT|Oldham:OLD|Orkney Islands:ORK|Oxfordshire:OXF|Pembrokeshire [Sir Benfro GB-BNF]:PEM|Perth and Kinross:PKN|Peterborough:PTE|Plymouth:PLY|Poole:POL|Portsmouth:POR|Powys:POW|Reading:RDG|Redbridge:RDB|Redcar and Cleveland:RCC|Renfrewshire:RFW|Rhondda, Cynon, Taff [Rhondda, Cynon,Taf]:RCT|Richmond upon Thames:RIC|Rochdale:RCH|Rotherham:ROT|Rutland:RUT|Salford:SLF|Sandwell:SAW|Scottish Borders, The:SCB|Sefton:SFT|Sheffield:SHF|Shetland Islands:ZET|Shropshire:SHR|Slough:SLG|Solihull:SOL|Somerset:SOM|South Ayrshire:SAY|South Gloucestershire:SGC|South Lanarkshire:SLK|South Tyneside:STY|Southampton:STH|Southend-on-Sea:SOS|Southwark:SWK|St. Helens:SHN|Staffordshire:STS|Stirling:STG|Stockport:SKP|Stockton-on-Tees:STT|Stoke-on-Trent:STE|Suffolk:SFK|Sunderland:SND|Surrey:SRY|Sutton:STN|Swansea [Abertawe GB-ATA]:SWA|Swindon:SWD|Tameside:TAM|Telford and Wrekin:TFW|Thurrock:THR|Torbay:TOB|Torfaen [Tor-faen]:TOF|Tower Hamlets:TWH|Trafford:TRF|Vale of Glamorgan, The [Bro Morgannwg GB-BMG]:VGL|Wakefield:WKF|Walsall:WLL|Waltham Forest:WFT|Wandsworth:WND|Warrington:WRT|Warwickshire:WAR|West Berkshire:WBK|West Dunbartonshire:WDU|West Lothian:WLN|West Sussex:WSX|Westminster:WSM|Wigan:WGN|Wiltshire:WIL|Windsor and Maidenhead:WNM|Wirral:WRL|Wokingham:WOK|Wolverhampton:WLV|Worcestershire:WOR|Wrexham [Wrecsam GB-WRC]:WRX|York:YOR";
s_a[238]="Artigas:AR|Canelones:CA|Cerro Largo:CL|Colonia:CO|Durazno:DU|Florida:FD|Flores:FS|Lavalleja:LA|Maldonado:MA|Montevideo:MO|Paysandú:PA|Río Negro:RN|Rocha:RO|Rivera:RV|Salto:SA|San José:SJ|Soriano:SO|Tacuarembó:TA|Treinta y Tres:TT";
s_a[239]="Alabama:AL|Alaska:AK|American Samoa (see also separate entry under AS):AS|Arizona:AZ|Arkansas:AR|California:CA|Colorado:CO|Connecticut:CT|Delaware:DE|District of Columbia:DC|Florida:FL|Georgia:GA|Guam (see also separate entry under GU):GU|Hawaii:HI|Idaho:ID|Illinois:IL|Indiana:IN|Iowa:IA|Kansas:KS|Kentucky:KY|Louisiana:LA|Maine:ME|Maryland:MD|Massachusetts:MA|Michigan:MI|Minnesota:MN|Mississippi:MS|Missouri:MO|Montana:MT|Nebraska:NE|Nevada:NV|New Hampshire:NH|New Jersey:NJ|New Mexico:NM|New York:NY|North Carolina:NC|North Dakota:ND|Northern Mariana Islands (see also separate entry MP):MP|Ohio:OH|Oklahoma:OK|Oregon:OR|Pennsylvania:PA|Puerto Rico (see also separate entry under PR):PR|Rhode Island:RI|South Carolina:SC|South Dakota:SD|Tennessee:TN|Texas:TX|U.S. Minor Outlying Islands (cf. separate entry UM):UM|Utah:UT|Vermont:VT|Virgin Islands of the U.S. (see also separate entry VI):VI|Virginia:VA|Washington:WA|West Virginia:WV|Wisconsin:WI|Wyoming:WY";
s_a[240]="Andijon:AN|Bukhoro:BU|Farg‘ona:FA|Jizzax:JI|Khorazm:KH|Namangan:NG|Nawoiy:NW|Qashqadaryo:QA|Qoraqalpog‘iston Respublikasi:QR|Samarqand:SA|Sirdaryo:SI|Surkhondaryo:SU|Toshkent:TK|Toshkent:TO|Xorazm:XO";
s_a[241]="Malampa:MAP|Pénama:PAM|Sanma:SAM|Shéfa:SEE|Taféa:TAE|Torba:TOB";
s_a[242]="Amazonas:Z|Anzoátegui:B|Apure:C|Aragua:D|Barinas:E|Bolívar:F|Carabobo:G|Cojedes:H|Delta Amacuro:Y|Dependencias Federales:W|Distrito Capital:A|Falcón:I|Guárico:J|Lara:K|Mérida:L|Miranda:M|Monagas:N|Nueva Esparta:O|Portuguesa:P|Sucre:R|Táchira:S|Trujillo:T|vargas:X|Yaracuy:U|Zulia:V";
s_a[243]="An Giang:44|Bà Rịa–Vũng Tàu:43|Bắc Giang:54|Bắc Kạn:53|Bạc Liêu:55|Bắc Ninh:56|Bến Tre:50|Bình Định:31|Bình Dương:57|Bình Phước:58|Bình Thuận:40|Cà Mau:59|Cao Bằng:4|Đắk Lắk:33|Đắk Nông:72|Điện Biên:71|Đồng Nai:39|Đồng Tháp:45|Gia Lai:30|Hà Giang:3|Hà Nam:63|Hà Tĩnh:23|Hải Dương:61|Hậu Giang:73|Hòa Bình:14|Hưng Yên:66|Khánh Hòa:34|Kiên Giang:47|Kon Tum:28|Lai Châu:1|Lâm Đồng:35|Lạng Sơn:9|Lào Cai:2|Long An:41|Nam Định:67|Nghệ An:22|Ninh Bình:18|Ninh Thuận:36|Phú Thọ:68|Phú Yên:32|Quảng Bình:24|Quảng Nam:27|Quảng Ngãi:29|Quảng Ninh:13|Quảng Trị:25|Sóc Trăng:52|Sơn La:5|Tây Ninh:37|Thái Bình:20|Thái Nguyên:69|Thanh Hóa:21|Thừa Thiên–Huế:26|Tiền Giang:46|Trà Vinh:51|Tuyên Quang:7|Vĩnh Long:49|Vĩnh Phúc:70|Yên Bái:6";
s_a[244]="Saint Croix|Saint John|Saint Thomas";
s_a[245]="Blaenau Gwent|Bridgend|Caerphilly|Cardiff|Carmarthenshire|Ceredigion|Conwy|Denbighshire|Flintshire|Gwynedd|Isle of Anglesey|Merthyr Tydfil|Monmouthshire|Neath Port Talbot|Newport|Pembrokeshire|Powys|Rhondda Cynon Taff|Swansea|The Vale of Glamorgan|Torfaen|Wrexham";
s_a[246]="Alo:AL|Sigave:SG|Uvea:UV";
s_a[247]="West Bank";
s_a[248]="Western Sahara";
s_a[249]="A? ?ali‘:DA|?a?ramawt:HD|?ajjah:HJ|‘Adan:AD|‘Amran:AM|Abyan:AB|Al ?udaydah:HU|Al Bay?a’:BA|Al Jawf:JA|Al Ma?wit:MW|Al Mahrah:MR|Amanat al ‘Asimah [city]:SA|Arkhabil Suqutrá:SU|Dhamar:DH|Ibb:IB|Lahij:LA|Ma’rib:MA|Raymah:RA|Sa'dah:SD|San?a':SN|Shabwah:SH|Ta'izz:TA";
s_a[250]="Kosovo|Montenegro|Serbia|Vojvodina";
s_a[251]="Central:2|Copperbelt:8|Eastern:3|Luapula:4|Lusaka:9|Muchinga:10|Northern:5|North-Western:6|Southern:7|Western:1";
s_a[252]="Bulawayo:BU|Harare:HA|Manicaland:MA|Mashonaland Central:MC|Mashonaland East:ME|Mashonaland West:MW|Masvingo:MV|Matabeleland North:MN|Matabeleland South:MS|Midlands:MI";

function loadBundles() {
	
	  $.ajax({
			type: "GET",
			async:false,
			url: "getLanguage",
			success: function(response){
			    var scriptContent = $($.parseHTML(response, document, true)).filter('script').text();
			    $.globalEval(scriptContent);
			},
			error: function(e){
			}
		});	
	}

function populateStates( countryElementId, stateElementId ){
	loadBundles();
	var selectedCountryIndex = document.getElementById( countryElementId ).selectedIndex;
	//GPD-64
	var selectedCountryOptions = document.getElementById( countryElementId ).options;
	var selectedCountryValue = selectedCountryOptions[selectedCountryIndex].value;
	zipCodeAsRequiredField(selectedCountryValue,countryElementId);
	var stateElement = document.getElementById( stateElementId );
	
	stateElement.length=0;	// Fixed by Julian Woods
	stateElement.options[0] = new Option(strings['label.select.state'],'');
	stateElement.selectedIndex = 0;
	
	var state_arr = s_a[selectedCountryIndex].split("|");
	
	for (var i=0; i<state_arr.length; i++) {
		var state_code_arr = state_arr[i].split(":");
		//console.log("state_code_arr 0 : "+ state_code_arr[0]);
		//console.log("state_code_arr 1 : "+ state_code_arr[1]);
		stateElement.options[stateElement.length] = new Option(state_code_arr[0],state_code_arr[1]);
	}
}

function populateCountries(countryElementId, stateElementId){
	loadBundles();
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var countryElement = document.getElementById(countryElementId);
	countryElement.length=0;
	countryElement.options[0] = new Option(strings['label.select.country'],'-1');
	countryElement.selectedIndex = 0;
	for (var i=0; i<country_arr.length; i++) {
		var country_code_arr = country_arr[i].split(":");
		//console.log("country_code_arr 0 : "+ country_code_arr[0]);
		//console.log("country_code_arr 1 : "+ country_code_arr[1]);
		countryElement.options[countryElement.length] = new Option(country_code_arr[0],country_code_arr[1]);
	}

	// Assigned all countries. Now assign event listener for the states.

	if( stateElementId ){
		countryElement.onchange = function(){
			populateStates( countryElementId, stateElementId );
		};
	}
}
function zipCodeAsRequiredField(selectedCountryValue,countryElementId){
	
	var zipcodeValidationCountries = "US,CA";//"${properties['zipcode.validation.countries']}";//GPD-64
	var zipcodeRequired = (zipcodeValidationCountries.indexOf(selectedCountryValue)>-1)?true:false;
	if(selectedCountryValue != undefined && zipcodeRequired==true && countryElementId == "shipToAddressCountry"){
		$('#shipToAddressZipCodeAsterisk').addClass('asterisk_input_required');
	}else if(selectedCountryValue != undefined && zipcodeRequired!=true && countryElementId == "shipToAddressCountry"){
		$('#shipToAddressZipCodeAsterisk').removeClass('asterisk_input_required');
	}
	else if(selectedCountryValue != undefined && zipcodeRequired==true && countryElementId == "billToAddressCountry"){
		$('#billToAddressZipCodeAsterisk').addClass('asterisk_input_required');		
	}else if(selectedCountryValue != undefined && zipcodeRequired!=true && countryElementId == "billToAddressCountry"){
		$('#billToAddressZipCodeAsterisk').removeClass('asterisk_input_required');		
	}
}

//While editing quote/order after review (override ship to) reset is not working
function getDetails(isFromBillTo,shipTo){
    var customerId = $('#customerVal').val();

    $.ajax({  
        type : "GET",
        data : {customerId: customerId,shipTo: shipTo,isFromBillTo: isFromBillTo },
        url : "getcontactlistforshipto",
        success : function(response) {
		 var responseJson = JSON.parse(response);		
		 $('#shipToDetails').html();
         $('#shipToDetails').html(setAddress(responseJson.addressJson)); 
        },  
        error : function(e) {     
        }  
    });
   }
//GPD-51: Venkatasiva
$(function(){
	
	//For User
	 $('#shipToAddressCountry').on('change',function(){
		  if($('#shipToAddressCountry').find("option:selected" ).index()!=0){
			  //var shipToAddressCountry = $('#shipToAddressCountry').find("option:selected" ).text();
			  //To get the option value i.e., country code
			  var shipToAddressCountry = $('#shipToAddressCountry').val();
			  console.log("shipToAddressCountry: " + shipToAddressCountry);				  
			  $("#shipToAddressCountry").val(shipToAddressCountry); 
			  $("#shipToAddressState").val('');
			  //$('#shipToAddressCountry').val(shipToAddressCountry).attr('readonly','readonly');
		  }else{
			  $('#shipToAddressCountry').val('-1');	
			  $("#shipToAddressState").val('');
		  }
	}); 
	
	$('#stateSelect').on('change',function(){
		  if($('#stateSelect').find("option:selected" ).index()!=0){				  
			 // var stateSelected = $('#stateSelect').find("option:selected").text();
			 //To get the option value i.e., state code
			  var stateSelected = $('#stateSelect').val();		
			  console.log("stateSelect: " + stateSelected);							  
			  $("#shipToAddressState").val(stateSelected); 				 			  
			  //$('#shipToAddressCountry').val(shipToAddressCountry).attr('readonly','readonly');
		  }else{
			  $("#shipToAddressState").val('');
		  }
	});
	
	$('#billToAddressCountry').on('change',function(){
		  if($('#billToAddressCountry').find("option:selected" ).index()!=0){
			  //To get the option value i.e., country code
			  var billToAddressCountry = $('#billToAddressCountry').val();
			  console.log("billToAddressCountry: " + billToAddressCountry);				  
			  $("#billToAddressCountry").val(billToAddressCountry); 				  
			  
		  }else{
			  $('#billToAddressCountry').val('-1');				  
		  }
	}); 
	
	$('#billToStateSelect').on('change',function(){
		  if($('#billToStateSelect').find("option:selected" ).index()!=0){				  
			 // var stateSelected = $('#stateSelect').find("option:selected").text();
			 //To get the option value i.e., state code
			  var billToStateSelect = $('#billToStateSelect').val();		
			  console.log("billToStateSelect: " + billToStateSelect);							  
			  $("#billToAddressState").val(billToStateSelect); 				 			  
		  }else{
			  $("#billToAddressState").val('');
		  }
	});
	//User End
	//Guest User 
	$('#shipToStateSelect').on('change',function(){
		 //var stateSelected = $('#shipToStateSelect').find("option:selected" ).text();
		 //To get the option value i.e., state code
		 var stateSelected = $('#shipToStateSelect').val();
		  $("#shipToAddressState").val(stateSelected);			  
	});
	//Guest User End
	 $("#ship-to-add").click(function(){
 		//GPD-51: Venkatasiva           
 		//----Missed during Merge activity,for	GSP-966 added by krupa
  		//NREV-1090 ADDED BY ANIKET REVIEWED BY KRUPA
  		 $('#shiptoSelect').css({"visibility":"hidden"});
  		 $('#contact-id').css({"visibility":"hidden"});         		
  		 //NREV-1090 END
  		 //---end of Missed during Merge activity, for GSP-966
  		 //GPD-51: Venkatasiva
  		 $('#shiptoSelect').css({"display":"none"});
  		 //GPD-51: End
 		 flag=true;
 		 $(this).siblings('.shipToEdit').hide();
 		 $(this).hide().siblings("#ship-to-cancel").show();
 		 //GPD-51: Venkatasiva
 		 $('#ship-to-cancel').show();
 		 //GPD-51: End
 		 $('.ship-to-address').children('div.column-paddings.address-holder').hide();
 	      $('.ship-to-address').children("div.nopadding.address-holder").show();
 	      $('div>select#shiptoSelect, select.contact-details ').prop('disabled', true);
 	       $('a.contact-to-add').attr("disabled", true).addClass('not-active');
            $('a.contact-to-cancel').attr("disabled", true).addClass('not-active');
 	      // $('.contactName').children('#contact-name').hide();
     		// $('.contactName').children(".contactName>.form-control").show();
    	      	//$('.contactEmail').children('#contact-email').hide();
     		 //$('.contactEmail').children(".contactEmail>.form-control").show();
 	      $('#shipToNewAddExist').val("true");
			  $('#newConatcExist').val("true");
			  
			// reset all input fields of ship to and contact
			  $('#ship-to-add-div').find('input:text').val('');
			  //$('#contactNameInput').val('');
			  //$('#contactEmailInput').val('');

 	    });
 	 $("#ship-to-cancel").click(function(){
 		 //----Missed during Merge activity,for	GSP-966 added by krupa
  		//NREV-1090 ADDED BY ANIKET REVIEWED BY KRUPA
  		 $('#shiptoSelect').css({"visibility":"visible"});
  		 $('#contact-id').css({"visibility":"visible"});         		
  		 //NREV-1090 END
  		 //----End of Missed during Merge activity,for	GSP-966 added by krupa
  		  //GPD-51: Venkatasiva
  		 $('#shiptoSelect').css({"display":"inline"});
  		 //$(this).siblings('.shipToEdit').show();
 		 //$(this).hide().siblings("#ship-to-add").show();
 		 $('.shipToEdit').show();
 		 $("#ship-to-add").show();
 		 $('#shipToAddressCountry').val('-1');
 		// $("#stateSelect").val(''); 
 		populateStates( "shipToAddressCountry", "stateSelect" );
 		//GPD-51: End 		
 		var shipTo = $('#shiptoSelect').val();
        getDetails(false,shipTo);
 		 $('.ship-to-address').children('div.column-paddings.address-holder').show();
 	      $('.ship-to-address').children("div.nopadding.address-holder").hide();
 	      $('div>select#shiptoSelect, select.contact-details').prop('disabled', false);
 	      $('.contactName').children('#contact-name').show();
  		 $('.contactName').children(".contactName>.form-control").show();
 	      	$('.contactEmail').children('#contact-email').show();
  		 $('.contactEmail').children(".contactEmail>.form-control").show();
			  $('#shipToNewAddExist').val("false");
			  $('#newConatcExist').val("false");
           $('a.contact-to-add').attr("disabled", false).removeClass('not-active');
           $('a.contact-to-cancel').attr("disabled", false).removeClass('not-active');
             if($('a.contact-to-cancel').is(':visible')){
                 $('a.contact-to-cancel').hide();
                 $('a.contact-to-add').show();
             }
 	    });
 	
	
});
//GPD-51: Venkatasiva End

