;;;; toc.lisp
;;;; Contains what is essentially "static" information, a Table of
;;;; Contents to the Standard Works, in a human-optimized form. This
;;;; is intended to be processed by massage.lisp before use.
("Standard Works"
 :abbr "sw" :url "scriptures" :virtual
 (("Old Testament"
   :abbr "ot" :url "ot" :virtual
   (("Genesis"
     :abbr "Gen." :url "gen"
     (31 25 24 26 32 22 24 22 29 32
         32 20 18 24 21 16 27 33 38 18
         34 24 20 67 34 35 46 22 35 43
         55 32 20 31 29 43 36 30 23 23
         57 38 34 34 28 34 31 22 33 26))
    ("Exodus"
     :abbr "Ex." :url "ex"
     (22 25 22 31 23 30 25 32 35 29
         10 51 22 31 27 36 16 27 25 26
         36 31 33 18 40 37 21 43 46 38
         18 35 23 35 35 38 29 31 43 38))
    ("Leviticus"
     :abbr "Lev." :url "lev"
     (17 16 17 35 19 30 38 36 24 20
         47 08 59 57 33 34 16 30 37 27
         24 33 44 23 55 46 34))
    ("Numbers"
     :abbr "Num." :url "num"
     (54 34 51 49 31 27 89 26 23 36
         35 16 33 45 41 50 13 32 22 29
         35 41 30 25 18 65 23 31 40 16
         54 42 56 29 34 13))
    ("Deuteronomy"
     :abbr "Deut." :url "deut"
     (46 37 29 49 33 25 26 20 29 22
         32 32 18 29 23 22 20 22 21 20
         23 30 25 22 19 19 26 68 29 20
         30 52 29 12))
    ("Joshua"
     :abbr "Josh." :url "josh"
     (18 24 17 24 15 27 26 35 27 43
         23 24 33 15 63 10 18 28 51 09
         45 34 16 33))
    ("Judges"
     :abbr "Judg." :url "judg"
     (36 23 31 24 31 40 25 35 57 18
         40 15 25 20 20 31 13 31 30 48
         25))
    ("Ruth"
     :abbr "Ruth" :url "ruth"
     (22 23 18 22))
    ("1 Samuel"
     :abbr "1 Sam." :url "1-sam"
     (28 36 21 22 12 21 17 22 27 27
         15 25 23 52 35 23 58 30 24 42
         15 23 29 22 44 25 12 25 11 31
         13))
    ("2 Samuel"
     :abbr "2 Sam." :url "2-sam"
     (27 32 39 12 25 23 29 18 13 19
         27 31 39 33 37 23 29 33 43 26
         22 51 39 25))
    ("1 Kings"
     :abbr "1 Kgs." :url "1-kgs"
     (53 46 28 34 18 38 51 66 28 29
         43 33 34 31 34 34 24 46 21 43
         29 53))
    ("2 Kings"
     :abbr "2 Kgs." :url "2-kgs"
     (18 25 27 44 27 33 20 29 37 36
         21 21 25 29 38 20 41 37 37 21
         26 20 37 20 30))
    ("1 Chronicles"
     :abbr "1 Chr." :url "1-chr"
     (54 55 24 43 26 81 40 40 44 14
         47 40 14 17 29 43 27 17 19 08
         30 19 32 31 31 32 34 21 30))
    ("2 Chronicles"
     :abbr "2 Chr." :url "2-chr"
     (17 18 17 22 14 42 22 18 31 19
         23 16 22 15 19 14 19 34 11 37
         20 12 21 27 28 23 09 27 36 27
         21 33 25 33 27 23))
    ("Ezra"
     :abbr "Ezra" :url "ezra"
     (11 70 13 24 17 22 28 36 15 44))
    ("Nehemiah"
     :abbr "Neh." :url "neh"
     (11 20 32 23 19 19 73 18 38 39
         36 47 31))
    ("Esther"
     :abbr "Esth." :url "esth"
     (22 23 15 17 14 14 10 17 32 10))
    ("Job"
     :abbr "Job" :url "job"
     (22 13 26 21 27 30 21 22 35 22
         20 25 28 22 35 22 16 21 29 29
         34 30 17 25 06 14 23 28 25 31
         40 22 33 37 16 33 24 41 30 34
         34 17))
    ("Psalms"
     :abbr "Ps." :url "ps"
     (06 12 08 08 12 10 17 09 20 18
         07 08 06 07 05 11 15 50 14 09
         13 31 06 10 22 12 14 09 11 12
         24 11 22 22 28 12 40 22 13 17
         13 11 05 26 17 11 09 14 20 23
         19 09 06 07 23 13 11 11 17 12
         08 12 11 10 13 20 07 35 36 05
         24 20 28 23 10 12 20 72 13 19
         16 08 18 12 13 17 07 18 52 17
         16 15 05 23 11 13 12 09 09 05
         08 28 22 35 45 48 43 13 31 07
         ;; NOTE The structure of Psalm 119 is unusual.
         10 10 09 08 18 19 02 29 176 7
         08 09 04 08 05 06 05 06 08 08
         03 18 03 03 21 26 09 08 24 13
         10 07 12 15 21 10 20 14 09 06))
    ("Proverbs"
     :abbr "Prov." :url "prov"
     (33 22 35 27 23 35 27 36 18 32
         31 28 25 35 33 33 28 24 29 30
         31 29 35 34 28 28 27 28 27 33
         31))
    ("Ecclesiastes"
     :abbr "Eccl." :url "eccl"
     (18 26 22 16 20 12 29 17 18 20
         10 14))
    ("Song of Solomon"
     :abbr "Song" :url "song"
     (17 17 11 16 16 13 13 14))
    ("Isaiah"
     :abbr "Isa." :url "isa"
     (31 22 26 06 30 13 25 22 21 34
         16 06 22 32 09 14 14 07 25 06
         17 25 18 23 12 21 13 29 24 33
         09 20 24 17 10 22 38 22 08 31
         29 25 28 28 25 13 15 22 26 11
         23 15 12 17 13 12 21 14 21 22
         11 12 19 12 25 24))
    ("Jeremiah"
     :abbr "Jer." :url "jer"
     (19 37 25 31 31 30 34 22 26 25
         23 17 27 22 21 21 27 23 15 18
         14 30 40 10 38 24 22 17 32 24
         40 44 26 22 19 32 21 28 18 16
         18 22 13 30 05 28 07 47 39 46
         64 34))
    ("Lamentations"
     :abbr "Lam." :url "lam"
     (22 22 66 22 22))
    ("Ezekiel"
     :abbr "Ezek." :url "ezek"
     (28 10 27 17 17 14 27 18 11 22
         25 28 23 23 08 63 24 32 14 49
         32 31 49 27 17 21 36 26 21 26
         18 32 33 31 15 38 28 23 29 49
         26 20 27 31 25 24 23 35))
    ("Daniel"
     :abbr "Dan." :url "dan"
     (21 49 30 37 31 28 28 27 27 21
         45 13))
    ("Hosea"
     :abbr "Hosea" :url "hosea"
     (11 23 05 19 15 11 16 14 17 15
         12 14 16 09))
    ("Joel"
     :abbr "Joel" :url "joel"
     (20 32 21))
    ("Amos"
     :abbr "Amos" :url "amos"
     (15 16 15 13 27 14 17 14 15))
    ("Obadiah"
     :abbr "Obad." :url "obad"
     (21))
    ("Jonah"
     :abbr "Jonah" :url "jonah"
     (17 10 10 11))
    ("Micah"
     :abbr "Micah" :url "micah"
     (16 13 12 13 15 16 20))
    ("Nahum"
     :abbr "Nahum" :url "nahum"
     (15 13 19))
    ("Habakkuk"
     :abbr "Hab." :url "hab"
     (17 20 19))
    ("Zephaniah"
     :abbr "Zeph." :url "zeph"
     (18 15 20))
    ("Haggai"
     :abbr "Hag" :url "hag"
     (15 23))
    ("Zechariah"
     :abbr "Zech." :url "zech"
     (21 13 10 14 11 15 14 23 17 12
         17 14 09 21))
    ("Malachi"
     :abbr "Mal." :url "mal"
     (14 17 18 06))))
  ("New Testament"
   :abbr "nt" :url "nt" :virtual
   (("Matthew"
     :abbr "Matt." :url "matt"
     (25 23 17 25 48 34 29 34 38 42
         30 50 58 36 39 28 27 35 30 34
         46 46 39 51 46 75 66 20))
    ("Mark"
     :abbr "Mark" :url "mark"
     (45 28 35 41 43 56 37 38 50 52
         33 44 37 72 47 20))
    ("Luke"
     :abbr "Luke" :url "luke"
     (80 52 38 44 39 49 50 56 62 42
         54 59 35 35 32 31 37 43 48 47
         38 71 56 53))
    ("John"
     :abbr "John" :url "john"
     (51 25 36 54 47 71 53 59 41 42
         57 50 38 31 27 33 26 40 42 31
         25))
    ("Acts"
     :abbr "Acts" :url "acts"
     (26 47 26 37 42 15 60 40 43 48
         30 25 52 28 41 40 34 28 41 38
         40 30 35 27 27 32 44 31))
    ("Romans"
     :abbr "Rom." :url "rom"
     (32 29 31 25 21 23 25 39 33 21
         36 21 14 23 33 27))
    ("1 Corinthians"
     :abbr "1 Cor." :url "1-cor"
     (31 16 23 21 13 20 40 13 27 33
         34 31 13 40 58 24))
    ("2 Corinthians"
     :abbr "2 Cor" :url "2-cor"
     (24 17 18 18 21 18 16 24 15 18
         33 21 14))
    ("Galatians"
     :abbr "Gal." :url "gal"
     (24 21 29 31 26 18))
    ("Ephesians"
     :abbr "Eph." :url "eph"
     (23 22 21 32 33 24))
    ("Philippians"
     :abbr "Philip." :url "philip"
     (30 30 21 23))
    ("Colossians"
     :abbr "Col." :url "col"
     (29 23 25 18))
    ("1 Thessalonians"
     :abbr "1 Thes." :url "1-thes"
     (10 20 13 18 28))
    ("2 Thessalonians"
     :abbr "2 Thes." :url "2-thes"
     (12 17 18))
    ("1 Timothy"
     :abbr "1 Tim." :url "1-tim"
     (20 15 16 16 25 21))
    ("2 Timothy"
     :abbr "2 Tim." :url "2-tim"
     (18 26 17 22))
    ("Titus"
     :abbr "Titus" :url "titus"
     (16 15 15))
    ("Philemon"
     :abbr "Philem." :url "philem"
     (25))
    ("Hebrews"
     :abbr "Heb." :url "heb"
     (14 18 19 16 14 20 28 13 28 39
         40 29 25))
    ("James"
     :abbr "James" :url "james"
     (27 26 18 17 20))
    ("1 Peter"
     :abbr "1 Pet." :url "1-pet"
     (25 25 22 19 14))
    ("2 Peter"
     :abbr "2 Pet." :url "2-pet"
     (21 22 18))
    ("1 John"
     :abbr "1 Jn." :url "1-jn"
     (10 29 24 21 21))
    ("2 John"
     :abbr "2 Jn." :url "2-jn"
     (13))
    ("3 John"
     :abbr "3 Jn." :url "3-jn"
     (14))
    ("Jude"
     :abbr "Jude" :url "jude"
     (25))
    ("Revelation"
     :abbr "Rev." :url "rev"
     (20 29 22 11 14 17 17 13 21 11
         19 17 18 20 08 21 18 24 21 15
         27 21))))
  ("Book of Mormon"
   :abbr "bofm" :url "bofm" :virtual
   (("1 Nephi"
     :abbr "1 Ne." :url "1-ne"
     (20 24 31 38 22 06 22 38 06 22
         36 23 42 30 36 39 55 25 24 22
         26 31))
    ("2 Nephi"
     :abbr "2 Ne." :url "2-ne"
     (32 30 25 35 34 18 11 25 54 25
         08 22 26 06 30 13 25 22 21 34
         16 06 22 32 30 33 35 32 14 18
         21 09 15))
    ("Jacob"
     :abbr "Jacob" :url "jacob"
     (19 35 14 18 77 13 27))
    ("Enos"
     :abbr "Enos" :url "enos"
     (27))
    ("Jarom"
     :abbr "Jarom" :url "jarom"
     (15))
    ("Omni"
     :abbr "Omni" :url "omni"
     (30))
    ("Words of Mormon"
     :abbr "W of M" :url "w-of-m"
     (18))
    ("Mosiah"
     :abbr "Mosiah" :url "mosiah"
     (18 41 27 30 15 07 33 21 19 22
         29 37 35 12 31 15 20 35 29 26
         36 16 39 25 24 39 37 20 47))
    ("Alma"
     :abbr "Alma" :url "alma"
     (33 38 27 20 62 08 27 32 34 32
         46 37 31 29 19 21 39 43 36 30
         23 35 18 30 17 37 30 14 17 60
         38 43 23 41 16 30 47 15 19 26
         15 31 54 24 24 41 36 25 30 40
         37 40 23 24 35 57 36 41 13 36
         21 52 17))
    ("Helaman"
     :abbr "Hel." :url "hel"
     (34 14 37 26 52 41 29 28 41 19
         38 26 39 31 17 25))
    ("3 Nephi"
     :abbr "3 Ne." :url "3-ne"
     (30 19 26 33 26 30 26 25 22 19
         41 48 34 27 24 20 25 39 36 46
         29 17 14 18 06 21 33 40 09 02))
    ("4 Nephi"
     :abbr "4 Ne." :url "4-ne"
     (49))
    ("Mormon"
     :abbr "Morm." :url "morm"
     (19 29 22 23 24 22 10 41 37))
    ("Ether"
     :abbr "Ether" :url "ether"
     (43 25 28 19 06 30 27 26 35
         34 23 41 31 34))
    ("Moroni"
     :abbr "Moro." :url "moro"
     (04 03 04 03 02 09 48 30 26 34))))
  TODO Think through structure better.
  ("Doctrine and Covenants Virtual"
   :abbr "dcv" :url "dc-testament" :virtual
   (("Doctrine and Covenants"
     :abbr "D&C" :url "dc"
     (39 03 20 07 35 37 08 12 14 70
         30 09 01 11 06 06 09 47 41 84
         12 04 07 19 16 02 18 16 50 11
         13 05 18 12 27 08 04 42 24 03
         12 93 35 06 75 33 04 06 28 46
         20 44 07 10 06 20 16 65 24 17
         39 09 66 43 06 13 14 35 08 18
         11 26 06 07 36 119 15 22 4 05
         7 24 06 120 12 11 8 141 21 37
         06 02 53 17 17 09 28 48 08 17
         101 34 40 86 41 8 100 8 80 16
         11 34 10 02 19 01 16 06 07 01
         46 09 17 145 4 03 12 25 09 23
         08 66 74 12 07 42 10 60))
    TODO Requires further attention.
    ("Official Declaration 1"
     :abbr "OD 1" :url "od/1")
    TODO Requires further attention.
    ("Official Declaration 2"
     :abbr "OD 2" :url "od/2")))
  ("Pearl of Great Price"
   :abbr "pgp" :url "pgp" :virtual
   (("Moses"
     :abbr "Moses" :url "moses"
     (42 31 25 32 59 68 69 30))
    ("Abraham"
     :abbr "Abr." :url "abr"
     (31 25 28 31 21 TODO Add the Facsimilies
         ))
    ("Joseph Smith - Matthew"
     :abbr "JS-M" :url "js-m"
     (55))
    ("Joseph Smith - History"
     :abbr "JS-H" :url "js-h"
     (75 There are some footnotes in here.
         ))
    ("Articles of Faith"
     :abbr "A of F" :url "a-of-f"
     (13))))))
