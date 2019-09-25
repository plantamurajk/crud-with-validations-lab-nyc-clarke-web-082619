class Song < ApplicationRecord

    validates :artist_name, :title, presence: true

    validates :title, uniqueness: {
        scope: %i[release_year artist_name],
        message: 'must be unique to the artist in the given release year'
      }
    
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { maximum: Time.now.year }, if: :released?
 
 



    def released?
        released
    end

end
