# Below will be uncommented if I decide to use an API during this project
# require "net/http"
# require "uri"
# require "json"

# Reset Database
# FKs
InventoryDetail.destroy_all
Inventory.destroy_all
Supplier.destroy_all
# PKs
Job.destroy_all
GrindType.destroy_all
Species.destroy_all
TaxRate.destroy_all

puts "*** Table Contents Deleted ***"

# Reset PK to 1 for all tables
Job.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'jobs'")
GrindType.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'grind_types'")
Species.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'species'")
TaxRate.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'tax_rates'")
Supplier.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'suppliers'")
Inventory.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'inventories'")
InventoryDetail.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'inventory_details'")

puts "*** Primary Key auto-incrementing value reset to 1 ***"
