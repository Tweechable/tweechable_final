Lesson.delete_all
Tweet.delete_all
Mention.delete_all
User.delete_all
Contribution.delete_all
Educatee.delete_all

User.create username: 'Kurt Cobain', email: 'admin@example.org', password: 'admin', password_confirmation: 'admin',created_at:Time.new, updated_at: Time.new, how_found_tweechable: "Friend!",admin:true
u1 = User.create username: 'Grace Hopper', email: 'grace@example.org', password: 'cobol', password_confirmation: 'cobol',created_at:Time.new, updated_at: Time.new, how_found_tweechable: "Friend!",admin:false
u2 = User.create username: 'Cookie Monster', email: 'cookie@example.org', password: 'cookies', password_confirmation: 'cookies',created_at:Time.new, updated_at:Time.new, how_found_tweechable: "Twitter!",admin:false

l1 = Lesson.new
l1.hash_tag = "#betterwhiteperson"
l1.created_at = 20071120
l1.updated_at = 20071119
l1.category = "racisim"
l1.description = "How to be a better white person"
l1.approved = true
l1.save

l2 = Lesson.new
l2.hash_tag = "#blackonblackviolence"
l2.created_at = 20071119
l2.updated_at = 20071119
l2.category = "racism"
l2.description = "A common misconception"
l2.approved = true
l2.save

l3 = Lesson.new
l3.hash_tag = "#yesaboutslavery"
l3.created_at = 20071118
l3.updated_at = 20071119
l3.category = "slavery"
l3.description = "This is a common misconception and it is horrible"
l3.approved = true
l3.save

l4 = Lesson.new
l4.hash_tag = "#whiteprivilege"
l4.category = "privilege"
l4.created_at = 20071117
l4.updated_at = 20071119
l4.approved = true
l4.save

t11 = Tweet.new
t11.lesson_id = l1.id
t11.text = "Hi,I was asked to get in touch with you about not being a terrible white person"
t11.approved = true
t11.save

t12 = Tweet.new
t12.lesson_id = l1.id
t12.text = "people of color get this q a lot. Unfortunately, they don't get $ to respond.Good news is, we've curated great tweets for you!"
t12.approved = true
t12.save

t13 = Tweet.new
t13.lesson_id = l1.id
t13.text = "start reading/listening to all the great work that POC have already written → http://wapo.st/1DwWy71"
t13.approved = true
t13.save


t14 = Tweet.new
t14.lesson_id = l1.id
t14.text = "Step 2 is to reflect: thru discussion, esp w other white people, like @verywhiteguy and @whitefolkwork"
t14.approved = true
t14.save

t15 = Tweet.new
t15.lesson_id = l1.id
t15.text = "Step 3 is to act: donate time, talent, treasure to POC-led organizations and movements → http://byp100.org/"
t15.approved = true
t15.save

t16 = Tweet.new
t16.lesson_id = l1.id
t16.text = "feel free to connect with groups like BreakItDown or Showing Up for Racial Justice to learn more → http://bit.ly/1rvxgBe"
t16.approved = true
t16.save

t21 = Tweet.new
t21.lesson_id = l2.id
t21.text = "Hi @ignorant_tweeter, @overworked_activist asked me to get in touch with you about black-on-black violence"
t21.approved = true
t21.save

t22 = Tweet.new
t22.lesson_id = l2.id
t22.text = "sure, >90% blacks are killed by other blacks, but it's the same for every race in the US. 82% of whites are killed by other whites, this is the result of segregation.→ bit.ly/BoBViol1"
t22.approved = true
t22.save

t23 = Tweet.new
t23.lesson_id = l2.id
t23.text = "also consider that many people - black, white, others, are devoting their lives to interrupting violence in cities. We honor their efforts, but our focus is police violence. bit.ly/BoBViol2"
t23.approved = true
t23.save

t24 = Tweet.new
t24.lesson_id = l2.id
t24.text = "finally, @overworked_activist and I would like you to consider the structural issues that lead to a neighborhood having high incidence of violent crime: economic oppty, school & mental health $ bit.ly/BoBViol3"
t24.approved = true
t24.save

