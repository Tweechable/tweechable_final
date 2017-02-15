Lesson.delete_all
Tweet.delete_all
Mention.delete_all
User.delete_all
Contribution.delete_all
Educatee.delete_all

User.create(name: 'Kurt Cobain', email: 'admin@example.org', password: 'admin!', password_confirmation: 'admin!', how_found_tweechable: "Friend!", admin:true)
u1 = User.create(name: 'Grace Hopper', email: 'grace@example.org', password: 'cobol!', password_confirmation: 'cobol!', how_found_tweechable: "Friend!", admin:false)
u2 = User.create(name: 'Cookie Monster', email: 'cookie@example.org', password: 'cookies', password_confirmation: 'cookies', how_found_tweechable: "Twitter!", admin:false)

l1 = Lesson.new
l1.hash_tag = "#test1"
l1.created_at = 20071120
l1.updated_at = 20071119
l1.category = "test"
l1.description = "A first test lesson"
l1.approved = true
l1.save

Tweet.create(lesson_id: l1.id, text: "Test 1, tweet 1", approved: true)
Tweet.create(lesson_id: l1.id, text: "Test 1, tweet 2", approved: true)
Tweet.create(lesson_id: l1.id, text: "Test 1, tweet 3", approved: true)
Tweet.create(lesson_id: l1.id, text: "Test 1, tweet 4", approved: true)
Tweet.create(lesson_id: l1.id, text: "Test 1, tweet 5", approved: true)

l2 = Lesson.new
l2.hash_tag = "#test2"
l2.created_at = 20071119
l2.updated_at = 20071119
l2.category = "test"
l2.description = "A second test lesson"
l2.approved = false
l2.save

Tweet.create(lesson_id: l2.id, text: "Test 2, tweet 1, not approved", approved: false)
Tweet.create(lesson_id: l2.id, text: "Test 2, tweet 1, approved", approved: true)
Tweet.create(lesson_id: l2.id, text: "Test 2, tweet 3, has a cited source", approved: true, cited_src: "https://en.wikipedia.org")
Tweet.create(lesson_id: l2.id, text: "Test 2, tweet 4, has a cited source, not approved", approved: false, cited_src: "https://en.wikipedia.org")

Contribution.create(user_id:u1.id, lesson_id:l1.id, creator:true)
Contribution.create(user_id:u1.id, lesson_id:l2.id, creator:true)
Contribution.create(user_id:u1.id, lesson_id:l1.id, creator:false)
Contribution.create(user_id:u1.id, lesson_id:l2.id, creator:false)

print "There are now #{User.count} users in the database.\n" #populated
print "There are now #{Lesson.count} lessons in the database.\n" #populated there is one lesson that's not approved. go to admin panel!
print "There are now #{Mention.count} mentions in the database.\n"
print "There are now #{Contribution.count} contributions in the database.\n"
print "There are now #{Tweet.count} tweets in the database.\n"
print "There are now #{Educatee.count} educatees in the database.\n"

