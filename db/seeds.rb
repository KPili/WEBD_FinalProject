# Below will be uncommented if I decide to use an API during this project
# require "net/http"
# require "uri"
# require "json"

# Reset Database
Job.destroy_all

puts "*** Table Contents Deleted ***"

# Reset PK to 1 for all tables
Job.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'jobs")

puts "*** Primary Key auto-incrementing value reset to 1 ***"
