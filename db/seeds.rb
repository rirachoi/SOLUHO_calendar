User.destroy_all
Event.destroy_all

u1 = User.create(
  :username => 'Rira Choi',
  :email => 'rira.nunu.choi@gmail.com',
  :dob => '1987-05-22',
  :image => 'http://i.imgur.com/gBToxxb.gif',
  :password => 'abcd',
  :password_confirmation => 'abcd',
  :is_admin => true
  )

u2 = User.create(
  :username => 'Jane Austen',
  :email => 'janeausten@hello.com',
  :dob => '1987-04-18',
  :image => 'http://a3.files.biography.com/image/upload/c_fill,g_face,h_300,q_80,w_300/MTE1ODA0OTcxNTQ2ODcxMzA5.jpg',
  :password => 'abc',
  :password_confirmation => 'abc'
  )

e1 = Event.create(
  :name => 'Meeting',
  :date => "2014-04-22",
  :image => 'http://i.imgur.com/VgujmI2.png?1',
  :user_id => u1.id
  )
e2 = Event.create(
  :name => 'My Birthday',
  :date => "2014-05-22",
  :image => 'http://i.imgur.com/7NfALqS.png?1',
  :user_id => u1.id
  )
e3 = Event.create(
  :name => 'Joel\'s babyshower',
  :date => "2014-09-20",
  :image => 'http://i.imgur.com/QgyWEnt.png?1',
  :user_id => u1.id
  )
e4 = Event.create(
  :name => 'David\'s Wedding',
  :date => "2015-04-12",
  :image => 'http://i.imgur.com/pEZwa3W.png?1',
  :user_id => u1.id
  )
e5 = Event.create(
  :name => 'Going to Melbourne',
  :date => "2014-09-27",
  :image => 'http://i.imgur.com/OcIn4ds.png?1',
  :user_id => u1.id )
e6 = Event.create(:name => 'Valentine\'s Day',
  :date => "2014-02-14",
  :image => 'http://i.imgur.com/VfuWprd.png?1',
  :user_id => u1.id
  )
e7 = Event.create(
  :name => 'Presentation Project1',
  :date => "2014-09-04",
  :image => 'http://i.imgur.com/f10BbHs.png?1',
  :user_id => u1.id
  )
e8 = Event.create(
  :name => 'GA Workshop',
  :date => "2014-09-13",
  :image => 'http://i.imgur.com/q4shvdS.png?1',
  :user_id => u1.id
  )
e9 = Event.create(
  :name => 'Ruby Conference',
  :date => "2014-09-19",
  :image => 'http://i.imgur.com/5PrjrVs.png?1',
  :user_id => u1.id
  )
e10 = Event.create(
  :name => 'Movie Day',
  :date => "2014-09-14",
  :image => 'http://i.imgur.com/tAT8AUw.png?1',
  :user_id => u1.id
  )
e11 = Event.create(
  :name => 'WDI5 Party',
  :date => "2014-09-04",
  :image => 'http://i.imgur.com/BIrp93l.png?1',
  :user_id => u1.id
  )
e12 = Event.create(
  :name => 'Larlyn\'s B-day',
  :date => "2014-12-27",
  :image => 'http://i.imgur.com/7NfALqS.png?1',
  :user_id => u1.id
  )
e13 = Event.create(
  :name => 'My Birthday',
  :date => '2014-4-18',
  :image => 'http://i.imgur.com/7NfALqS.png?1',
  :user_id => u2.id
  )
e14 = Event.create(
  :name => 'Meet and Greet',
  :date => "2014-09-10",
  :image => 'http://i.imgur.com/VgujmI2.png?1',
  :user_id => u1.id
  )

