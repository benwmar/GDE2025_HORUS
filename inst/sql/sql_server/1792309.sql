CREATE TABLE #Codesets (
  codeset_id int NOT NULL,
  concept_id bigint NOT NULL
)
;

INSERT INTO #Codesets (codeset_id, concept_id)
SELECT 0 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2821016,42872698,2854332,2808569,2795309,2875418,2826720,42872699,2854333,2826718,4283095,2867379,2821495,2841403,2002027,2875414,2880815,2881272,2809058,2862507,2867861)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2821016,42872698,2854332,2808569,2795309,2875418,2826720,42872699,2854333,2826718,4283095,2867379,2821495,2841403,2002027,2875414,2880815,2881272,2809058,2862507,2867861)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4190630,42894502,42894499,42894511,42894508,42894505,42894496,42894324,42894321,42894333,42894330,42894327,42894318,42894360,42894357,42894369,42894366,42894363,42894354,42894448,42894433,42894428,42894443,42894438,42894423,2725190,2725175,2725170,2725185,2725180,42894560,1531956,1531954,1531950,1531952,1531948,1531955,1531951,1531953,1531949,42895395,42895396,2728405,2728406,42895401,42895402,2728411,2728412,42895413,42895414,2728547,2728548,42895407,42895408,2728541,2728542,42895496,42895497,2728553,2728554,42895398,42895399,2728408,2728409,42895410,42895411,2728544,2728545,42895404,42895405,2728538,2728539,42895493,42895494,2728550,2728551,2821014,2862508,2853856,2836699,2813608,2875413,2841401,2893686,2808570,2867380,2875415,2893689,2849284,2888632,2836701,2862509,2795308,2880814,2836700,2893688,2821015,2888631,2853857,2813610,2853855,2795306,2795307,2800906,2849285,2849286,2862510,2867384,2880816,2875417,2841404,2867382,2881271,2813927,2821487,2821488,2834385,2809056,2795906,2834384,2854336,2863007,2849794,2863008,2881275,2826719,2813934,2854337,2867866,2813933,2834391,2881274,2795910,2841869,2809057,2881273,2875898,2849791,2863006,2867865,2813931,2834390,2894164,2795909,2834388,2813930,2863005,2875897,2826717,2854335,2854334,2834389,2795904,2894157,2795905,2894158,2849787,2867862,2863003,2809055,2809061,2826721,2795914,2894166,2889100,2804032,2809062,2826722,2889099,2804031,2809059,2867868,2854338,2867869,2875899,2821494,2729441,2729444,2729443,2729446,2729442,2729445,2736007,2736010,2736009,2736012,2736008,2736011,2735989,2735992,2735991,2735994,2735990,2735993,2736025,2736028,2736027,2736030,2736026,2736029,2729450,2729453,2729452,2729455,2729451,2729454,2735998,2736001,2736000,2736003,2735999,2736002,2729468,2729471,2729470,2729473,2729469,2729472,2736016,2736019,2736018,2736021,2736017,2736020)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4190630,42894502,42894499,42894511,42894508,42894505,42894496,42894324,42894321,42894333,42894330,42894327,42894318,42894360,42894357,42894369,42894366,42894363,42894354,42894448,42894433,42894428,42894443,42894438,42894423,2725190,2725175,2725170,2725185,2725180,42894560,1531956,1531954,1531950,1531952,1531948,1531955,1531951,1531953,1531949,42895395,42895396,2728405,2728406,42895401,42895402,2728411,2728412,42895413,42895414,2728547,2728548,42895407,42895408,2728541,2728542,42895496,42895497,2728553,2728554,42895398,42895399,2728408,2728409,42895410,42895411,2728544,2728545,42895404,42895405,2728538,2728539,42895493,42895494,2728550,2728551,2821014,2862508,2853856,2836699,2813608,2875413,2841401,2893686,2808570,2867380,2875415,2893689,2849284,2888632,2836701,2862509,2795308,2880814,2836700,2893688,2821015,2888631,2853857,2813610,2853855,2795306,2795307,2800906,2849285,2849286,2862510,2867384,2880816,2875417,2841404,2867382,2881271,2813927,2821487,2821488,2834385,2809056,2795906,2834384,2854336,2863007,2849794,2863008,2881275,2826719,2813934,2854337,2867866,2813933,2834391,2881274,2795910,2841869,2809057,2881273,2875898,2849791,2863006,2867865,2813931,2834390,2894164,2795909,2834388,2813930,2863005,2875897,2826717,2854335,2854334,2834389,2795904,2894157,2795905,2894158,2849787,2867862,2863003,2809055,2809061,2826721,2795914,2894166,2889100,2804032,2809062,2826722,2889099,2804031,2809059,2867868,2854338,2867869,2875899,2821494,2729441,2729444,2729443,2729446,2729442,2729445,2736007,2736010,2736009,2736012,2736008,2736011,2735989,2735992,2735991,2735994,2735990,2735993,2736025,2736028,2736027,2736030,2736026,2736029,2729450,2729453,2729452,2729455,2729451,2729454,2735998,2736001,2736000,2736003,2735999,2736002,2729468,2729471,2729470,2729473,2729469,2729472,2736016,2736019,2736018,2736021,2736017,2736020)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 1 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4236706,4165576,2821651)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4236706,4165576,2821651)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2731078,2730879,2732759,2730223,2730183,2730203,2733409,2730430,2729957,2730470,2729977,2729937,2730450,2730165,2730164,2730166,2730223,2730225,2730224,2730226,2730185,2730184,2730186,2730183,2730203,2730205,2730204,2730206,2733409,2730431,2729919,2730430,2729918,2730473,2729960,2729957,2729959,2729958,2730470,2729977,2730433,2730432,2729920,2729937,2729939,2730450,2729938,2729940,2730182,2730469,2729936,2730222,2733408,2730202,2729976,2730449,2729956,2730429,2730665,2730419,2730212,2730459,2730439,2730664,2730418,2730211,2730458,2730438,2730663,2730417,2730210,2730457,4179713,2834555,1531931,1531929,1531930,1531928,2732412,2732163,2731955,2732203,2732183,2732411,2732162,2731954,2732202,2732182,2732413,2732164,2731956,2732204,2732184,2732410,2732161,2731953,2732201,2732181,2730240,2730019,2730008,2730229,2730030,2730241,2730020,2730009,2730230,2730031,2730239,2730018,2730007,2730228,2730029,2730242,2730021,2730010,2730231,2730032,2730238,2730017,2730006,2730227,2730028,2730754,2730758,2730753,2730759,1531945,2730983,2730769,2730760,2730787,1531944,2730778,2730756,2730755,2730757,2730752,43015504,43015495,43015492,43015501,43015498,43015505,43015496,43015493,43015502,1531909,43015499,43015506,43015497,43015494,43015503,1531908,43015500,2733199,2733166,2732966,2733188,2733177,2733200,2733167,2732967,2733189,2733178,2733198,2733165,2732965,2733187,2733176,2733201,2733168,2732968,2733190,2733179,2733197,2733164,2732964,2733186,2733175,43015444,43015435,43015432,43015441,43015438,43015445,43015436,43015433,43015442,1531913,43015439,43015446,43015437,43015434,43015443,1531912,43015440,2731265,2731250,2731245,2731260,2731255,2731266,2731251,2731246,2731261,1531941,2731256,2731267,2731252,2731247,2731262,1531940,2731257,2731264,2731249,2731244,2731259,2731254,2731263,2731248,2731243,2731258,2731253,1531919,1531917,1531918,1531916,1531937,1531935,1531936,1531934,2731463,2731214,2731194,2731443,2731423,2731462,2731213,2731193,2731442,2731422,2731464,2731215,2731195,2731444,2731424,2731461,2731212,2731192,2731441,2731421,2729755,2733465,2733454,2729744,2729733,2729756,2733466,2733455,2729745,2729734,2729754,2733464,2733453,2729743,2729732,2729757,2733467,2733456,2729746,2729735,2729753,2733463,2733452,2729742,2729731,2730477,2730481,2730289,2730482,1531947,2730519,2730492,2730483,2730510,1531946,2730501,2730479,2730478,2730480,2730288,43015474,43015465,43015462,43015471,43015468,43015475,43015466,43015463,43015472,1531911,43015469,43015476,43015467,43015464,43015473,1531910,43015470,2732711,2732678,2732667,2732700,2732689,2732712,2732679,2732668,2732701,2732690,2732710,2732677,2732666,2732699,2732688,2732713,2732680,2732669,2732702,2732691,2732709,2732676,2732665,2732698,2732687,43015414,43015405,43015402,43015411,43015408,43015415,43015406,43015403,43015412,1531915,43015409,43015416,43015407,43015404,43015413,1531914,43015410,2731031,2731016,2731011,2731026,2731021,2731032,2731017,2731012,2731027,1531943,2731022,2731033,2731018,2731013,2731028,1531942,2731023,2731030,2731015,2731010,2731025,2731020,2731029,2731014,2731009,2731024,2731019,1531925,1531923,1531924,1531922)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2731078,2730879,2732759,2730223,2730183,2730203,2733409,2730430,2729957,2730470,2729977,2729937,2730450,2730165,2730164,2730166,2730223,2730225,2730224,2730226,2730185,2730184,2730186,2730183,2730203,2730205,2730204,2730206,2733409,2730431,2729919,2730430,2729918,2730473,2729960,2729957,2729959,2729958,2730470,2729977,2730433,2730432,2729920,2729937,2729939,2730450,2729938,2729940,2730182,2730469,2729936,2730222,2733408,2730202,2729976,2730449,2729956,2730429,2730665,2730419,2730212,2730459,2730439,2730664,2730418,2730211,2730458,2730438,2730663,2730417,2730210,2730457,4179713,2834555,1531931,1531929,1531930,1531928,2732412,2732163,2731955,2732203,2732183,2732411,2732162,2731954,2732202,2732182,2732413,2732164,2731956,2732204,2732184,2732410,2732161,2731953,2732201,2732181,2730240,2730019,2730008,2730229,2730030,2730241,2730020,2730009,2730230,2730031,2730239,2730018,2730007,2730228,2730029,2730242,2730021,2730010,2730231,2730032,2730238,2730017,2730006,2730227,2730028,2730754,2730758,2730753,2730759,1531945,2730983,2730769,2730760,2730787,1531944,2730778,2730756,2730755,2730757,2730752,43015504,43015495,43015492,43015501,43015498,43015505,43015496,43015493,43015502,1531909,43015499,43015506,43015497,43015494,43015503,1531908,43015500,2733199,2733166,2732966,2733188,2733177,2733200,2733167,2732967,2733189,2733178,2733198,2733165,2732965,2733187,2733176,2733201,2733168,2732968,2733190,2733179,2733197,2733164,2732964,2733186,2733175,43015444,43015435,43015432,43015441,43015438,43015445,43015436,43015433,43015442,1531913,43015439,43015446,43015437,43015434,43015443,1531912,43015440,2731265,2731250,2731245,2731260,2731255,2731266,2731251,2731246,2731261,1531941,2731256,2731267,2731252,2731247,2731262,1531940,2731257,2731264,2731249,2731244,2731259,2731254,2731263,2731248,2731243,2731258,2731253,1531919,1531917,1531918,1531916,1531937,1531935,1531936,1531934,2731463,2731214,2731194,2731443,2731423,2731462,2731213,2731193,2731442,2731422,2731464,2731215,2731195,2731444,2731424,2731461,2731212,2731192,2731441,2731421,2729755,2733465,2733454,2729744,2729733,2729756,2733466,2733455,2729745,2729734,2729754,2733464,2733453,2729743,2729732,2729757,2733467,2733456,2729746,2729735,2729753,2733463,2733452,2729742,2729731,2730477,2730481,2730289,2730482,1531947,2730519,2730492,2730483,2730510,1531946,2730501,2730479,2730478,2730480,2730288,43015474,43015465,43015462,43015471,43015468,43015475,43015466,43015463,43015472,1531911,43015469,43015476,43015467,43015464,43015473,1531910,43015470,2732711,2732678,2732667,2732700,2732689,2732712,2732679,2732668,2732701,2732690,2732710,2732677,2732666,2732699,2732688,2732713,2732680,2732669,2732702,2732691,2732709,2732676,2732665,2732698,2732687,43015414,43015405,43015402,43015411,43015408,43015415,43015406,43015403,43015412,1531915,43015409,43015416,43015407,43015404,43015413,1531914,43015410,2731031,2731016,2731011,2731026,2731021,2731032,2731017,2731012,2731027,1531943,2731022,2731033,2731018,2731013,2731028,1531942,2731023,2731030,2731015,2731010,2731025,2731020,2731029,2731014,2731009,2731024,2731019,1531925,1531923,1531924,1531922)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 2 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4029565,42736542,42736543,4234132)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4029565,42736542,42736543,4234132)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2109201,44510772,4066761,4020327,4022438,4023552,4023553,4146476,2109027,2109026,4123406,4128854,4166293,4166761,4141228,4235570,4067932,4194372,37167365,4144723,4143174,4062763,4300501,4080163,2109113,2109175,2109174,4209537,4327813,4314569,2109200,40488297,2109266,2109265,4198190,40486515,40491959,40493440,4300528,3179756,40485345,43531698,36674363,4103380,2002965)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2109201,44510772,4066761,4020327,4022438,4023552,4023553,4146476,2109027,2109026,4123406,4128854,4166293,4166761,4141228,4235570,4067932,4194372,37167365,4144723,4143174,4062763,4300501,4080163,2109113,2109175,2109174,4209537,4327813,4314569,2109200,40488297,2109266,2109265,4198190,40486515,40491959,40493440,4300528,3179756,40485345,43531698,36674363,4103380,2002965)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 3 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (42872694)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (42872694)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4050715,42896616,42896602,42896609,42896661,42896610,2731751,2731749,42896667,2731750,2730469,2730222,2730202,2730449,2730429,2732207,2731959,2731939,2732187,2732167,2731447,2731198,2731178,2731427,2731218)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4050715,42896616,42896602,42896609,42896661,42896610,2731751,2731749,42896667,2731750,2730469,2730222,2730202,2730449,2730429,2732207,2731959,2731939,2732187,2732167,2731447,2731198,2731178,2731427,2731218)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 4 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4195806)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4195806)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4050131,4116625,2730470,2730223,2730203,2730450,2730430,2732208,2731960,2731940,2732188,2732168,2731448,2731199,2731179,2731428,2731219)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4050131,4116625,2730470,2730223,2730203,2730450,2730430,2732208,2731960,2731940,2732188,2732168,2731448,2731199,2731179,2731428,2731219)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 5 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2811735,2896830,4345349,4030150,2839189)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2811735,2896830,4345349,4030150,2839189)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4216250,2734505,2734504,2734507,2734506,2734509,2734508,2750480,2750482,2750484,2750474,2750476,2750478,4069132,4308420,4344636,4076862,2750473,2750472,44809602,2750468,2750471,2750470,45763716)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4216250,2734505,2734504,2734507,2734506,2734509,2734508,2750480,2750482,2750484,2750474,2750476,2750478,4069132,4308420,4344636,4076862,2750473,2750472,44809602,2750468,2750471,2750470,45763716)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 7 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2756407,40757106,2743257,4230370,4030107,42872673,2108640,2103867,2756413,2740455,2830031,2756411,2740654,2768119,4287693,2743253,2760818)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2756407,40757106,2743257,4230370,4030107,42872673,2108640,2103867,2756413,2740455,2830031,2756411,2740654,2768119,4287693,2743253,2760818)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4082511)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4082511)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 8 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4300662,37016858,2003511,4120657,4031312,3657454,40487933,2747550,4030825)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4300662,37016858,2003511,4120657,4031312,40487933,2747550,4030825)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 9 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4298492,42732580,2740664,709956,2106890,4183741,2106891,4001562,709957)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4298492,42732580,2740664,709956,2106890,4183741,2106891,4001562,709957)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4234296,2763264,2763266,2763268,2763270,2763272,2763274,2751611,2780053,2780047,2780049,2780051,2763511,2763513,2763515,2728681,2728685,2766256,2766258,2766260,2763505,2763507,2763509,2728675,2728679,2766062,2766064,2766254,2763258,2763260,2763262)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4234296,2763264,2763266,2763268,2763270,2763272,2763274,2751611,2780053,2780047,2780049,2780051,2763511,2763513,2763515,2728681,2728685,2766256,2766258,2766260,2763505,2763507,2763509,2728675,2728679,2766062,2766064,2766254,2763258,2763260,2763262)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 10 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4203442,4125173,4135711)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4203442,4125173,4135711)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2746542,2746544,2746744,2746746,2746748,2746761,2746764,2746767,2746775,2746777,2746779,2746781,2746783,2746770,2746773,40489317,4300428,40483561,2003007,2752616,2752614,2752615,2752613,2003010,2003011,4134717,4177704,4002561,4026223,4146637,4029794,46272750,4035460,4189182,4195720,4135441,4145224,4085962,2109125,4227266,4131793,4128858,4248145,4255046,4002067)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2746542,2746544,2746744,2746746,2746748,2746761,2746764,2746767,2746775,2746777,2746779,2746781,2746783,2746770,2746773,40489317,4300428,40483561,2003007,2752616,2752614,2752615,2752613,2003010,2003011,4134717,4177704,4002561,4026223,4146637,4029794,46272750,4035460,4189182,4195720,4135441,4145224,4085962,2109125,4227266,4131793,4128858,4248145,4255046,4002067)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 11 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4141456)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4141456)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2109399,4301125,4209155,43531475,4187901,4144801,4163526,4068985,4168628,4125323,4124311,4000607)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2109399,4301125,4209155,43531475,4187901,4144801,4163526,4068985,4168628,4125323,4124311,4000607)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 13 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4229447)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4229447)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (46271049,4171723,4179713,2834555,1532239,2834558,2731451,2731202,2731182,2731431,2731222,2731450,2731201,2731181,2731430,2731221,2731449,2731200,2731180,2731429,2731220,2730691,2730690,2730689)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (46271049,4171723,4179713,2834555,1532239,2834558,2731451,2731202,2731182,2731431,2731222,2731450,2731201,2731181,2731430,2731221,2731449,2731200,2731180,2731429,2731220,2730691,2730690,2730689)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 14 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4120425)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4120425)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2108469,2108467,2108468,2108470,4208330)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2108469,2108467,2108468,2108470,4208330)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 16 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4315036,4286744,43531416)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4315036,4286744,43531416)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 17 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4219032,2784238)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4219032,2784238)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4108565,4001881,2898477,2858316,2819710,2845173,2884902,2898476,2827764,2805054,2799835,2858448,2827763,2871786,2884903,2827765,2840512,2879559,2819711,2871787,2858449,2892601,2866620,2884904,2898478,2898479,2892602,2827766,2819712,2852773,2805055,2845174,2827762,2852772,2871785,2884901,2858315,2852771)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4108565,4001881,2898477,2858316,2819710,2845173,2884902,2898476,2827764,2805054,2799835,2858448,2827763,2871786,2884903,2827765,2840512,2879559,2819711,2871787,2858449,2892601,2866620,2884904,2898478,2898479,2892602,2827766,2819712,2852773,2805055,2845174,2827762,2852772,2871785,2884901,2858315,2852771)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 19 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4071665,44808725,4096783)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4071665,44808725,4096783)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 20 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4234536,2109825,2109830,42733764,42733763,2828390)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4234536,2109825,2109830,42733764,42733763,2828390)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 22 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4000882,42742510)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4000882,42742510)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 23 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4198190,2838484)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4198190,2838484)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 24 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4125482,2870936)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4125482,2870936)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2109423,4001894,4218096,4283229,2002389)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2109423,4001894,4218096,4283229,2002389)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 25 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4137462,2109616)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4137462,2109616)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 26 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4101626)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4101626)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4232401,40490839,4343795,4243985,4080349,4296539,4069383,4182228,4284392,4121136,4042673,45887543,2103134,2103133,4265725,4136234,46273729,4230535)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4232401,40490839,4343795,4243985,4080349,4296539,4069383,4182228,4284392,4121136,4042673,45887543,2103134,2103133,4265725,4136234)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 28 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4022960,4077764,4029571,4184788,4027426,4029570)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4022960,4077764,4029571,4184788,4027426,4029570)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2773939,2773941,2773943,2773945,2773947,2773929,2773931,2773933,2773935,2773937,2773690,2773710,2773712,2773714,2773716,2773718,2773692,2773694,2773696,2773698,2773730,2773732,2773734,2773736,2773738,2773680,2773700,2773702,2773704,2773706,2773708,2773682,2773684,2773686,2773688,2773720,2773722,2773724,2773726,2773728,4124169,4181213)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2773939,2773941,2773943,2773945,2773947,2773929,2773931,2773933,2773935,2773937,2773690,2773710,2773712,2773714,2773716,2773718,2773692,2773694,2773696,2773698,2773730,2773732,2773734,2773736,2773738,2773680,2773700,2773702,2773704,2773706,2773708,2773682,2773684,2773686,2773688,2773720,2773722,2773724,2773726,2773728,4124169,4181213)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 29 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4032640,44809456,4216471,2102761,2882197,2892134,2876661,4264332,4216472,2102759,2102773)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4032640,44809456,4216471,2102761,2882197,2892134,2876661,4264332,4216472,2102759,2102773)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2817090,2799340,2804489,2895018,2825110,2868700,2812597,2895017,2863515,2842056,2876662,2895016,2757512,2757506,2757509,2757514,2757492,2757495,2757478,2757481,2757513,2757498,2757500,2757499,2757484,2757486,2757485)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2817090,2799340,2804489,2895018,2825110,2868700,2812597,2895017,2863515,2842056,2876662,2895016,2757512,2757506,2757509,2757514,2757492,2757495,2757478,2757481,2757513,2757498,2757500,2757499,2757484,2757486,2757485)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 30 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4030148)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4030148)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2750721,2750723,2750725,2750727,2750729,2746795,2746797,2746799,2746801,2746803,2747019,2747021,2747023,2747025,2747027,2747009,2747011,2747013,2747015,2747017,2746805,2746807,2746809,2747005,2747007,2746785,2746787,2746789,2746791,2746793,4281511)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2750721,2750723,2750725,2750727,2750729,2746795,2746797,2746799,2746801,2746803,2747019,2747021,2747023,2747025,2747027,2747009,2747011,2747013,2747015,2747017,2746805,2746807,2746809,2747005,2747007,2746785,2746787,2746789,2746791,2746793,4281511)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 31 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4242997,2824255,2722216,2722215,2722214)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4242997,2824255,2722216,2722215,2722214)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4098273,2803648,2109326,2109328,2109327,2753514,2753515,2753517)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4098273,2803648,2109326,2109328,2109327,2753514,2753515,2753517)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 32 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2865768,2105103,43531648,2105102,2878796,4058591)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2865768,2105103,43531648,2105102,2878796,4058591)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (35622753,35622754,1532246,43019637,43018700,1532947,1532681,1531672,1531679)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (35622753,35622754,1532246,43019637,43018700,1532947,1532681,1531672,1531679)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 33 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4306298,4023403,2858766,2899081,2899079,2885531,2004229)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4306298,4023403,2858766,2899081,2899079,2885531,2004229)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4119976,4262433,4074426)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4119976,4262433,4074426)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 34 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2005882,2860039,4134857,2865770,2891748,2886663,2865764,2824740,4321450,4090926,2886683,2832272)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2005882,2860039,4134857,2865770,2891748,2886663,2865764,2824740,4321450,4090926,2886683,2832272)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4090926,35625794)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4090926,35625794)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 35 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4236715,2796700)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4236715,2796700)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2107597,2730468,2730221,2730448,2730428,2730673,2730427,2730467,2730447,2733568,2733569,2733571,2733572,2733574,2733575,2733577,2733578,2733580,2733581,36675127,40480196,4140114,4050128,4020466,44783567,45767562,2211642,2107573,2107577,2107576,4180605)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2107597,2730468,2730221,2730448,2730428,2730673,2730427,2730467,2730447,2733568,2733569,2733571,2733572,2733574,2733575,2733577,2733578,2733580,2733581,36675127,40480196,4140114,4050128,4020466,44783567,45767562,2211642,2107573,2107577,2107576,4180605)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 36 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4187533,4299118,4139935)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4187533,4299118,4139935)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4253787,4293016,43531557,40489309,40485925,4123741,44816364,2108874,4021559,37109505,4296537,4067095,2002448,4303577,4068152,4142233,4321832,2752874,2752875,2752873,2752876,2752877,4229309,4229584,40485932,2746542,2746544,2746746,2746750,2746752,2746756,2746532,2746534,2746538,2746522,2746524,2746528,2746512,2746514,2746518,2746743,2746745,2746753,2746755,2746535,2746537,2746525,2746527,2746515,2746517,2753141,2753145,2753137,2753133,2753129,2752711,2752709,2752707,4170280,4070855)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4253787,4293016,43531557,40489309,40485925,4123741,44816364,2108874,4021559,37109505,4296537,4067095,2002448,4303577,4068152,4142233,4321832,2752874,2752875,2752873,2752876,2752877,4229309,4229584,40485932,2746542,2746544,2746746,2746750,2746752,2746756,2746532,2746534,2746538,2746522,2746524,2746528,2746512,2746514,2746518,2746743,2746745,2746753,2746755,2746535,2746537,2746525,2746527,2746515,2746517,2753141,2753145,2753137,2753133,2753129,2752711,2752709,2752707,4170280,4070855)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C;

