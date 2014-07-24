require 'yaml/store'

class Idea

  include Comparable
  attr_reader :title, :description, :id, :rank, :tags

  def initialize(attributes)
    @id          = attributes["id"]
    @title       = attributes["title"]
    @description = attributes["description"]
    @rank        = attributes["rank"] || 0
    @tags        = attributes["tags"]
  end

  def <=>(other)
    other.rank <=> rank
  end

  def to_h
    {
      "title" => title,
      "description" => description,
      "rank" => rank,
      "tags" => tags
    }
  end

  def like!
    @rank += 1
  end

  def save
    IdeaStore.create(to_h)
  end

end
