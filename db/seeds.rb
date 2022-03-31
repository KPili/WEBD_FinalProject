# Below will be uncommented if I decide to use an API during this project
# require "net/http"
# require "uri"
# require "json"

# Reset Database
Job.destroy_all
GrindType.destroy_all
Species.destroy_all

puts "*** Table Contents Deleted ***"

# Reset PK to 1 for all tables
Job.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'jobs")
GrindType.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'grind_types")
Species.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'species'")

puts "*** Primary Key auto-incrementing value reset to 1 ***"
