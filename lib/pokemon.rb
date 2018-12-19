require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

  def self.find(id,db)
    info = db.execute("SELECT * FROM pokemon WHERE id = ?" ,id).flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], hp: info[3], db:db)
  end

  def alter_hp(hp_new, db)
    db.execute("UPDATE pokemon SET hp = ? where id = ?", hp_new, self.id)
  end


end