UPDATE STATISTICS #Codesets;


SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, visit_occurrence_id
INTO #qualified_events
FROM 
(
  select pe.event_id, pe.person_id, pe.start_date, pe.end_date, pe.op_start_date, pe.op_end_date, row_number() over (partition by pe.person_id order by pe.start_date ASC) as ordinal, cast(pe.visit_occurrence_id as bigint) as visit_occurrence_id
  FROM (-- Begin Primary Events
select P.ordinal as event_id, P.person_id, P.start_date, P.end_date, op_start_date, op_end_date, cast(P.visit_occurrence_id as bigint) as visit_occurrence_id
FROM
(
  select E.person_id, E.start_date, E.end_date,
         row_number() OVER (PARTITION BY E.person_id ORDER BY E.sort_date ASC, E.event_id) ordinal,
         OP.observation_period_start_date as op_start_date, OP.observation_period_end_date as op_end_date, cast(E.visit_occurrence_id as bigint) as visit_occurrence_id
  FROM 
  (
  -- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 0)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 1)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 2)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 3)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 4)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 5)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 35)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 7)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 8)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 9)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 10)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 11)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 36)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 13)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 14)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 34)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 16)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 17)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 33)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 19)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 20)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 32)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 22)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 23)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 24)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 25)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 26)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 31)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 28)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 29)
) C


