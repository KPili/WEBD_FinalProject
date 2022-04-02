# Below will be uncommented if I decide to use an API during this project
# require "net/http"
# require "uri"
# require "json"
require "csv"

# Reset Database
# FKs
OrderHistory.destroy_all
Order.destroy_all
Province.destroy_all
Employee.destroy_all
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
Employee.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'employees'")
Province.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'provinces'")
Order.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'orders'")
OrderHistory.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'order_histories'")

puts "*** Primary Key auto-incrementing value reset to 1 ***"

# *** Propogate PK Tables ***

# Jobs
#   - Manager & Barista must exist: Will use Faker for other job roles

# Grind Types
#   - Will scrape data and use that with descriptions

# Species
#   - Will use coffee csv's

# Tax Rates
#   - Will use API + declare a dictionary/hash-map to use for traversing API

# *** Propogate FK Tables ***

# Suppliers
#   - Will use Faker

# Inventory
#   - Will use Faker

# Inventory Details
#   - Will use coffee API

# Employees
#   - Will use Faker + Instructor

# Provinces
#   - Will use dictionary/hashmap

# Orders
#   - Implement for Shopping Cart Functionality

# Order_History
#   - Implement AFTER Shopping Cart Functionality
