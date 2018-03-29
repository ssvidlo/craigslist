class ImporterCsvData < BaseService
  require 'csv'

  def initialize(file)
    @file = file
  end

  # Implementer data uploder from csv to database
  def call
    # need this variebl to save information about created users and products
    data_was_imported = { users: [], products: [] }

    CSV.foreach(@file.tempfile, headers: false) do |row|
      #try to find if user present and if not create user
      user = User.find_by(email: row[6])

      unless user.present?
        user = User.create(phone: row[7].to_i, email: row[6], address: row[8], first_name: row[9], last_name: row[10])

        data_was_imported[:users] << user.first_name
      end

      #try to find if product present and if not create product
      product = Product.joins(:user).where(products: { name: row[1] }, users: { id: user.id })

      unless product.present?
        product = Product.create(user_id: user.id, name: row[1], price: row[2].to_i, color: row[3], description: row[4], is_active: to_boolean(row[5]))

        data_was_imported[:users] << product.name
      end
    end

    # report about all created items
    data_was_imported
  end

  private

  # transform string 'false' and 'true' to boolean variables true and false
  def to_boolean(val)
    eval(val)
  end
end
