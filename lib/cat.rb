class Cat

attr_reader :name
attr_accessor :mood, :owner

  def initialize(name)
    @name = name
    @mood = "nervous" #default value that can be rewritten because of the macro attr_accessor. (getter/setter methods)
  end

  #def mood
  #  @mood
  #end
end