t25 = Tweet.new
t25.lesson_id = l2.id
t25.text = "if you have other questions on the issue, i'm happy to help further, or you can explore the syllabus here: bit.ly/BoBViolSyl"
t25.approved = true
t25.save

t31 = Tweet.new
t31.lesson_id = l3.id
t31.text = "Read the words of the men leading the Southern states in secession, who said clearly it was about slavery."
t31.approved = true
t31.save

t32 = Tweet.new
t32.lesson_id = l3.id
t32.text = "At the time of founding,important Confederate figures said it was about slavery, including secession statements from GA, SC, MS, etc.→ http://huff.to/1WarMcm"
t32.approved = true
t32.save

t33 = Tweet.new
t33.lesson_id = l3.id
t33.text = "In fact, Confederate VP Stephens said in the famous “cornerstone” speech “Our new Government is founded upon exactly the opposite ideas"
t33.approved = true
t33.save

t34 = Tweet.new
t34.lesson_id = l3.id
t34.text = "its foundations are laid, its cornerstone rests, upon the great truth that the negro is not equal to the white man…"
t34.approved = true
t34.save

t35 = Tweet.new
t35.lesson_id = l3.id
t35.text = "that slavery, subordination to the superior race, is his natural and normal condition. souce:http://bit.ly/1KfcIEu"
t35.approved = true
t35.save

t36 = Tweet.new
t36.lesson_id = l3.id
t36.text = "So, it appears the Civil War, and the existence of the Confederate States of America, was about slavery."
t36.approved = true
t36.save

t41 = Tweet.new
t41.lesson_id = l4.id
t41.text = "White privilege doesn’t mean your life isn’t hard. It means that you are on average better off than being a person of color."
t41.approved = true
t41.save

t42 = Tweet.new
t42.lesson_id = l4.id
t42.text = "What privilege doesn’t mean you didn’t work hard.  It means that your hard work went farther."
t42.approved = true
t42.save


t43 = Tweet.new
t43.lesson_id = l4.id
t43.text = "White privilege doesn’t mean your life isn’t hard. It means that you are on average better off than being a person of color."
t43.approved = true
t43.save

t44 = Tweet.new
t44.lesson_id = l4.id
t44.text = "White-sounding names got 50% more callbacks for the SAME RESUME than black-sounding names → http://bit.ly/1euCp1b"
t44.approved = true
t44.save

t45 = Tweet.new
t45.lesson_id = l4.id
t45.text = "Because of past and present policy in housing, education, and jobs, you or your family are more likely to have housing wealth."
t45.approved = true
t45.save

t46 = Tweet.new
t46.lesson_id = l4.id
t46.text = "less likely to have student debt, more likely to have accessed GI benefits, and much more → http://n.pr/1NklFiu"
t46.approved = true
t46.save

t47 = Tweet.new
t47.lesson_id = l4.id
t47.text = "in fact, white privilege extends to everything from AirBNB acceptance rates to apartment rentals"
t47.approved = true
t47.save

Contribution.create(user_id:u1.id,lesson_id:l1.id,creator:true)
Contribution.create(user_id:u1.id,lesson_id:l2.id,creator:true)
Contribution.create(user_id:u2.id,lesson_id:l3.id,creator:true)
Contribution.create(user_id:u2.id,lesson_id:l4.id,creator:true)
Contribution.create(user_id:u2.id,lesson_id:l4.id,creator:false)
Contribution.create(user_id:u1.id,lesson_id:l1.id,creator:false)
Contribution.create(user_id:u1.id,lesson_id:l2.id,creator:false)
Contribution.create(user_id:u2.id,lesson_id:l3.id,creator:false)


print "There are now #{User.count} users in the database.\n" #populated
print "There are now #{Lesson.count} lessons in the database.\n" #populated there is one lesson that's not approved. go to admin panel!
print "There are now #{Mention.count} mentions in the database.\n"
print "There are now #{Contribution.count} contributions in the database.\n"
print "There are now #{Tweet.count} tweets in the database.\n"
print "There are now #{Educatee.count} educatees in the database.\n"