-- End Procedure Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.start_date, C.end_date,
       C.visit_occurrence_id, C.start_date as sort_date
from 
(
  select po.person_id,po.procedure_occurrence_id,po.procedure_concept_id,po.visit_occurrence_id,po.quantity,po.procedure_date as start_date, DATEADD(day,1,po.procedure_date) as end_date 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 30)
) C


-- End Procedure Occurrence Criteria

  ) E
	JOIN @cdm_database_schema.observation_period OP on E.person_id = OP.person_id and E.start_date >=  OP.observation_period_start_date and E.start_date <= op.observation_period_end_date
  WHERE DATEADD(day,365,OP.OBSERVATION_PERIOD_START_DATE) <= E.START_DATE AND DATEADD(day,0,E.START_DATE) <= OP.OBSERVATION_PERIOD_END_DATE
) P

-- End Primary Events
) pe
  
) QE

;

--- Inclusion Rule Inserts

select 0 as inclusion_rule_id, person_id, event_id
INTO #Inclusion_0
FROM 
(
  select pe.person_id, pe.event_id
  FROM #qualified_events pe
  
JOIN (
-- Begin Criteria Group
select 0 as index_id, person_id, event_id
FROM
(
  select E.person_id, E.event_id 
  FROM #qualified_events E
  INNER JOIN
  (
    -- Begin Demographic Criteria
SELECT 0 as index_id, e.person_id, e.event_id
FROM #qualified_events E
JOIN @cdm_database_schema.PERSON P ON P.PERSON_ID = E.PERSON_ID
WHERE YEAR(E.start_date) - P.year_of_birth >= 18
GROUP BY e.person_id, e.event_id
-- End Demographic Criteria

  ) CQ on E.person_id = CQ.person_id and E.event_id = CQ.event_id
  GROUP BY E.person_id, E.event_id
  HAVING COUNT(index_id) = 1
) G
-- End Criteria Group
) AC on AC.person_id = pe.person_id AND AC.event_id = pe.event_id
) Results
;

