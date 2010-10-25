class PageView
  include MongoMapper::Document
  key :hour, Time, :indexed => true
  key :total, Integer, :required => true, :default => 0
#  key :uniques, Integer
  key :countable_type, String, :indexed => true, :required => true
  key :page_id, Object, :required => true

  before_validation :set_countable_type

  protected
  def set_countable_type
    countable_type = Page.find(page_id).countable_type
  end

end
