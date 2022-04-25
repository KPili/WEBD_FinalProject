# Below will be uncommented if I decide to use an API during this project
require "net/http"
require "uri"
require "json"
require "csv"

# Reset Faker Values
Faker::UniqueGenerator.clear

# Reset Database
# Admin Account
AdminUser.destroy_all

# FKs
# OrderHistory.destroy_all
# Order.destroy_all
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

# Reset PK to 1 for all tables
Job.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'jobs'")
GrindType.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'grind_types'")
Species.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'species'")
TaxRate.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'tax_rates'")
Supplier.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'suppliers'")
Inventory.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'inventories'")
InventoryDetail.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE
                                    NAME= 'inventory_details'")
Employee.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'employees'")
Province.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'provinces'")
# Order.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'orders'")
# OrderHistory.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'order_histories'")

# Reset auto increment id to 1
AdminUser.connection.execute("UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME= 'admin_users'")

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
coffee_shop_jobs = {
  "Manager"                  => "A Manager accomplishes department objectives by managing staff;
  planning and evaluating department activities. Maintains staff by recruiting,
  selecting, orienting, and training employees. Ensures a safe, secure, and legal work environment.
  Develops personal growth opportunities.",
  "Administrative Assistant" => "An Administrative Assistant provides office support
  for the businesses. They may draft various documents and types of business correspondence.
  Administrative assistants also often provide phone support and customer service, handle scheduling
  and prepare and proofread reports.",
  "Barista"                  => "A Barista is a professional who makes and serves beverages such as
  coffee, tea and specialty beverages. They are responsible for taking customer orders and payments.
  They also clean and sanitize their work areas, seating areas and equipment/tools",
  "Roaster"                  => "A Roaster acquires coffee beans from around the world and roasts
  them to obtain different taste profiles. Your job duties may include negotiating with coffee bean
  wholesalers or coffee farmers, roasting coffee beans, experimenting with roast levels, aroma,
  grind, and flavors."
}

# Propogate jobs table
coffee_shop_jobs.each do |title, desc|
  coffee_shop_job = Job.create(
    job_title:  title,
    job_desc:   desc,
    start_date: DateTime.now
  )

  # Employee Creation
  # Manager must be instructor as indicated in the proposal document
  if coffee_shop_job.id == 1
    coffee_shop_job.employees.create(
      f_name:    "Michael",
      l_name:    "Bialowas",
      phone_num: "(204) 632-3960",
      email:     "mbialowas@rrc.ca"
    )
  else
    first_name = Faker::Name.unique.first_name
    last_name = Faker::Name.unique.last_name
    coffee_shop_job.employees.create(
      f_name:    first_name,
      l_name:    last_name,
      phone_num: Faker::PhoneNumber.unique.cell_phone,
      email:     "#{first_name.chr}#{last_name}@rrc.ca"
    )
  end
end

# Grind Types
grinds.each do |g|
  GrindType.create(
    grind: g["coffee_grind_type"],
    desc:  g["coffee_grind_details"]
  )
end
# Species
coffee_species = ["arabica", "robusta"]

# Propogate species table
coffee_species.each do |species|
  Species.create(
    name: species
  )
end

# Tax Rates + Provinces
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
manager = Job.first

# Suppliers
8.times do
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  rep_email = "#{first_name.chr}#{last_name}"

  manager.suppliers.create(
    company_name: Faker::Company.unique.name,
    company_rep:  "#{first_name} #{last_name}",
    email:        Faker::Internet.safe_email(name: rep_email)
  )
end

# Inventory
brands.each do |b|
  random_valid_id = Faker::Number.between(from: 1, to: Supplier.count)
  select_supplier = Supplier.find(random_valid_id)
  unit_sold = Faker::Number.between(from: 1, to: 10)
  new_inventory_value = Faker::Number.between(from: 0, to: 1)
  unit_price = b["unit_price"]
  profit_multiplyer = 1.33

  select_supplier.inventories.create(
    item_name:     b["item_name"],
    unit_sold:     unit_sold,
    unit_price:    unit_price,
    stock_amount:  Faker::Number.between(from: 1, to: 30),
    new_inventory: new_inventory_value,
    total:         unit_sold * unit_price.to_f,
    retail_total:  b["retail_total"] * profit_multiplyer
  )
end

# Inventory Details
# Association to Species
arabica_beans = Species.where(name: "arabica").take
robusta_beans = Species.where(name: "robusta").take
id_count = 1

# Iterate through robusts.csv
robusta.each do |r|
  robusta_inventories = Inventory.find(id_count)

  robusta_beans.inventory_details.create(
    aroma:             r["Aroma"].to_f,
    flavor:            r["Flavor"].to_f,
    acidity:           r["Acid"].to_f,
    country_of_origin: r["Country.of.Origin"],
    on_sale:           Faker::Number.between(from: 0, to: 1),
    inventory_id:      robusta_inventories.id
  )

  id_count += 1
end

new_id_count = InventoryDetail.count + 1

arabica.each do |a|
  arabica_inventories = Inventory.find(new_id_count)

  arabica_beans.inventory_details.create(
    aroma:             a["Aroma"].to_f,
    flavor:            a["Flavor"].to_f,
    acidity:           a["Acid"].to_f,
    country_of_origin: a["Country.of.Origin"],
    on_sale:           Faker::Number.between(from: 0, to: 1),
    inventory_id:      arabica_inventories.id
  )
  new_id_count += 1
end

# Orders
#   - Implement for Shopping Cart Functionality

# Order_History
#   - Implement AFTER Shopping Cart Functionality

# Log seed script results
logger = Rails.logger

logger.info "Created #{TaxRate.count} Tax Rates"
logger.info "Created #{Species.count} Species"
logger.info "Created #{GrindType.count} Grind Types"
logger.info "Created #{Job.count} Jobs"
logger.info "Created #{Supplier.count} Suppliers"
logger.info "Created #{Inventory.count} Inventories"
logger.info "Created #{InventoryDetail.count} Inventory Details"
logger.info "Created #{Employee.count} Employees"
logger.info "Created #{Province.count} Provinces"
logger.info "Created #{Order.count} Orders"
logger.info "Created #{OrderHistory.count} Order Histories"
total = TaxRate.count + Species.count + GrindType.count + Job.count +
        Supplier.count + Inventory.count + InventoryDetail.count + Employee.count +
        Province.count + Order.count + OrderHistory.count
logger.info "Total amount of products seeded = #{total}"

# Active Admin User credentials
if Rails.env.development?
  AdminUser.create!(email: "mbialowas@rrc.ca", password: "Password01",
                    password_confirmation: "Password01")
end
