﻿
function provicne(region) {
    var state_arr = s_a[region].split("|");
    $('#statey').empty();
    $.each(state_arr, function (i, item_state) {
        $('#statey').append($('<option>', {
            value: item_state,
            text: item_state,
        }, '</option>'));
    });
}

function cityni(province)
{
    var city_arr = c_a[province].split("|");
    $('#cityy').empty();
    $.each(city_arr, function (j, item_city) {
        $('#cityy').append($('<option>', {
            value: item_city,
            text: item_city,
        }, '</option>'));
    });
}



var country_arr = new Array("ARMM", "CAR", "CARAGA", "NCR", "REGION I", "REGION II", "REGION III", "REGION IV-A", "REGION IV-B", "REGION IX", "REGION V", "REGION VI", "REGION VII", "REGION VIII", "REGION X", "REGION XI", "REGION XII", "SPECIAL PROVINCES");

// Province
var s_a = new Array();
s_a[0] = "Province";
s_a[1] = "Province|BASILAN|LANAO DEL SUR|MAGUIDANAO|TAWI-TAWI|BASILAN|LANAO DEL SUR|MAGUINDANAO|SULO";
s_a[2] = "Province|ABRA|APAYAO|BENGUET|IFUGAO|KALINGA|MOUNTAIN PROVINCE";
s_a[3] = "Province|AGUSAN DEL NORTE|AGUSAN DEL SUR|DINAGAT ISLANDS|SURIGAO DEL NORTE|SURIGAO DEL SUR";
s_a[4] = "Province|NCR - FOURTH DISTRICT|NCR - MANILA|NCR - SECOND DISTRICT|NCR - THIRD DISTRICT";
s_a[5] = "Province|ILOCOS NORTE|ILOCOS SUR|LA UNION|PANGASINAN";
s_a[6] = "Province|BATANES|CAGAYAN|ISABELA|NUEVA VIZCAYA|QUIRINO";
s_a[7] = "Province|AURORA|BATAAN|BULACAN|NUEVA ECIJA|PAMPANGA|TARLAC|ZAMBALES";
s_a[8] = "Province|BATANGAS|CAVITE|LAGUNA|QUEZON|RIZAL";
s_a[9] = "Province|MARINDUQUE|OCCIDENTAL MINDORO|ORIENTAL MINDORO|PALAWAN|ROMBLON";
s_a[10] = "Province|ZAMBOANGA DEL NORTE|ZAMBOANGA DEL SUR|ZAMBOANGA SIBUGAY";
s_a[11] = "Province|ALBAY|CAMARINES NORTE|CAMARINES SUR|CATANDUANES|MASBATE|SORSOGON";
s_a[12] = "Province|AKLAN|ANTIQUE|CAPIZ|GUIMARAS|ILOILO|NEGROS OCCIDENTAL";
s_a[13] = "Province|BOHOL|CEBU|NEGROS ORIENTAL|SIQUIJOR";
s_a[14] = "Province|BILIRAN|EASTERN SAMAR|LEYTE|NORTHERN SAMAR|SAMAR (WESTERN SAMAR)|SOUTHERN LEYTE";
s_a[15] = "Province|BUKIDNON|CAMIGUIN|LANAO DEL NORTE|MISAMIS OCCIDENTAL|MISAMIS ORIENTAL";
s_a[16] = "Province|COMPOSTELA VALLEY|DAVAO (DAVAO DEL NORTE)|DAVAO DEL SUR|DAVAO OCCIDENTAL|DAVAO ORIENTAL";
s_a[17] = "Province|COTABATO (NORTH COT.)|SARANGANI|SOUTH COTABATO|SULTAN KUDARAT";
s_a[18] = "Province|SPECIAL PROVINCES";

