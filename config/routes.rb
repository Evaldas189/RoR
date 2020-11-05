Rails.application.routes.draw do
  
  #Nurodomas šakninis puslapis, kuris bus pagrindinis paleidus serverį.
  root 'home#index'
  
  #GET metodas norit pasiekti 'prices' puslapį.
  get 'prices' => 'pages#prices'
  
  #GET metodas norit pasiekti 'gallery' puslapį
  get 'gallery' => 'pages#gallery'
  
  #GET metodas noritn pasiekti 'try' puslapį.
  get 'try' => 'pages#try'

end
