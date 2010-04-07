class ZipCodeRange < ActiveRecord::Base
  named_scope :order_by_name, :order => [:start_zip, :end_zip]

  has_one :zone_member, :as => :zoneable
  has_one :zone, :through => :zone_member
  validates_presence_of [:start_zip, :end_zip]

  def <=>(other)
    start_zip <=> other.start_zip and end_zip <=> other.end_zip
  end

  def to_s
    "#{start_zip} - #{end_zip}"
  end

  def name
    to_s
  end

end
