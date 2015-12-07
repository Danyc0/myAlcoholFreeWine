class Wine < ActiveRecord::Base
    require 'rest-client'

    def self.search(search)
        Wine.where('name like :value OR short_description like :value OR long_description like :value OR origin like :value OR grape like :value OR size like :value OR price like :value OR supplier like :value', value: "%#{search}%")
    end

    def self.refresh
        Wine.delete_all

        response1 = RestClient.get 'http://localhost:9000/wines'
        response2 = RestClient.get 'http://localhost:9001/wines'

        result1 = JSON.parse(response1)
        result2 = JSON.parse(response2)

        duplicate_wines = []

        result1.each_with_index {|bottle1, index1|
            bottle1[:supplier] = :supplier1
            result2.each_with_index{|bottle2, index2|
                bottle2[:supplier] = :supplier2

                if bottle1['name'] == bottle2['name']
                    if bottle1['price'] < bottle2['price']
                        duplicate_wines << bottle1
                    else
                        duplicate_wines << bottle2
                    end
                    
                    result1.delete_at(index1)
                    result2.delete_at(index2)
                end
            }
        }

        result1.each{|bottle1|
            bottle1[:supplier] = :supplier1
        }
        result2.each{|bottle2|
            bottle2[:supplier] = :supplier2
        }

        temp_wines = duplicate_wines.concat result1
        final_wines = temp_wines.concat result2
        final_wines.each {|bottle|
            puts bottle
            @wine = Wine.create(bottle)
            @wine.save
        }
    end
end
