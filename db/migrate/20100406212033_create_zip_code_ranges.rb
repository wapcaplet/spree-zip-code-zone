class CreateZipCodeRanges < ActiveRecord::Migration
  def self.up
    create_table :zip_code_ranges do |t|
      t.string :start_zip
      t.string :end_zip

      t.timestamps
    end
  end

  def self.down
    drop_table :zip_code_ranges
  end
end
