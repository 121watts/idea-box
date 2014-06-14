class IdeaStore

  def self.save(idea)
    @all ||= []
    if idea.new?
      idea.id = next_id
      @all  << idea
    end
    idea.id
  end

  def self.find(id)
    @all.find { |idea| idea.id == id }
  end

  def self.count
    @all.length
  end

  def self.next_id
    count + 1
  end

  def self.delete_all
    @all = []
  end
end
