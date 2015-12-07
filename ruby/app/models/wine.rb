class Wine < ActiveRecord::Base
    require 'rest-client'

    def self.search(search)
        Wine.where('name like :value OR short_description like :value OR long_description like :value OR origin like :value OR grape like :value OR size like :value OR price like :value OR supplier like :value', value: "%#{search}%")
    end

    def self.refresh
        Wine.delete_all

        response = RestClient.get 'http://localhost:9000/wines'
        result = JSON.parse(response)
        puts result.to_json
        for bottle in result
            bottle[:supplier] = :supplier1
            @wine = Wine.create(bottle)
            @wine.save
        end
    end
end
