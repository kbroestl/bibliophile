# 2018-07-01

Upon updating mysql to v.8 via homebrew, the db appears to have gone south.
'cannot connect via socket' errors of various kinds when accessing via the CLI.
Ruby cannot compile the mysql2 gem to work with the latest version, either,
from the looks of things.

I've downgraded the system mysql to v.5.7, using the homebrew notation @57, but
that changes paths to various libraries, meaning that stock bundling no longer
is able to find the necessary mysql libs.

Good-ish news is that it does appear that the database is still healthy, and latest
data appears to be preserved. Several tables (innodb tables) have been corrupted.
However, re-creation of the data should be relatively easy. These tables are
things like locations, languages, genres, etc.

## Ways forward
- research ways to mysqldump only specific tables from a database, since we are unable to drop the corrupted innodb tables
- confirm that the mysql2 bindings/gem cannot be built in the current state for mysql
v.8
- Look into possibilities for containerization? Docker container for the mysql
chunk, but then what do we do about data-persistence?
- Discover ways to set mysql_location compile-time variables via Gemfile and
bundler?
- Continue to press forward with upgrades to Rails to get the app beyond
3-series?
- Abandon mysql in favor of other dbms
-- this has the complication that many of the methods, specifically on the Book
model are not database agnostic, so we'll have to investigate what can be done
to do those. Lots of 'find_by_sql'
