class Icon < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' , value: '---'},
    { id: 1, name: 'ホテル' , value: 'fa-bed'},
    { id: 2, name: 'お風呂' , value: 'fa-bath'},
    { id: 3, name: 'フード' , value: 'fa-burger'},
    { id: 4, name: 'レストラン' , value: 'fa-utensils'},
    { id: 5, name: 'ビュースポット' , value: 'fa-camera'},
    { id: 6, name: 'ショッピング' , value: 'fa-cart-shopping'},
    { id: 7, name: 'アクティビティ' , value: 'fa-person-biking'}
  ]

  include ActiveHash::Associations
  has_many :spots

end
 
  # <i class="fa-solid fa-bed"></i>ホテル
  # <i class="fa-solid fa-bath"></i>お風呂
  # <i class="fa-solid fa-burger"></i>フード
  # <i class="fa-solid fa-utensils"></i>レストラン
  # <i class="fa-solid fa-camera"></i>ビュースポット
  # <i class="fa-solid fa-cart-shopping"></i>ショッピング
  # <i class="fa-solid fa-person-biking"></i>アクティビティ