// Cities
var c_a = new Array();
c_a['BASILAN'] = "LAMITAN CITY|LANTAWAN|MALUSO|SUMISIP|TIPO-TIPO|TUBURAN|AKBAR|AL-BARKA|HADJI MOHAMMAD AJUL|UNGKAYA PUKAN|HADJI MUHTAMAD|TABUAN-LASA";
c_a['LANAO DEL SUR'] = "BACOLOD-KALAWI (BACOLOD GRANDE)|BALABAGAN|BALINDONG (WATU)|BAYANG|BINIDAYAN|BUADIPOSO-BUNTONG|BUBONG|BUMBARAN|BUTIG|CALANOGAS|DITSAAN-RAMAIN|GANASSI|KAPAI|KAPATAGAN|LUMBA-BAYABAO (MAGUING)|LUMBACA-UNAYAN|LUMBATAN|LUMBAYANAGUE|MADALUM|MADAMBA|MAGUING|MALABANG|MARANTAO|MARAWI CITY|MAROGONG|MASIU|MULONDO|PAGAYAWAN (TATARIKAN)|PIAGAPO|PICONG  (SULTAN GUMANDER)|POONA BAYABAO  (GATA)|PUALAS|SAGUIARAN|SULTAN DUMALONDONG|TAGOLOAN|TAMPARAN|TARAKA|TUBARAN|TUGAYA|WAO";
c_a['MAGUIDANAO'] = "AMPATUAN|BARIRA|BULDON|BULUAN|DATU ABDULLAH SANGKI|DATU ANGGAL MIDTIMBANG|DATU BLAH T. SINSUAT|DATU HOFFER AMPATUAN|DATU ODIN SINSUAT (DINAIG)|DATU PAGLAS|DATU PIANG|DATU SALIBO|DATU SAUDI AMPATUAN|DATU UNSAY|GEN. S. K. PENDATUN|GUINDULUNGAN|KABUNTALAN (TUMBAO)|MAMASAPANO|MANGUDADATU|MATANOG|NORTHERN KABUNTALAN|PAGAGAWAN|PAGALUNGAN|PAGLAT|PANDAG|PARANG|RAJAH BUAYAN|SHARIFF AGUAK (MAGANOY)|SHARIFF SAYDONA MUSTAPHA|SOUTH UPI|SULTAN KUDARAT (NULING)|SULTAN MASTURA|SULTAN SA BARONGIS (LAMBAYONG)|TALAYAN|TALITAY|UPI ";
c_a['SULO'] = "HADJI PANGLIMA TAHIL (MARUNGGAS)|INDANAN|JOLO|KALINGALAN CALUANG|LUGUS|LUUK|MAIMBUNG|OLD PANAMAO|OMAR|PANDAMI|PANGLIMA ESTINO (NEW PANAMAO)|PANGUTARAN|PARANG|PATA|PATIKUL|SIASI|TALIPAO|TAPUL|TONGKIL";
c_a['TAWI-TAWI'] = "BONGAO|LANGUYAN|MAPUN (CAGAYAN DE TAWI-TAWI)|PANGLIMA SUGALA (BALIMBING)|SAPA-SAPA|SIBUTU|SIMUNUL|SITANGKAI|SOUTH UBIAN|TANDUBAS|TURTLE ISLANDS";
c_a['ABRA'] = "BANGUED|BOLINEY|BUCAY|BUCLOC|DAGUIOMAN|DANGLAS|DOLORES|LA PAZ|LACUB|LAGANGILANG|LAGAYAN|LANGIDEN|LICUAN-BAAY (LICUAN)|LUBA|MALIBCONG|MANABO|PEÑARRUBIA|PIDIGAN|PILAR|SALLAPADAN|SAN ISIDRO|SAN JUAN|SAN QUINTIN|TAYUM|TINEG|TUBO|VILLAVICIOSA";
c_a['APAYAO'] = "CALANASAN (BAYAG)|CONNER|FLORA|KABUGAO|LUNA|PUDTOL|SANTA MARCELA";
c_a['BENGUET'] = "ATOK|BAGUIO CITY|BAKUN|BOKOD|BUGUIAS|ITOGON|KABAYAN|KAPANGAN|KIBUNGAN|LA TRINIDAD|MANKAYAN|SABLAN|TUBA|TUBLAY";
c_a['IFUGAO'] = "AGUINALDO|ALFONSO LISTA (POTIA)|ASIPULO|BANAUE|HINGYON|HUNGDUAN|KIANGAN|LAGAWE|LAMUT|MAYOYAO|TINOC";
c_a['KALINGA'] = "BALBALAN|LUBUAGAN|PASIL|PINUKPUK|RIZAL (LIWAN)|TABUK CITY|TANUDAN|TINGLAYAN";
c_a['MOUNTAIN PROVINCE'] = "BARLIG|BAUKO|BESAO|BONTOC|NATONIN|PARACELIS|SABANGAN|SADANGA|SAGADA|TADIAN";
c_a['AGUSAN DEL NORTE'] = "BUENAVISTA|BUTUAN CITY|CABADBARAN CITY| CARMEN|JABONGA|KITCHARAO|LAS NIEVES|MAGALLANES|NASIPIT|REMEDIOS T. ROMUALDEZ|SANTIAGO|TUBAY";
c_a['AGUSAN DEL SUR'] = "BAYUGAN  CITY|BUNAWAN|ESPERANZA|LA PAZ|LORETO|PROSPERIDAD|ROSARIO|SAN FRANCISCO|SAN LUIS|SANTA JOSEFA|SIBAGAT|TALACOGON|TRENTO|VERUELA";
c_a['DINAGAT ISLANDS'] = "BASILISA (RIZAL)|CAGDIANAO|DINAGAT| LIBJO (ALBOR)|LORETO|SAN JOSE|TUBAJON";
c_a['SURIGAO DEL NORTE'] = "ALEGRIA|BACUAG|BURGOS|CLAVER|DAPA|DEL CARMEN|GENERAL LUNA|GIGAQUIT|MAINIT|MALIMONO|PILAR|PLACER|SAN BENITO|SAN FRANCISCO (ANAO-AON)|SAN ISIDRO|SANTA MONICA (SAPAO)|SISON|SOCORRO|SURIGAO CITY|TAGANA-AN|TUBOD";
c_a['SURIGAO DEL SUR'] = "BAROBO|BAYABAS|BISLIG  CITY|CAGWAIT|CANTILAN|CARMEN|CARRASCAL|CORTES|HINATUAN|LANUZA|LIANGA|LINGIG|MADRID|MARIHATAG|SAN AGUSTIN|SAN MIGUEL|TAGBINA|TAGO|TANDAG CITY";
c_a['NCR - FOURTH DISTRICT'] = "CITY OF LAS PIÑAS|CITY OF MAKATI, 1ST DISTRICT|CITY OF MAKATI, 2ND DISTRICT|CITY OF MUNTINLUPA|CITY OF PARAÑAQUE|PASAY CITY, 1ST DISTRICT|PASAY CITY, 2ND DISTRICT|PATEROS|TAGUIG CITY";
c_a['NCR - MANILA'] = "MANILA, 1ST DISTRICT|MANILA, 2ND DISTRICT|MANILA, 3RD DISTRICT|MANILA, 4TH DISTRICT|MANILA, 5TH DISTRICT|MANILA, 6TH DISTRICT";
c_a['NCR - SECOND DISTRICT'] = "CITY OF MANDALUYONG|CITY OF MARIKINA, 1ST DISTRICT|CITY OF MARIKINA, 2ND DISTRICT|CITY OF PASIG, 1ST DISTRICT|CITY OF PASIG, 2ND DISTRICT|QUEZON CITY, 1ST DISTRICT|QUEZON CITY, 2ND DISTRICT|QUEZON CITY, 3RD DISTRICT|QUEZON CITY, 4TH DISTRICT|QUEZON CITY, 5TH DISTRICT|QUEZON CITY, 6TH DISTRICT|SAN JUAN CITY";
c_a['NCR - THIRD DISTRICT'] = "CALOOCAN CITY, 1ST DISTRICT|CALOOCAN CITY, 2ND DISTRICT|CITY OF VALENZUELA, 1ST DISTRICT|CITY OF VALENZUELA, 2ND DISTRICT|MALABON CITY|NAVOTAS CITY";
c_a['ILOCOS NORTE'] = "ADAMS|BACARRA|BADOC|BANGUI|BANNA (ESPIRITU)|BATAC CITY|BURGOS|CARASI|CURRIMAO|DINGRAS|DUMALNEG|LAOAG CITY|MARCOS|NUEVA ERA|PAGUDPUD|PAOAY|PASUQUIN|PIDDIG|PINILI|SAN NICOLAS|SARRAT|SOLSONA|VINTAR";
c_a['ILOCOS SUR'] = "ALILEM|BANAYOYO|BANTAY|BURGOS|CABUGAO|CANDON CITY|CAOAYAN|CERVANTES|GALIMUYOD|GREGORIO DEL PILAR (CONCEPCION)|LIDLIDDA|MAGSINGAL|NAGBUKEL|NARVACAN|QUIRINO (ANGKAKI)|SALCEDO (BAUGEN)|SAN EMILIO|SAN ESTEBAN|SAN ILDEFONSO|SAN JUAN (LAPOG)|SAN VICENTE|SANTA|SANTA CATALINA|SANTA CRUZ|SANTA LUCIA|SANTA MARIA|SANTIAGO|SANTO DOMINGO|SIGAY|SINAIT|SUGPON|SUYO|TAGUDIN|VIGAN CITY";
c_a['LA UNION'] = "AGOO|ARINGAY|BACNOTAN|BAGULIN|BALAOAN|BANGAR|BAUANG|BURGOS|CABA|CITY OF SAN FERNANDO|LUNA|NAGUILIAN|PUGO|ROSARIO|SAN GABRIEL|SAN JUAN|SANTO TOMAS|SANTOL|SUDIPEN|TUBAO";
c_a['PANGASINAN'] = "AGNO|AGUILAR|ALAMINOS CITY|ALCALA|ANDA|ASINGAN|BALUNGAO|BANI|BASISTA|BAUTISTA|BAYAMBANG|BINALONAN|BINMALEY|BOLINAO|BUGALLON|BURGOS|CALASIAO|DAGUPAN CITY|DASOL|INFANTA|LABRADOR|LAOAC|LINGAYEN|MABINI|MALASIQUI|MANAOAG|MANGALDAN|MANGATAREM|MAPANDAN|NATIVIDAD|POZZORUBIO|ROSALES|SAN CARLOS CITY|SAN FABIAN|SAN JACINTO|SAN MANUEL|SAN NICOLAS|SAN QUINTIN|SANTA BARBARA|SANTA MARIA|SANTO TOMAS|SISON|SUAL|TAYUG|UMINGAN|URBIZTONDO|URDANETA CITY|VILLASIS";
c_a['BATANES'] = "BASCO|ITBAYAT|IVANA|MAHATAO|SABTANG|UYUGAN";
c_a['CAGAYAN'] = "ABULUG|ALCALA|ALLACAPAN|AMULUNG|APARRI|BAGGAO|BALLESTEROS|BUGUEY|CALAYAN|CAMALANIUGAN|CLAVERIA|ENRILE|GATTARAN|GONZAGA|IGUIG|LAL-LO|LASAM|PAMPLONA|PEÑABLANCA|PIAT|RIZAL|SANCHEZ-MIRA|SANTA ANA|SANTA PRAXEDES|SANTA TERESITA|SANTO NIÑO (FAIRE)|SOLANA|TUAO|TUGUEGARAO CITY";
c_a['ISABELA'] = "ALICIA|ANGADANAN|AURORA|BENITO SOLIVEN|BURGOS|CABAGAN|CABATUAN|CAUAYAN CITY|CITY OF SANTIAGO CORDON|DELFIN ALBANO (MAGSAYSAY)|DINAPIGUE|DIVILACAN|ECHAGUE|GAMU|ILAGAN|JONES|LUNA|MACONACON|MALLIG|NAGUILIAN|PALANAN|QUEZON|QUIRINO|RAMON|REINA MERCEDES|ROXAS|SAN AGUSTIN|SAN GUILLERMO|SAN ISIDRO|SAN MANUEL|SAN MARIANO|SAN MATEO|SAN PABLO|SANTA MARIA|SANTO TOMAS|TUMAUINI";
c_a['NUEVA VIZCAYA'] = "ALFONSO CASTANEDA|AMBAGUIO|ARITAO|BAGABAG|BAMBANG|BAYOMBONG|DIADI|DUPAX DEL NORTE|DUPAX DEL SUR|KASIBU|KAYAPA|QUEZON|SANTA FE|SOLANO|VILLAVERDE";
c_a['QUIRINO'] = "AGLIPAY|CABARROGUIS|DIFFUN|MADDELA|NAGTIPUNAN|SAGUDAY";
c_a['AURORA'] = "BALER|CASIGURAN|DILASAG|DINALUNGAN|DINGALAN|DIPACULAO|MARIA AURORA|SAN LUIS";
c_a['BATAAN'] = "ABUCAY|BAGAC|BALANGA CITY|DINALUPIHAN|HERMOSA|LIMAY|MARIVELES|MORONG|ORANI|ORION|PILAR|SAMAL";
c_a['BULACAN'] = "ANGAT|BALAGTAS (BIGAA)|BALIUAG|BOCAUE|BULACAN|BUSTOS|CALUMPIT|DOÑA REMEDIOS TRINIDAD|GUIGUINTO|HAGONOY|MALOLOS CITY|MARILAO|MEYCAUAYAN CITY|NORZAGARAY|OBANDO|PANDI|PAOMBONG|PLARIDEL|PULILAN|SAN ILDEFONSO|SAN JOSE DEL MONTE CITY|SAN MIGUEL|SAN RAFAEL|SANTA MARIA";
c_a['NUEVA ECIJA'] = "ALIAGA|BONGABON|CABANATUAN CITY|CABIAO|CARRANGLAN|CUYAPO|GABALDON (BITULOK AND SABANI)|GAPAN CITY|GENERAL MAMERTO NATIVIDAD|GENERAL TINIO(PAPAYA)|GUIMBA|JAEN|LAUR|LICAB|LLANERA|LUPAO|NAMPICUAN|PALAYAN CITY|PANTABANGAN|PEÑARANDA|QUEZON|RIZAL|SAN ANTONIO|SAN ISIDRO|SAN JOSE CITY|SAN LEONARDO|SANTA ROSA|SANTO DOMINGO|SCIENCE CITY OF MUÑOZ|TALAVERA|TALUGTUG|ZARAGOZA";
c_a['PAMPANGA'] = "ANGELES CITY|APALIT|ARAYAT|BACOLOR|CANDABA|FLORIDABLANCA|GUAGUA|LUBAO|MABALACAT|MACABEBE|MAGALANG|MASANTOL|MEXICO|MINALIN|PORAC|SAN FERNANDO  CITY|SAN LUIS|SAN SIMON|SANTA ANA|SANTA RITA|SANTO TOMAS|SASMUAN";
c_a['TARLAC'] = "ANAO|BAMBAN|CAMILING|CAPAS|CITY OF TARLAC|CONCEPCION|GERONA|LA PAZ|MAYANTOC|MONCADA|PANIQUI|PURA|RAMOS|SAN CLEMENTE|SAN JOSE|SAN MANUEL|SANTA IGNACIA|VICTORIA|";
c_a['ZAMBALES'] = "BOTOLAN|CABANGAN|CANDELARIA|CASTILLEJOS|IBA|MASINLOC|OLONGAPO CITY|PALAUIG|SAN ANTONIO|SAN FELIPE|SAN MARCELINO|SAN NARCISO|SANTA CRUZ|SUBIC";
c_a['BATANGAS'] = "AGONCILLO|ALITAGTAG|BALAYAN|BALETE|BATANGAS CITY|BAUAN|CALACA|CALATAGAN|CUENCA|IBAAN|LAUREL|LEMERY|LIAN|LIPA CITY|LOBO|MABINI|MALVAR|MATAAS NA KAHOY|NASUGBU|PADRE GARCIA|ROSARIO|SAN JOSE|SAN JUAN|SAN LUIS|SAN NICOLAS|SAN PASCUAL|SANTA TERESITA|SANTO TOMAS|TAAL|TALISAY|TANAUAN CITY|TAYSAN|TINGLOY|TUY";
c_a['CAVITE'] = "ALFONSO|AMADEO|BACOOR|CARMONA|CAVITE CITY|DASMARIÑAS CITY|GEN. MARIANO ALVAREZ|GENERAL EMILIO AGUINALDO|GENERAL TRIAS CITY|IMUS|INDANG|KAWIT|MAGALLANES|MARAGONDON|MENDEZ(MENDEZ-NUÑEZ)|NAIC|NOVELETA|ROSARIO|SILANG|TAGAYTAY CITY|TANZA|TERNATE|TRECE MARTIRES CITY";
c_a['LAGUNA'] = "ALAMINOS|BAY|BIÑAN CITY|CABUYAO CITY|CALAMBA CITY|CALAUAN|CAVINTI|FAMY|KALAYAAN|LILIW|LOS BAÑOS|LUISIANA|LUMBAN|MABITAC|MAGDALENA|MAJAYJAY|NAGCARLAN|PAETE|PAGSANJAN|PAKIL|PANGIL|PILA|RIZAL|SAN PABLO CITY|SAN PEDRO CITY|SANTA CRUZ|SANTA MARIA|SANTA ROSA CITY|SINILOAN|VICTORIA";
c_a['QUEZON'] = "AGDANGAN|ALABAT|ATIMONAN|BUENAVISTA|BURDEOS|CALAUAG|CANDELARIA|CATANAUAN|DOLORES|GENERAL LUNA|GENERAL NAKAR|GUINAYANGAN|GUMACA|INFANTA|JOMALIG|LOPEZ|LUCBAN|LUCENA CITY|MACALELON|MAUBAN|MULANAY|PADRE BURGOS|PAGBILAO|PANUKULAN|PATNANUNGAN|PEREZ|PITOGO|PLARIDEL|POLILLO|QUEZON|REAL|SAMPALOC|SAN ANDRES|SAN ANTONIO|SAN FRANCISCO (AURORA)|SAN NARCISO|SARIAYA|TAGKAWAYAN|TAYABAS CITY|TIAONG|UNISAN";
c_a['RIZAL'] = "ANGONO|BARAS|BINANGONAN|CAINTA|CARDONA|CITY OF ANTIPOLO|JALA-JALA|MORONG|PILILLA|RODRIGUEZ (MONTALBAN)|SAN MATEO|TANAY|TAYTAY|TERESA";
c_a['MARINDUQUE'] = "BOAC|BUENAVISTA|GASAN|MOGPOG|SANTA CRUZTORRIJOS";
c_a['OCCIDENTAL MINDORO'] = "ABRA DE ILOG|CALINTAAN|LOOC|LUBANG|MAGSAYSAY|MAMBURAO|PALUAN|RIZAL|SABLAYAN|SAN JOSE|SANTA CRUZ";
c_a['ORIENTAL MINDORO'] = "BACO|BANSUD|BONGABONG|BULALACAO(SAN PEDRO)|CITY OF CALAPAN|GLORIA|MANSALAY|NAUJAN|PINAMALAYAN|POLA|PUERTO GALERA|ROXAS|SAN TEODORO|SOCORRO|VICTORIA";
c_a['PALAWAN'] = "ABORLAN|AGUTAYA|ARACELI|BALABAC|BATARAZA|BROOKES POINT|BUSUANGA|CAGAYANCILLO|CORON|CULION|CUYO|DUMARAN|EL NIDO (BACUIT)|KALAYAAN|LINAPACAN|MAGSAYSAY|NARRA|PUERTO PRINCESA CITY|QUEZON|RIZAL (MARCOS)|ROXAS|SAN VICENTE|SOFRONIO ESPAÑOLA|TAYTAY";
c_a['ROMBLON'] = "ALCANTARA|BANTON|CAJIDIOCAN|CALATRAVA|CONCEPCION|CORCUERA|FERROL|LOOC|MAGDIWANG|ODIONGAN|ROMBLON|SAN AGUSTIN|SAN ANDRES|SAN FERNANDO|SAN JOSE|SANTA FE|SANTA MARIA (IMELDA)";
c_a['ZAMBOANGA DEL NORTE'] = "DAPITAN CITY|DIPOLOG CITY|KATIPUNAN|LA LIBERTAD|LABASON|LILOY|MANUKAN|MUTIA|PIÑAN (NEW PIÑAN)|POLANCO|PRES. MANUEL A. ROXAS|RIZAL|SALUG|SERGIO OSMEÑA SR.|SIAYAN|SIBUCO|SIBUTAD|SINDANGAN|SIOCON|SIRAWAI|TAMPILISAN|JOSE DALMAN (PONOT)|GUTALAC|BALIGUIAN|GODOD|BACUNGAN (Leon T. Postigo)|KALAWIT";
c_a['ZAMBOANGA DEL SUR'] = "AURORA|BAYOG|DIMATALING|DINAS|DUMALINAO|DUMINGAG|KUMALARANG|LABANGAN|LAPUYAN|MAHAYAG|MARGOSATUBIG|MIDSALIP|MOLAVE|PAGADIAN CITY|RAMON MAGSAYSAY (LIARGO)|SAN MIGUEL|SAN PABLO|TABINA|TAMBULIG|TUKURAN|ZAMBOANGA CITY, 1ST DISTRICT|ZAMBOANGA CITY, 2ND DISTRICT|LAKEWOOD|JOSEFINA|PITOGO|SOMINOT (DON MARIANO MARCOS)|VINCENZO A. SAGUN|GUIPOS|TIGBAO";
c_a['ZAMBOANGA SIBUGAY'] = "ALICIA|BUUG|DIPLAHAN|IMELDA|IPIL|KABASALAN|MABUHAY|MALANGAS|NAGA|OLUTANGA|PAYAO|ROSELLER LIM|SIAY|TALUSAN|TITAY|TUNGAWAN";
c_a['ALBAY'] = "BACACAY|CAMALIG|DARAGA (LOCSIN)|GUINOBATAN|JOVELLAR|LEGAZPI CITY|LIBON|LIGAO  CITY|MALILIPOT|MALINAO|MANITO|OAS|PIO DURAN|POLANGUI|RAPU-RAPU|SANTO DOMINGO (LIBOG)|TABACO  CITY|TIWI";
c_a['CAMARINES NORTE'] = "BASUD|CAPALONGA|DAET|SAN LORENZO RUIZ (IMELDA)|JOSE PANGANIBAN|LABO|MERCEDES|PARACALE|SAN VICENTE|SANTA ELENA|TALISAY|VINZONS";
c_a['CAMARINES SUR'] = "BAAO|BALATAN|BATO|BOMBON|BUHI|BULA|CABUSAO|CALABANGA|CAMALIGAN|CANAMAN|CARAMOAN|DEL GALLEGO|GAINZA|GARCHITORENA|GOA|IRIGA CITY|LAGONOY|LIBMANAN|LUPI|MAGARAO|MILAOR|MINALABAC|NABUA|NAGA CITY|OCAMPO|PAMPLONA|PASACAO|PILI|PRESENTACION  (PARUBCAN)|RAGAY|SAGÑAY|SAN FERNANDO|SAN JOSE|SIPOCOT|SIRUMA|TIGAON|TINAMBAC";
c_a['CATANDUANES'] = "BAGAMANOC|BARAS|BATO|CARAMORAN|GIGMOTO|PANDAN|PANGANIBAN (PAYO)|SAN ANDRES (CALOLBON)|SAN MIGUEL|VIGA|VIRAC";
c_a['MASBATE'] = "AROROY|BALENO|BALUD|BATUAN|CATAINGAN|CAWAYAN|CLAVERIA|DIMASALANG|ESPERANZA|MANDAON|MASBATE  CITY|MILAGROS|MOBO|MONREAL|PALANAS|PIO V. CORPUZ (LIMBUHAN)|PLACER|SAN FERNANDO|SAN JACINTO|SAN PASCUAL|USON";
c_a['SORSOGON'] = "BARCELONA|BULAN|BULUSAN|CASIGURAN|CASTILLA|DONSOL|GUBAT|IROSIN|JUBAN|MAGALLANES|MATNOG|PILAR|PRIETO DIAZ|SANTA MAGDALENA|SORSOGON CITY";
c_a['AKLAN'] = "ALTAVAS|BALETE|BANGA|BATAN|BURUANGA|IBAJAY|KALIBO|LEZO|LIBACAO|MADALAG|MAKATO|MALAY|MALINAO|NABAS|NEW WASHINGTON|NUMANCIA|TANGALAN";
c_a['ANTIQUE'] = "ANINI-Y|BARBAZA|BELISON|BUGASONG|CALUYA|CULASI|TOBIAS FORNIER (DAO)|HAMTIC|LAUA-AN|LIBERTAD|PANDAN|PATNONGON|SAN JOSE|SAN REMIGIO|SEBASTE|SIBALOM|TIBIAO|VALDERRAMA";
c_a['CAPIZ'] = "CUARTERO|DAO|DUMALAG|DUMARAO|IVISAN|JAMINDAN|MA-AYON|MAMBUSAO|PANAY|PANITAN|PILAR|PONTEVEDRA|PRESIDENT ROXAS|ROXAS CITY|SAPI-AN|SIGMA|TAPAZ";
c_a['GUIMARAS'] = "BUENAVISTA|JORDAN|NUEVA VALENCIA|SAN LORENZO|SIBUNAG";
c_a['ILOILO'] = "AJUY|ALIMODIAN|ANILAO|BADIANGAN|BALASAN|BANATE|BAROTAC NUEVO|BAROTAC VIEJO|BATAD|BINGAWAN|CABATUAN|CALINOG|CARLES|CONCEPCION|DINGLE|DUEÑAS|DUMANGAS|ESTANCIA|GUIMBAL|IGBARAS|ILOILO CITY|JANIUAY|LAMBUNAO|LEGANES|LEMERY|LEON|MAASIN|MIAGAO|MINA|NEW LUCENA|OTON|CITY OF PASSI|PAVIA|POTOTAN|SAN DIONISIO|SAN ENRIQUE|SAN JOAQUIN|SAN MIGUEL|SAN RAFAEL|SANTA BARBARA|SARA|TIGBAUAN|TUBUNGAN|ZARRAGA";
c_a['NEGROS OCCIDENTAL'] = "BACOLOD CITY|BAGO CITY|BINALBAGAN|CADIZ CITY|CALATRAVA|CANDONI|CAUAYAN|ENRIQUE B. MAGALONA (SARAVIA)|ESCALANTE   CITY|HIMAMAYLAN   CITY|HINIGARAN|HINOBA-AN (ASIA)|ILOG|ISABELA|KABANKALAN  CITY|LA CARLOTA CITY|LA CASTELLANA|MANAPLA|MOISES PADILLA (MAGALLON)|MURCIA|PONTEVEDRA|PULUPANDAN|SAGAY CITY|SAN CARLOS CITY|SAN ENRIQUE|SILAY CITY|SIPALAY  CITY|TALISAY  CITY|TOBOSO|VALLADOLID|VICTORIAS CITY|SALVADOR BENEDICTO";
c_a['BOHOL'] = "ALBURQUERQUE|ALICIA|ANDA|ANTEQUERA|BACLAYON|BALILIHAN|BATUAN|BILAR|BUENAVISTA|CALAPE|CANDIJAY|CARMEN|CATIGBIAN|CLARIN|CORELLA|CORTES|DAGOHOY|DANAO|DAUIS|DIMIAO|DUERO|GARCIA HERNANDEZ|GUINDULMAN|INABANGA|JAGNA|JETAFE|LILA|LOAY|LOBOC|LOON|MABINI|MARIBOJOC|PANGLAO|PILAR|PRES. CARLOS P. GARCIA (PITOGO)|SAGBAYAN (BORJA)|SAN ISIDRO|SAN MIGUEL|SEVILLA|SIERRA BULLONES|SIKATUNA|TAGBILARAN CITY|TALIBON|TRINIDAD|TUBIGON|UBAY|VALENCIA|BIEN UNIDO";
c_a['CEBU'] = "ALCANTARA|ALCOY|ALEGRIA|ALOGUINSAN|ARGAO|ASTURIAS|BADIAN|BALAMBAN|BANTAYAN|BARILI|BOGO CITY|BOLJOON|BORBON|CARCAR CITY|CARMEN|CATMON|CEBU CITY, 1ST DISTRICT|CEBU CITY, 2ND DISTRICT|COMPOSTELA|CONSOLACION|CORDOBA|DAANBANTAYAN|DALAGUETE|DANAO CITY|DUMANJUG|GINATILAN|LAPU-LAPU CITY  (OPON)|LILOAN|MADRIDEJOS|MALABUYOC|MANDAUE CITY|MEDELLIN|MINGLANILLA|MOALBOAL|NAGA CITY|OSLOB|PILAR|PINAMUNGAHAN|PORO|RONDA|SAMBOAN|SAN FERNANDO|SAN FRANCISCO|SAN REMIGIO|SANTA FE|SANTANDER|SIBONGA|SOGOD|TABOGON|TABUELAN|TALISAY  CITY|TOLEDO CITY|TUBURAN|TUDELA";
c_a['NEGROS ORIENTAL'] = "AMLAN (AYUQUITAN)|AYUNGON|BACONG|BAIS CITY|BASAY|BAYAWAN  CITY (TULONG)|BINDOY (PAYABON)|CANLAON CITY|DAUIN|DUMAGUETE CITY|GUIHULNGAN CITY|JIMALALUD|LA LIBERTAD|MABINAY|MANJUYOD|PAMPLONA|SAN JOSE|SANTA CATALINA|SIATON|SIBULAN|TANJAY   CITY|TAYASAN|VALENCIA (LUZURRIAGA)|VALLEHERMOSO|ZAMBOANGUITA";
c_a['SIQUIJOR'] = "ENRIQUE VILLANUEVA|LARENA|LAZI|MARIA|SAN JUAN|SIQUIJOR";
c_a['BILIRAN'] = "ALMERIA|BILIRAN|CABUCGAYAN|CAIBIRAN|CULABA|KAWAYAN|MARIPIPI|NAVAL";
c_a['EASTERN SAMAR'] = "ARTECHE|BALANGIGA|BALANGKAYAN|BORONGAN CITY|CAN-AVID|DOLORES|GENERAL MACARTHUR|GIPORLOS|GUIUAN|HERNANI|JIPAPAD|LAWAAN|LLORENTE|MASLOG|MAYDOLONG|MERCEDES|ORAS|QUINAPONDAN|SALCEDO|SAN JULIAN|SAN POLICARPO|SULAT|TAFT";
c_a['LEYTE'] = "ABUYOG|ALANGALANG|ALBUERA|BABATNGON|BARUGO|BATO|BAYBAY CITY|BURAUEN|CALUBIAN|CAPOOCAN|CARIGARA|DAGAMI|DULAG|HILONGOS|HINDANG|INOPACAN|ISABEL|JARO|JAVIER  (BUGHO)|JULITA|KANANGA|LA PAZ|LEYTE|MACARTHUR|MAHAPLAG|MATAG-OB|MATALOM|MAYORGA|MERIDA|ORMOC CITY|PALO|PALOMPON|PASTRANA|SAN ISIDRO|SAN MIGUEL|SANTA FE|TABANGO|TABONTABON|TACLOBAN CITY|TANAUAN|TOLOSA|TUNGA|VILLABA";
c_a['NORTHERN SAMAR'] = "ALLEN|BIRI|BOBON|CAPUL|CATARMAN|CATUBIG|GAMAY|LAOANG|LAPINIG|LAS NAVAS|LAVEZARES|MAPANAS|MONDRAGON|PALAPAG|PAMBUJAN|ROSARIO|SAN ANTONIO|SAN ISIDRO|SAN JOSE|SAN ROQUE|SAN VICENTE|SILVINO LOBOS|VICTORIA|LOPE DE VEGA";
c_a['SAMAR (WESTERN SAMAR)'] = "ALMAGRO|BASEY|CALBAYOG CITY|CALBIGA|CATBALOGAN CITY|DARAM|GANDARA|HINABANGAN|JIABONG|MARABUT|MATUGUINAO|MOTIONG|PINABACDAO|SAN JOSE DE BUAN|SAN SEBASTIAN|SANTA MARGARITA|SANTA RITA|SANTO NIÑO|TALALORA|TARANGNAN|VILLAREAL|PARANAS  (WRIGHT)|ZUMARRAGA|TAGAPUL-AN|SAN JORGE|PAGSANGHAN";
c_a['SOUTHERN LEYTE'] = "ANAHAWAN|BONTOC|HINUNANGAN|HINUNDAYAN|LIBAGON|LILOAN|MAASIN  CITY|MACROHON|MALITBOG|PADRE BURGOS|PINTUYAN|SAINT BERNARD|SAN FRANCISCO|SAN JUAN (CABALIAN)|SAN RICARDO|SILAGO|SOGOD|TOMAS OPPUS|LIMASAWA";
c_a['BUKIDNON'] = "BAUNGON|DAMULOG|DANGCAGAN|DON CARLOS|IMPASUG-ONG|KADINGILAN|KALILANGAN|KIBAWE|KITAOTAO|LANTAPAN|LIBONA|CITY OF MALAYBALAY|MALITBOG|MANOLO FORTICH|MARAMAG|PANGANTUCAN|QUEZON|SAN FERNANDO|SUMILAO|TALAKAG|VALENCIA  CITY|CABANGLASAN|";
c_a['CAMIGUIN'] = "CATARMAN|GUINSILIBAN|MAHINOG|MAMBAJAO|SAGAY";
c_a['LANAO DEL NORTE'] = "BACOLOD|BALOI|BAROY|ILIGAN CITY|KAPATAGAN|SULTAN NAGA DIMAPORO  (KAROMATAN)|KAUSWAGAN|KOLAMBUGAN|LALA|LINAMON|MAGSAYSAY|MAIGO|MATUNGAO|MUNAI|NUNUNGAN|PANTAO RAGAT|POONA PIAGAPO|SALVADOR|SAPAD|TAGOLOAN|TANGCAL|TUBOD|PANTAR";
c_a['MISAMIS OCCIDENTAL'] = "ALORAN|BALIANGAO|BONIFACIO|CALAMBA|CLARIN|CONCEPCION|JIMENEZ|LOPEZ JAENA|OROQUIETA CITY|OZAMIS CITY|PANAON|PLARIDEL|SAPANG DALAGA|SINACABAN|TANGUB CITY|TUDELA|DON VICTORIANO CHIONGBIAN  (DON MARIANO MARCOS)";
c_a['MISAMIS ORIENTAL'] = "ALUBIJID|BALINGASAG|BALINGOAN|BINUANGAN|CAGAYAN DE ORO CITY|CLAVERIA|EL SALVADOR CITY|GINGOOG CITY|GITAGUM|INITAO|JASAAN|KINOGUITAN|LAGONGLONG|LAGUINDINGAN|LIBERTAD|LUGAIT|MAGSAYSAY (LINUGOS)|MANTICAO|MEDINA|NAAWAN|OPOL|SALAY|SUGBONGCOGON|TAGOLOAN|TALISAYAN|VILLANUEVA";
c_a['COMPOSTELA VALLEY'] = "COMPOSTELA|LAAK (SAN VICENTE)|MABINI (DOÑA ALICIA)|MACO|MARAGUSAN (SAN MARIANO)|MAWAB|MONKAYO|MONTEVISTA|NABUNTURAN|NEW BATAAN|PANTUKAN";
c_a['DAVAO  (DAVAO DEL NORTE)'] = "ASUNCION (SAUG)|CARMEN|KAPALONG|NEW CORELLA|PANABO  CITY|ISLAND GARDEN CITY OF SAMAL, BABAK DISTRICT|ISLAND GARDEN CITY OF SAMAL, SAMAL DISTRICT|ISLAND GARDEN CITY OF SAMAL, KAPUTIAN DISTRICT|SANTO TOMAS|CITY OF TAGUM|TALAINGOD|BRAULIO E. DUJALI|SAN ISIDRO";
c_a['DAVAO DEL SUR'] = "BANSALAN|DAVAO CITY, 1ST DISTRICT|DAVAO CITY, 2ND DISTRICT|DAVAO CITY, 3RD DISTRICT|DIGOS  CITY|HAGONOY|KIBLAWAN|MAGSAYSAY|MALALAG|MATANAO|PADADA|SANTA CRUZ|SULOP";
c_a['DAVAO OCCIDENTAL'] = "DON MARCELINO|JOSE ABAD SANTOS (TRINIDAD)|MALITA|SANTA MARIA|SARANGANI";
c_a['DAVAO ORIENTAL'] = "BAGANGA|BANAYBANAY|BOSTON|CARAGA|CATEEL|GOVERNOR GENEROSO|LUPON|MANAY|MATI  CITY|SAN ISIDRO|TARRAGONA";
c_a['COTABATO (NORTH COT.)'] = "ALAMADA|CARMEN|KABACAN|CITY OF KIDAPAWAN|LIBUNGAN|MAGPET|MAKILALA|MATALAM|MIDSAYAP|MLANG|PIGKAWAYAN|PIKIT|PRESIDENT ROXAS|TULUNAN|ANTIPAS|BANISILAN|ALEOSAN|ARAKAN";
c_a['SARANGANI'] = "ALABEL|GLAN|KIAMBA|MAASIM|MAITUM|MALAPATAN|MALUNGON";
c_a['SOUTH COTABATO'] = "BANGA|GENERAL SANTOS CITY  (DADIANGAS)|KORONADAL CITY|NORALA|POLOMOLOK|SURALLAH|TAMPAKAN|TANTANGAN|TBOLI|TUPI|SANTO NIÑO|LAKE SEBU";
c_a['SULTAN KUDARAT'] = "BAGUMBAYAN|COLUMBIO|ESPERANZA|ISULAN|KALAMANSIG|LEBAK|LUTAYAN|LAMBAYONG (MARIANO MARCOS)|PALIMBANG|PRESIDENT QUIRINO|TACURONG  CITY|SEN. NINOY AQUINO";
c_a['SPECIAL PROVINCES'] = "ISABELA CITY|COTABATO CITY";