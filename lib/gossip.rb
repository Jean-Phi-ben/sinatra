require 'csv'

class Gossip
    attr_accessor :mon_super_auteur, :ma_super_description 

    def initialize(auteur, description) #initialisation des attribut de la classe 
      
        #on va créer les 9 instances de BoardCase et initialiser case_id
          @mon_super_auteur = auteur
          @ma_super_description = description

    end


    def save

        CSV.open("./db/gossip.csv", "ab") do |csv|
        csv << [@mon_super_auteur, @ma_super_description]
        end
    end


    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
      end

      def self.find(id)
        gossips = []   # permet de stocker la ligne csv demandée
        CSV.read("./db/gossip.csv").each_with_index do |row, index|
          if (id == index+1)          # cherche et check si l'index est égale id demandé
            gossips << Gossip.new(row[0], row[1])    # si trouvé, ajout dans array et break pour retourner l'array
            break
              end
            end
            return gossips
        end

end

