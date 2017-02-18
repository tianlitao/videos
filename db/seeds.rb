# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


col = Column.create(name: '电影',english: 'movie',icon: '电影',cover: 'http://r1.ykimg.com/0510000058A6D3C5ADC0B003E9024E45',summary: '电影')
Video.create(column: col,video_type: 0,tv_code: 'XMjUwNzIzNDI4MA==',title: '中央电视台元宵晚会',
    cover: 'https://r1.ykimg.com/05420408589F4D1C6F0E7D308D5908C6',duration: 8709,)