SELECT inclusion_rule_id, person_id, event_id
INTO #inclusion_events
FROM (select inclusion_rule_id, person_id, event_id from #Inclusion_0) I;
TRUNCATE TABLE #Inclusion_0;
DROP TABLE #Inclusion_0;


select event_id, person_id, start_date, end_date, op_start_date, op_end_date
into #included_events
FROM (
  SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, row_number() over (partition by person_id order by start_date ASC) as ordinal
  from
  (
    select Q.event_id, Q.person_id, Q.start_date, Q.end_date, Q.op_start_date, Q.op_end_date, SUM(coalesce(POWER(cast(2 as bigint), I.inclusion_rule_id), 0)) as inclusion_rule_mask
    from #qualified_events Q
    LEFT JOIN #inclusion_events I on I.person_id = Q.person_id and I.event_id = Q.event_id
    GROUP BY Q.event_id, Q.person_id, Q.start_date, Q.end_date, Q.op_start_date, Q.op_end_date
  ) MG -- matching groups

  -- the matching group with all bits set ( POWER(2,# of inclusion rules) - 1 = inclusion_rule_mask
  WHERE (MG.inclusion_rule_mask = POWER(cast(2 as bigint),1)-1)

) Results
WHERE Results.ordinal = 1
;

-- date offset strategy

select event_id, person_id, 
  case when DATEADD(day,1,start_date) > op_end_date then op_end_date else DATEADD(day,1,start_date) end as end_date
INTO #strategy_ends
from #included_events;


-- generate cohort periods into #final_cohort
select person_id, start_date, end_date
INTO #cohort_rows
from ( -- first_ends
	select F.person_id, F.start_date, F.end_date
	FROM (
	  select I.event_id, I.person_id, I.start_date, CE.end_date, row_number() over (partition by I.person_id, I.event_id order by CE.end_date) as ordinal
	  from #included_events I
	  join ( -- cohort_ends
-- cohort exit dates
-- End Date Strategy
SELECT event_id, person_id, end_date from #strategy_ends

    ) CE on I.event_id = CE.event_id and I.person_id = CE.person_id and CE.end_date >= I.start_date
	) F
	WHERE F.ordinal = 1
) FE;

select person_id, min(start_date) as start_date, end_date
into #final_cohort
from ( --cteEnds
	SELECT
		 c.person_id
		, c.start_date
		, MIN(ed.end_date) AS end_date
	FROM #cohort_rows c
	JOIN ( -- cteEndDates
    SELECT
      person_id
      , DATEADD(day,-1 * 0, event_date)  as end_date
    FROM
    (
      SELECT
        person_id
        , event_date
        , event_type
        , SUM(event_type) OVER (PARTITION BY person_id ORDER BY event_date, event_type ROWS UNBOUNDED PRECEDING) AS interval_status
      FROM
      (
        SELECT
          person_id
          , start_date AS event_date
          , -1 AS event_type
        FROM #cohort_rows

        UNION ALL


        SELECT
          person_id
          , DATEADD(day,0,end_date) as end_date
          , 1 AS event_type
        FROM #cohort_rows
      ) RAWDATA
    ) e
    WHERE interval_status = 0
  ) ed ON c.person_id = ed.person_id AND ed.end_date >= c.start_date
	GROUP BY c.person_id, c.start_date
) e
group by person_id, end_date
;

DELETE FROM @target_database_schema.@target_cohort_table where cohort_definition_id = @target_cohort_id;
INSERT INTO @target_database_schema.@target_cohort_table (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date)
select @target_cohort_id as cohort_definition_id, person_id, start_date, end_date 
FROM #final_cohort CO
;


-- BEGIN: Censored Stats

delete from @results_database_schema.cohort_censor_stats where cohort_definition_id = @target_cohort_id;

-- END: Censored Stats



-- Create a temp table of inclusion rule rows for joining in the inclusion rule impact analysis

select cast(rule_sequence as int) as rule_sequence
into #inclusion_rules
from (
  SELECT CAST(0 as int) as rule_sequence
) IR;


-- Find the event that is the 'best match' per person.  
-- the 'best match' is defined as the event that satisfies the most inclusion rules.
-- ties are solved by choosing the event that matches the earliest inclusion rule, and then earliest.

select q.person_id, q.event_id
into #best_events
from #qualified_events Q
join (
	SELECT R.person_id, R.event_id, ROW_NUMBER() OVER (PARTITION BY R.person_id ORDER BY R.rule_count DESC,R.min_rule_id ASC, R.start_date ASC) AS rank_value
	FROM (
		SELECT Q.person_id, Q.event_id, COALESCE(COUNT(DISTINCT I.inclusion_rule_id), 0) AS rule_count, COALESCE(MIN(I.inclusion_rule_id), 0) AS min_rule_id, Q.start_date
		FROM #qualified_events Q
		LEFT JOIN #inclusion_events I ON q.person_id = i.person_id AND q.event_id = i.event_id
		GROUP BY Q.person_id, Q.event_id, Q.start_date
	) R
) ranked on Q.person_id = ranked.person_id and Q.event_id = ranked.event_id
WHERE ranked.rank_value = 1
;

-- modes of generation: (the same tables store the results for the different modes, identified by the mode_id column)
-- 0: all events
-- 1: best event


-- BEGIN: Inclusion Impact Analysis - event
-- calculte matching group counts
delete from @results_database_schema.cohort_inclusion_result where cohort_definition_id = @target_cohort_id and mode_id = 0;
insert into @results_database_schema.cohort_inclusion_result (cohort_definition_id, inclusion_rule_mask, person_count, mode_id)
select @target_cohort_id as cohort_definition_id, inclusion_rule_mask, count_big(*) as person_count, 0 as mode_id
from
(
  select Q.person_id, Q.event_id, CAST(SUM(coalesce(POWER(cast(2 as bigint), I.inclusion_rule_id), 0)) AS bigint) as inclusion_rule_mask
  from #qualified_events Q
  LEFT JOIN #inclusion_events I on q.person_id = i.person_id and q.event_id = i.event_id
  GROUP BY Q.person_id, Q.event_id
) MG -- matching groups
group by inclusion_rule_mask
;

-- calculate gain counts 
delete from @results_database_schema.cohort_inclusion_stats where cohort_definition_id = @target_cohort_id and mode_id = 0;
insert into @results_database_schema.cohort_inclusion_stats (cohort_definition_id, rule_sequence, person_count, gain_count, person_total, mode_id)
select @target_cohort_id as cohort_definition_id, ir.rule_sequence, coalesce(T.person_count, 0) as person_count, coalesce(SR.person_count, 0) gain_count, EventTotal.total, 0 as mode_id
from #inclusion_rules ir
left join
(
  select i.inclusion_rule_id, count_big(i.event_id) as person_count
  from #qualified_events Q
  JOIN #inclusion_events i on Q.person_id = I.person_id and Q.event_id = i.event_id
  group by i.inclusion_rule_id
) T on ir.rule_sequence = T.inclusion_rule_id
CROSS JOIN (select count(*) as total_rules from #inclusion_rules) RuleTotal
CROSS JOIN (select count_big(event_id) as total from #qualified_events) EventTotal
LEFT JOIN @results_database_schema.cohort_inclusion_result SR on SR.mode_id = 0 AND SR.cohort_definition_id = @target_cohort_id AND (POWER(cast(2 as bigint),RuleTotal.total_rules) - POWER(cast(2 as bigint),ir.rule_sequence) - 1) = SR.inclusion_rule_mask -- POWER(2,rule count) - POWER(2,rule sequence) - 1 is the mask for 'all except this rule'
;

-- calculate totals
delete from @results_database_schema.cohort_summary_stats where cohort_definition_id = @target_cohort_id and mode_id = 0;
insert into @results_database_schema.cohort_summary_stats (cohort_definition_id, base_count, final_count, mode_id)
select @target_cohort_id as cohort_definition_id, PC.total as person_count, coalesce(FC.total, 0) as final_count, 0 as mode_id
FROM
(select count_big(event_id) as total from #qualified_events) PC,
(select sum(sr.person_count) as total
  from @results_database_schema.cohort_inclusion_result sr
  CROSS JOIN (select count(*) as total_rules from #inclusion_rules) RuleTotal
  where sr.mode_id = 0 and sr.cohort_definition_id = @target_cohort_id and sr.inclusion_rule_mask = POWER(cast(2 as bigint),RuleTotal.total_rules)-1
) FC
;

-- END: Inclusion Impact Analysis - event

-- BEGIN: Inclusion Impact Analysis - person
-- calculte matching group counts
delete from @results_database_schema.cohort_inclusion_result where cohort_definition_id = @target_cohort_id and mode_id = 1;
insert into @results_database_schema.cohort_inclusion_result (cohort_definition_id, inclusion_rule_mask, person_count, mode_id)
select @target_cohort_id as cohort_definition_id, inclusion_rule_mask, count_big(*) as person_count, 1 as mode_id
from
(
  select Q.person_id, Q.event_id, CAST(SUM(coalesce(POWER(cast(2 as bigint), I.inclusion_rule_id), 0)) AS bigint) as inclusion_rule_mask
  from #best_events Q
  LEFT JOIN #inclusion_events I on q.person_id = i.person_id and q.event_id = i.event_id
  GROUP BY Q.person_id, Q.event_id
) MG -- matching groups
group by inclusion_rule_mask
;

-- calculate gain counts 
delete from @results_database_schema.cohort_inclusion_stats where cohort_definition_id = @target_cohort_id and mode_id = 1;
insert into @results_database_schema.cohort_inclusion_stats (cohort_definition_id, rule_sequence, person_count, gain_count, person_total, mode_id)
select @target_cohort_id as cohort_definition_id, ir.rule_sequence, coalesce(T.person_count, 0) as person_count, coalesce(SR.person_count, 0) gain_count, EventTotal.total, 1 as mode_id
from #inclusion_rules ir
left join
(
  select i.inclusion_rule_id, count_big(i.event_id) as person_count
  from #best_events Q
  JOIN #inclusion_events i on Q.person_id = I.person_id and Q.event_id = i.event_id
  group by i.inclusion_rule_id
) T on ir.rule_sequence = T.inclusion_rule_id
CROSS JOIN (select count(*) as total_rules from #inclusion_rules) RuleTotal
CROSS JOIN (select count_big(event_id) as total from #best_events) EventTotal
LEFT JOIN @results_database_schema.cohort_inclusion_result SR on SR.mode_id = 1 AND SR.cohort_definition_id = @target_cohort_id AND (POWER(cast(2 as bigint),RuleTotal.total_rules) - POWER(cast(2 as bigint),ir.rule_sequence) - 1) = SR.inclusion_rule_mask -- POWER(2,rule count) - POWER(2,rule sequence) - 1 is the mask for 'all except this rule'
;

-- calculate totals
delete from @results_database_schema.cohort_summary_stats where cohort_definition_id = @target_cohort_id and mode_id = 1;
insert into @results_database_schema.cohort_summary_stats (cohort_definition_id, base_count, final_count, mode_id)
select @target_cohort_id as cohort_definition_id, PC.total as person_count, coalesce(FC.total, 0) as final_count, 1 as mode_id
FROM
(select count_big(event_id) as total from #best_events) PC,
(select sum(sr.person_count) as total
  from @results_database_schema.cohort_inclusion_result sr
  CROSS JOIN (select count(*) as total_rules from #inclusion_rules) RuleTotal
  where sr.mode_id = 1 and sr.cohort_definition_id = @target_cohort_id and sr.inclusion_rule_mask = POWER(cast(2 as bigint),RuleTotal.total_rules)-1
) FC
;

-- END: Inclusion Impact Analysis - person

TRUNCATE TABLE #best_events;
DROP TABLE #best_events;

TRUNCATE TABLE #inclusion_rules;
DROP TABLE #inclusion_rules;


TRUNCATE TABLE #strategy_ends;
DROP TABLE #strategy_ends;


TRUNCATE TABLE #cohort_rows;
DROP TABLE #cohort_rows;

TRUNCATE TABLE #final_cohort;
DROP TABLE #final_cohort;

TRUNCATE TABLE #inclusion_events;
DROP TABLE #inclusion_events;

TRUNCATE TABLE #qualified_events;
DROP TABLE #qualified_events;

TRUNCATE TABLE #included_events;
DROP TABLE #included_events;

TRUNCATE TABLE #Codesets;
DROP TABLE #Codesets;
