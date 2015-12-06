class Wine < ActiveRecord::Base
    def self.search(search)
        Wine.where('name like :value OR short_description like :value OR long_description like :value OR origin like :value OR grape like :value OR size like :value OR price like :value OR supplier like :value', value: "%#{search}%")
    end
end
