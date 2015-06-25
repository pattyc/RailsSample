class Item < ActiveRecord::Base
  belongs_to :supplier

  def self.import(file, supplier_id)
    CSV.foreach(file.path, headers: true) do |row|
      @supplier = Supplier.find(supplier_id)
      @supplier.items.create! row.to_hash
    end
  end
end
