class PagesController < ApplicationController
    
    before_action:generate_images
    
    #metodas, kuris is nuotraukų masyvo paima random nuotrauką
    def generate_images

        images = ['https://images.jdmagicbox.com/comp/mumbai/i7/022pxx22.xx22.110530151005.p9i7/catalogue/perfect-fitness-gym-and-spa-jogeshwari-east-mumbai-gyms-xem3va.jpg?clr=#521429',
        'https://content.phuket101.net/wp-content/uploads/20200103223054/phuket-fitness-clubs.jpg',
        'https://www.rosaneroportal.com/wp-content/uploads/2015/03/fitness-gym.jpg'
        ]
        @image = images.sample;
    end

end
