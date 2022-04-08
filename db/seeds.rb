# Below will be uncommented if I decide to use an API during this project
require "net/http"
require "uri"
require "json"
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

# Output absolute path of the specified file adn store into variable
arabica_path = Rails.root.join("db/coffee_csv/arabica.csv")
robusta_path = Rails.root.join("db/coffee_csv/robusta.csv")
brands_path = Rails.root.join("db/coffee_csv/brands.csv")
grinds_path = Rails.root.join("db/coffee_csv/grinds.csv")

# Return all contents of csv and store into variable
arabica_data = File.read(arabica_path)
robusta_data = File.read(robusta_path)
brands_data = File.read(brands_path)
grinds_data = File.read(grinds_path)

# Parse out data row by row in the csv file
arabica = CSV.parse(arabica_data, headers: true, encoding: "utf-8")
robusta = CSV.parse(robusta_data, headers: true, encoding: "utf-8")
brands = CSV.parse(brands_data, headers: true, encoding: "utf-8")
grinds = CSV.parse(grinds_data, headers: true, encoding: "utf-8")

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
