# Ranges of readings

Answer the question: what was I reading on #{date}

Ideally, we could give it a year, and the response would be any book which had an open reading during that year.

E.G:
- Book one, started Feb 2 2020, completed Feb 15 2020 included
- Book two, started Dec 10 2019, completed March 30 2020 included
- Book three, started June 15th, 2020, completed March 2021 included
- Book four, started Nov 2019, completed march 2021 included (neither start date or end date in the year requested)
- Book five, started Jan 2021, completed March 2021, excluded (everthing is outside the range)

Doing Sql works (kinda)
``rdngs = Reading.where(date_started: 30.days.ago..Date.today())`` works
``rdngs = Reading.where('"2022-01-01" < date_started and date_finished > "2021-01-01"')`` works
