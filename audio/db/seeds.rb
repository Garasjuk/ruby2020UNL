
#Group
Group.create!(name: 'Nirvana', description: 'Нравится слушателям: Linkin Park, Red Hot Chili Peppers, Marilyn Manson')
Group.create!(name: 'Metallica', description: 'Нравится слушателям: Iron Maiden, Ozzy Osbourne, Megadeth')
Group.create!(name: 'Linkin Park', description: 'Нравится слушателям: Thirty Seconds to Mars, Skillet, Papa Roach')
Group.create!(name: 'The Beatles', description: 'Нравится слушателям: Elvis Presley, The Beatles, The Rolling Stones')

#Gener
Gener.create!(name:'Pop')
Gener.create!(name:'Rock')
Gener.create!(name:'hip hop')
Gener.create!(name:'Country')
Gener.create!(name:'Jazz')

#Artist
Artist.create!(name:'Курт Кобейн', description: 'американский певец, автор песен, музыкант и художник, наиболее известный как вокалист и гитарист рок-группы Nirvana', group_id: '1')
Artist.create!(name:'Крист Новоселич', description: 'американский музыкант, бывший бас-гитарист группы Nirvana', group_id: '1')
Artist.create!(name:'Дэйв Грол', description: 'американский рок-музыкант и автор песен', group_id: '1')

Artist.create!(name:'Джеймс Хетфилд', description: 'американский рок-музыкант; вокалист и ритм-гитарист метал-группы Metallica', group_id: '2')
Artist.create!(name:'Ларс Ульрих', description: 'американский барабанщик, продюсер и актёр датского происхождения. Один из основателей группы Metallica', group_id: '2')
Artist.create!(name:'Кирк Хэмметт', description: 'американский гитарист, автор песен', group_id: '2')
Artist.create!(name:'Роберт Трухильо', description: 'американский музыкант, бас-гитарист мексиканского происхождения', group_id: '2')

Artist.create!(name:'Майк Шинода', description: 'вокалист, гитарист, клавишник, MC и один из основателей рок-группы Linkin Park,', group_id: '3')
Artist.create!(name:'Джо Хан', description: 'диджей группы Linkin Park', group_id: '3')
Artist.create!(name:'Брэд Дэлсон', description: 'музыкант, гитарист и один из основателей рок-группы Linkin Park', group_id: '3')
Artist.create!(name:'Роб Бурдон', description: 'американский музыкант, барабанщик рок-группы Linkin Park', group_id: '3')
Artist.create!(name:'Честер Беннингтон', description: 'американский рок-музыкант, вокалист групп Linkin Park', group_id: '3')
Artist.create!(name:'Дэвид Фаррелл', description: 'бас-гитарист американской рок-группы Linkin Park', group_id: '3')

Artist.create!(name:'Джон Леннон', description: 'британский рок-музыкант, певец,', group_id: '4')
Artist.create!(name:'Пол Маккартни', description: 'британский музыкант', group_id: '4')
Artist.create!(name:'Джордж Харрисон', description: 'британский рок-музыкант, певец', group_id: '4')
Artist.create!(name:'Ринго Старр', description: 'британский музыкант, автор песен, актёр', group_id: '4')

#Albom
Albom.create!(name:'Bleach', description: 'дебютный студийный альбом американской гранж-группы Nirvana, выпущенный 15 июня 1989 года на независимом лейбле Sub Pop', group_id: '1', artist_id: '1', gener_id: '2')
Albom.create!(name:'Live at Reading', description: 'концертный CD/DVD-альбом американской гранж-группы Nirvana, записанный 30 августа 1992 года', group_id: '1', artist_id: '1', gener_id: '2')
Albom.create!(name:'Nevermind', description: 'второй и самый коммерчески успешный альбом американской гранж-группы Nirvana. Был выпущен 24 сентября 1991 года', group_id: '1', artist_id: '1', gener_id: '2')
Albom.create!(name:'In Utero', description: 'третий и последний студийный альбом американской гранж-группы Nirvana, выпущенный 13 сентября 1993 года на лейбле DGC Records.', group_id: '1', artist_id: '1', gener_id: '2')

Albom.create!(name:'Kill em All', description: 'дебютный студийный альбом американской метал-группы Metallica, выпущенный 25 июля 1983 года', group_id: '2', artist_id: '2', gener_id: '2')
Albom.create!(name:'Ride the Lightning', description: 'второй студийный альбом трэш-метал группы Metallica, вышедший 27 июля 1984 года', group_id: '2', artist_id: '2', gener_id: '2')
Albom.create!(name:'Metallica (The Black Album)', description: 'пятый студийный альбом одноимённой метал-группы Metallica, выпущенный 12 августа 1991 года', group_id: '2', artist_id: '2', gener_id: '2')
Albom.create!(name:'Death Magnetic', description: 'девятый студийный альбом американской группы Metallica, вышедший 10 сентября 2008 года', group_id: '2', artist_id: '2', gener_id: '2')

