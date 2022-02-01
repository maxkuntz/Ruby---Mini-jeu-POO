require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def before_fight 
puts "*-------------------------------------------------*"
puts "|        Bienvenue sur mon min jeu en POO !       |"
puts "|               codé par Maxime                   |"
puts "*-------------------------------------------------*"
end

def fight
  print "Quel est votre prénom : "
  player_name = gets.chomp
  user_player = HumainPlayer.new(player_name)
  # puts user_player.show_state

  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  ennemies = [player1, player2]

#boucle while qui ne doit s'arrêter que si le joueur de l'utilisateur (HumanPlayer) meurt ou si les 2 joueurs "bots" (Player) meurent. 
  while user_player.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    puts user_player.show_state
    puts "Quelle action veux-tu effectuer ? "
    puts "a - chercher une meilleure arme "
    puts "s - chercher à se soigner " 
    puts "attaquer un joueur en vue : "
    print "0 - "
    player1.show_state
    print "1 - "
    player2.show_state
    puts "Faites votre choix "
    choice = gets.chomp.to_s

    # MENU
    case choice
    when "a"
        user_player.search_weapon
    when "s"
        user_player.search_health_pack
    when "0"
        user_player.attacks(player1)
    when "1"
        user_player.attacks(player2)
    else
        puts "Erreur de saisie !"
    end

    gets.chomp #pause

    # test pour que les bots attaquent uniquement si ils sont en vie
    ennemies.each do |playerbot|
      if playerbot.life_points > 0
        puts "Les autres joueurs contre-attaquent ! Préparez-vous."
        playerbot.attacks(user_player)
        gets.chomp #pause
      else
        puts "#{playerbot.name} n'a plus de points de vie."
      end
    end
  end


  #Fin du combat
  if user_player.life_points <= 0
    puts "Tu as perdu !!! "
  else
    puts "Tu as gagné !!!"
  end
end

def perform
  before_fight
  fight
end

perform