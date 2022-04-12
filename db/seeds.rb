# Below will be uncommented if I decide to use an API during this project
require "net/http"
require "uri"
require "json"
require "csv"

# Reset Database
# FKs
# OrderHistory.destroy_all
# Order.destroy_all
Province.destroy_all
# Employee.destroy_all
# InventoryDetail.destroy_all
# Inventory.destroy_all
# Supplier.destroy_all
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
# Supplier.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'suppliers'")
# Inventory.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'inventories'")
# InventoryDetail.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'inventory_details'")
# Employee.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'employees'")
Province.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'provinces'")
# Order.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'orders'")
# OrderHistory.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'order_histories'")

puts "*** Primary Key auto-incrementing value reset to 1 ***"

# Output absolute path of the specified file adn store into variable
# arabica_path = Rails.root.join("db/coffee_csv/arabica.csv")
# robusta_path = Rails.root.join("db/coffee_csv/robusta.csv")
# brands_path = Rails.root.join("db/coffee_csv/brands.csv")
grinds_path = Rails.root.join("db/coffee_csv/grinds.csv")

# Return all contents of csv and store into variable
# arabica_data = File.read(arabica_path)
# robusta_data = File.read(robusta_path)
# brands_data = File.read(brands_path)
grinds_data = File.read(grinds_path)

# Parse out data row by row in the csv file
# arabica = CSV.parse(arabica_data, headers: true, encoding: "utf-8")
# robusta = CSV.parse(robusta_data, headers: true, encoding: "utf-8")
# brands = CSV.parse(brands_data, headers: true, encoding: "utf-8")
grinds = CSV.parse(grinds_data, headers: true, encoding: "utf-8")

# *** Propogate PK Tables ***

# Jobs
# Hash with the only available roles at the coffee shop
coffee_shop_jobs = {
  "Manager" => "A Manager accomplishes department objectives by managing staff; planning and evaluating department activities. Maintains staff by recruiting, selecting, orienting, and training employees. Ensures a safe, secure, and legal work environment. Develops personal growth opportunities.",
  "Barista" => "A Barista is a professional who makes and serves beverages such as coffee, tea and specialty beverages. They are responsible for taking customer orders and payments. They also clean and sanitize their work areas, seating areas and equipment/tools",
  "Roaster" => "A Roaster acquires coffee beans from around the world and roasts them to obtain different taste profiles. Your job duties may include negotiating with coffee bean wholesalers or coffee farmers, roasting coffee beans, experimenting with roast levels, aroma, grind, and flavors."
}

# Propogate jobs table
coffee_shop_jobs.each do |title, desc|
  coffee_job = Job.create(
    job_title:  title,
    job_desc:   desc,
    start_date: DateTime.now
  )
end

# Grind Types
#   - Will scrape data and use that with descriptions
grinds.each do |g|
  GrindType.create(
    grind: g["coffee_grind_type"],
    desc:  g["coffee_grind_details"]
  )
end
# Species
# Array of two species of coffee found at the coffee shop
coffee_species = ["arabica", "robusta"]

# Propogate species table
coffee_species.each do |species|
  Species.create(
    name: species
  )
end

# Tax Rates + Provinces
# Will use API [https://api.salestaxapi.ca/v2/province/all] - [ab, bc, mb, nb, nl, ns, nt, nu, on, pe, qc, sk, yt]
tax_api_url = "https://api.salestaxapi.ca/v2/province/all"
tax_api_uri = URI(tax_api_url)
tax_api_response = Net::HTTP.get(tax_api_uri)
tax_rate_data = JSON.parse(tax_api_response)

# Provinces Hash in alphabetical order
province_full_name = {
  "ab" => "Alberta",
  "bc" => "British Columbia",
  "mb" => "Manitoba",
  "nb" => "New Brunswick",
  "nl" => "Newfoudland and Labrador",
  "ns" => "Nova Scotia",
  "nt" => "Northwest Territories",
  "nu" => "Nunavut",
  "on" => "Ontario",
  "pe" => "Prince Edward Island",
  "qc" => "Quebec",
  "sk" => "Saskatchewan",
  "yt" => "Yukon Territories"
}

# Propogate TaxRates
tax_rate_data.each do |pcode, tax|
  province_tax_rate = TaxRate.create(
    gst:        tax["gst"],
    pst:        tax["pst"],
    hst:        tax["hst"],
    applicable: tax["applicable"]
  )
  # Propogate Provinces
  province_tax_rate.provinces.create(
    province_code: pcode,
    province_name: province_full_name[pcode]
  )
end

# *** Propogate FK Tables ***

# Suppliers
#   -

# Inventory
#   - Will use Faker

# Inventory Details
#   - Will use coffee API

# Employees
#   - Will use Faker + Instructor

# Orders
#   - Implement for Shopping Cart Functionality

# Order_History
#   - Implement AFTER Shopping Cart Functionality

# DELETE BELOW AFTER
puts "Created #{TaxRate.count} Tax Rates"
puts "Created #{Species.count} Species"
puts "Created #{GrindType.count} Grind Types"
puts "Created #{Job.count} Jobs"
puts "Created #{Supplier.count} Suppliers"
puts "Created #{Inventory.count} Inventories"
puts "Created #{InventoryDetail.count} Inventory Details"
puts "Created #{Employee.count} Employees"
puts "Created #{Province.count} Provinces"
puts "Created #{Order.count} Orders"
puts "Created #{OrderHistory.count} Order Histories"
