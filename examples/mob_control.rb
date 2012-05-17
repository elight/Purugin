class MobControlPlugin
  TRUTH = ['y', 'Y', 't', 'T', 'true', 'TRUE']

  include Purugin::Plugin, Purugin::Colors
  description 'control world mob spawning', 0.1
  
  def on_enable
    allow_monsters = config.get "mob_control.allow_monsters", true
    allow_animals = config.get "mob_control.allow_animals", true

    server.worlds.each do |world| 
      world.set_spawn_flags(allow_monsters, allow_animals)
    end
    
    public_command('mob_control', 'Can mobs spawn', '/mob_control mons ani') do |me, *args|
      allow_monsters = TRUTH.include?(args[0]) if args[0]
      allow_animals = TRUTH.include?(args[1]) if args[1]

      config.set! "mob_control.allow_monsters", allow_monsters
      config.set! "mob_control.allow_monsters", allow_animals

      me.msg green("MONSTERS: #{allow_monsters}, ANIMALS: #{allow_animals}")

      me.world.set_spawn_flags(allow_monsters, allow_animals)
    end
  end
end
