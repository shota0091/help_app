class License < ActiveHash::Base
  self.data = [
    {id: 1, name: '未経験者歓迎'},{id: 2, name: '経験者（半年〜）'},{id: 3, name: '経験者（1年〜）'},{id: 4, name: '経験者（3年〜）'},{id: 5, name: '経験者（5年〜）'},
    {id: 6, name: '経験者（10年〜）'},{id: 7, name: '経験者（不問）'},{id: 8, name: '必要資格有り'},
  ]
end