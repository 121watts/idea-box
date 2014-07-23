require 'yaml/store'

class Idea

  include Comparable
  attr_reader :title, :description, :id, :rank, :tag

  def initialize(attributes)
    @id          = attributes["id"]
    @title       = attributes["title"]
    @description = attributes["description"]
    @rank        = attributes["rank"] || 0
    @tag         = attributes["tag"]
  end

  def <=>(other)
    other.rank <=> rank
  end

  def to_h
    {
      "title" => title,
      "description" => description,
      "rank" => rank,
      "tag" => tag
    }
  end

  def like!
    @rank += 1
  end

  def save
    IdeaStore.create(to_h)
  end

end
