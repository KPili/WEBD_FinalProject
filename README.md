# Full Stack Web Development - Final Project 🏁

The purpose of this project is to utilize aspects learned in the course about Ruby on Rails.
To highlight what was learned we simulate a client making a request from a contracting company to act as project manager and developer for a desired ecommerce website.
The clients ecommerce website will be determined by the student and outlined in the project proposal.

- Client ➡ Course Instructor
- Contractor ➡ Student
- Ecommerce Website ➡ Coffee Website
- Project Proposal ➡ Not uploaded & Presented in person to instructor

---

## To get the project running

- Option 1:

  - **Terminal Commands:**
    ```
    rails bundle update
    rails db:migrate
    ** Refer to steps in 'Pre-Seed' Section of ReadMe **
    rails db:seed
    ** Refer to steps in 'Final Preparations' Section of ReadMe **
    rails db:migrate
    rails s
    ** Refer to 'AboutUs/ContactUs Pages' Section of ReadMe
    ```

- Option 2:
  - **Delete Gemfile.lock**
  - **Terminal Commands:**
    ```
    rails bundle install
    rails db:migrate
    ** Refer to steps in 'Pre-Seed' Section of ReadMe **
    rails db:seed
    ** Refer to steps in 'Final Preparations' Section of ReadMe **
    rails db:migrate
    rails s
    ** Refer to 'AboutUs/ContactUs Pages' Section of ReadMe
    ```
- ## **Pre-Seed**

  - app/models/employee.rb & app/models/inventory.rb
    ```
    Comment code under the comment of '# IMAGE PROCESSING'
    After running rails db:seed then uncomment and run a db:migrate
    ```
  - app/admin/employees.rb & app/admin/inventories.rb

    ```
    Add :image in permit_params list
    Uncomment f.input section containing image upload code
    ```

- ## **Final Preparations**
  - Kaminari Gem
    - As this project utilizes bootstrap framework for styling run this terminal command to avoid pagination styling to look 'off' **if** the kaminari views folder is missing
    ```
    rails g kaminari:views bootstrap4
    ```
  - ActiveStorage
    - Run this terminal command to assure the Ubuntu WSL2 instance running utilizes imagemagick
    - Note: app/assets/images/employees contains unsplash images used for the project
    ```
    sudo apt-get install imagemagick
    ```
- ## **AboutUs/ContactUs Pages**

  - The About Us and Contact Us page do not have seed file generated content, as project requirements intended.
  - To get these pages to work data must first be created in their respective tables

    - **Option 1:**
      - Enter the rails console and manually add data
    - **Option 2:**

      - After running the puma server and going to the website landing page.
      - Go to 127.0.0.1:3000/admin
      - Login with credentials listed in db/seeds.rb for active admin.
      - Manually add data in the fields
      - To mimic original data used when presenting the project follow below: (Note I referenced about us details from [https://www.corneliabean.com/] )
      - About US

        ```
        Princess Coffee Roasters was established in 2019 by Michael Bialowas, Manager, and his team of coffee enthusiasts and experts. Princess Coffee Roasters specializes in the finest freshly roasted coffees. Princess Coffee Roasters started as a one-man-business ran from Michael's home on princess street. With determination and the goals of developing locally roasted and rich tasting beans in Winnipeg, the business was able to grow into the tight knit team it currently is today. The beans we source come from various vendors that emphasize the ethical business practices they follow when dealing with their bean suppliers. By doing being selective on the vendors, Princess Coffee Roasters upholds their goals to serve local but also support the development of coffee culture down to the fair payment of farmers around the world. We established Princess Coffee roasters with a respect for tradition, and we pride ourselves in providing the best quality, value and selection. We are enthusiastic in our blending of fresh and natural coffee beans and our careful curation of freshly roasted coffees.
        ```

      - Our Mission
        ```
        Princess Coffee Roasters is committed to providing the highest quality products and the highest standard of customer service so each and every patron has a memorable experience. Princess Coffee Roasters is dedicated to sourcing the highest quality beans and freshly roasted coffee and purchasing it from reputable and sustainable brokers. Princess Coffee Roasters is committed to working with local suppliers and leads the market in supporting its industry for the benefit of the local economy.
        ```
      - Our Vision
        ```
        To ensure that every experience with us, whether in person or online, is memorable and exceptional. We strive to provide each customer with an outstanding and personalized experience. To offer the best products from around the world and bring a taste of adventure to every cup. To support the local effort of suppliers, and at every opportunity, to promote other local businesses that are partners in the industry. To be inspired by the ever-changing environment of the industry, including new approaches to sourcing coffee, roasting coffee and assuring the best end product from bean to cup.
        ```

---

## Git details

A business requirement for the project involves the usage of git for source control of the project throughout it's entire life cycle.
For details to be presented to the instructor during marking for requirement of "Two features must must be developed in their own branches and merged into main."

- Branch Scheme:
  - **main** ➡ Merges into this branch act as if merging into the live production code.
  - **pcr_test** ➡ Merges into this branch act as a pre-production space for finalization of code before pushing to main.
  - **pcr_feature_ftName** ➡ These branches are to act as development and testing spaces for desired features for the website that will be tested further in the pre-production branch.
    - _ftName_ ➡ Place-holder for the intended name of the feature to be created.
