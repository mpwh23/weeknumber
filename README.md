*.bat file to return number of curent week
(ISO8601 | european and asian rules)

TODO:
ISO 8601:
  D1 = MON
  weeks with 3 days at the end or begining of the year are getting old/new number

US:
  D1 = SUN, count every week, regardless of length
 
1.1.1988 -> FR
1.1.0001 -> Sat
1.1.2001 -> Mon
1.1.2008 -> Tue

add ISO and US system