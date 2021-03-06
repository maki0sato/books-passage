class Genre < ActiveHash::Base
  self.data = [
    { id: 1,  name: '--' },
    { id: 2,  name: '推理・ミステリー小説' },
    { id: 3,  name: '青春小説' },
    { id: 4,  name: '恋愛小説' },
    { id: 5,  name: 'SF小説' },
    { id: 6,  name: 'ファンタジー・幻想小説' },
    { id: 7,  name: '怪奇・怪談小説' },
    { id: 8,  name: 'ライトノベル' },
    { id: 9,  name: '経済小説' },
    { id: 10, name: '政治小説' },
    { id: 11, name: '歴史・時代小説' },
    { id: 12, name: '医療小説' },
    { id: 13, name: '児童小説' },
    { id: 14, name: '官能小説' },
    { id: 15, name: 'その他' }
]
  include ActiveHash::Associations
  has_many :users
  has_many :books
end