Albom.create!(name:'Hybrid Theory', description: 'дебютный альбом американской рок-группы Linkin Park, выпущенный 24 октября 2000 года', group_id: '3', artist_id: '3', gener_id: '2')
Albom.create!(name:'Meteora', description: 'второй студийный альбом калифорнийской мультиплатиновой альтернативной рок-группы Linkin Park, впервые выпущенный 25 марта 2003 года', group_id: '3', artist_id: '3', gener_id: '2')
Albom.create!(name:'Minutes to Midnight', description: 'третий студийный альбом мультиплатиновой американской рок-группы Linkin Park, релиз которого состоялся 14 мая 2007 года', group_id: '3', artist_id: '3', gener_id: '2')
Albom.create!(name:'A Thousand Suns', description: 'четвёртый студийный альбом мультиплатиновой рок-группы Linkin Park, релиз которого состоялся 14 сентября 2010 года', group_id: '3', artist_id: '3', gener_id: '2')

Albom.create!(name:'Please Please Me', description: 'дебютный студийный альбом группы The Beatles, выпущенный 22 марта 1963 года', group_id: '4', artist_id: '4', gener_id: '2')
Albom.create!(name:'A Hard Day’s Night', description: 'третий студийный альбом The Beatles. Большинство песен альбома были написаны специально для одноимённого фильма', group_id: '4', artist_id: '4', gener_id: '2')
Albom.create!(name:'Rubber Soul', description: 'шестой студийный альбом группы The Beatles, выпущенный 3 декабря 1965 года', group_id: '4', artist_id: '4', gener_id: '2')
Albom.create!(name:'The Beatles', description: 'десятый студийный альбом The Beatles и единственный двойной релиз группы. Альбом, выпущенный в 1968 году', group_id: '4', artist_id: '4', gener_id: '2')

#Song
Song.create!(name:'Blew', albom_id: '1')
Song.create!(name:'About a Girl', albom_id: '1')
Song.create!(name:'School', albom_id: '1')

Song.create!(name:'Breed', albom_id: '2')
Song.create!(name:'Aneurysm', albom_id: '2')
Song.create!(name:'Dumb', albom_id: '2')

Song.create!(name:'Smells Like Teen Spirit', albom_id: '3')
Song.create!(name:'Come as You Are', albom_id: '3')
Song.create!(name:'Polly', albom_id: '3')

Song.create!(name:'Serve the Servants', albom_id: '4')
Song.create!(name:'Rape Me', albom_id: '4')
Song.create!(name:'Milk It', albom_id: '4')

Song.create!(name:'Hit the Lights', albom_id: '5')
Song.create!(name:'Motorbreath', albom_id: '5')
Song.create!(name:'Whiplash', albom_id: '5')

Song.create!(name:'Fight Fire with Fire', albom_id: '6')
Song.create!(name:'Ride the Lightning', albom_id: '6')
Song.create!(name:'Fade to Black»', albom_id: '6')

Song.create!(name:'Enter Sandman', albom_id: '7')
Song.create!(name:'The Unforgiven', albom_id: '7')
Song.create!(name:'Nothing Else Matters', albom_id: '7')

Song.create!(name:'That Was Just Your Life', albom_id: '8')
Song.create!(name:'Broken, Beat & Scarred', albom_id: '8')
Song.create!(name:'All Nightmare Long', albom_id: '8')

Song.create!(name:'Papercut', albom_id: '9')
Song.create!(name:'Crawling', albom_id: '9')
Song.create!(name:'In the End', albom_id: '9')

Song.create!(name:'Somewhere I Belong', albom_id: '10')
Song.create!(name:'Faint', albom_id: '10')
Song.create!(name:'Session', albom_id: '10')

Song.create!(name:'Wake', albom_id: '11')
Song.create!(name:'Given Up', albom_id: '11')
Song.create!(name:'What Ive Done', albom_id: '11')

Song.create!(name:'The Requiem', albom_id: '12')
Song.create!(name:'Burning in the Skies', albom_id: '12')
Song.create!(name:'Robot Boy', albom_id: '12')

Song.create!(name:'I Saw Her Standing There', albom_id: '13')
Song.create!(name:'Misery', albom_id: '13')
Song.create!(name:'Ask Me Why', albom_id: '13')

Song.create!(name:'A Hard Day’s Night', albom_id: '14')
Song.create!(name:'Tell Me Why', albom_id: '14')
Song.create!(name:'I Should Have Known Better', albom_id: '14')

Song.create!(name:'Drive My Car', albom_id: '15')
Song.create!(name:'You Won’t See Me', albom_id: '15')
Song.create!(name:'The Word', albom_id: '15')

Song.create!(name:'Back in the U.S.S.R', albom_id: '16')
Song.create!(name:'Blackbird', albom_id: '16')
Song.create!(name:'Helter Skelter', albom_id: '16')
