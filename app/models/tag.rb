require "data_mapper"

class Tag
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :name, String

  def self.multi_tag(tag_name, link)
    tag_name.split.each do |tag|
      link.tags << self.first_or_create(name: tag)
    end
    link.save
  end
end
