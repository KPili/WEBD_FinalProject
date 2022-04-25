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
    rails db:seed
    ** Refer to steps in 'Pre-Seed' Section of ReadMe **
    rails db:migrate
    rails s
    ```

- Option 2:
  - **Delete Gemfile.lock**
  - **Terminal Commands:**
    ```
    rails bundle install
    rails db:migrate
    rails db:seed
    ** Refer to steps in 'Pre-Seed' Section of ReadMe **
    rails db:migrate
    rails s
    ```
- ## **Pre-Seed**

  - app/models/employee.rb & app/models/inventory.rb
    ```
    Uncomment code under the comment of '# IMAGE PROCESSING'
    ```
  - app/admin/employees.rb & app/admin/inventories.rb

    ```
    Add :image in permit_params list
    Uncomment f.input section containing image upload code
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
