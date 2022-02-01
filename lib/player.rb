require 'pry'

#initialisation de la classe Player
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(nb_damage)
    @life_points -= nb_damage
    puts "#{@name} a #{@life_points} points de vie"
		puts "#{@name} a été tué !" if @life_points <= 0
  end

  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name} !" 
    nb_damage = compute_damage
    puts "#{@name} inflige #{nb_damage} points de dommages à #{player.name} !"
    player.gets_damage(nb_damage)
  end

  def compute_damage
    return rand(1..6)
  end

end

#initialisation de la classe HumainPlayer qui herite de Player
class HumainPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name=name
    @life_points=100
    @weapon_level = 1
  end

  def show_state
    puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon}"
      if weapon > @weapon_level
        @weapon_level = weapon
        puts "Youhou! elle est meilleure que ton arme actuelle: tu la prends."
      else 
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
  end

  def search_health_pack
    pack = rand(1...6)
    if pack == 1
        puts "Tu n'as rien trouvé :'("
    elsif pack >= 2 && pack <= 5
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        if @life_points+50>100
          @life_points = 100   
        else
          @life_points += 50 
        end
    else
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
        if @life_points+80>100
          @life_points = 100   
        else
          @life_points += 80 
        end
    end
  end

end