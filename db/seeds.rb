user = User.create!(
  email: "user@user.com",
  password: "123456"
)

puppy = Dog.create!(
  born_on: Date.today - 14.days,
  user: user,
  name: "Youngin"
)

dog = Dog.create!(
  born_on: Date.today - 8.months,
  user: user,
  name: "Adolin"
)

old_mutt = Dog.create!(
  born_on: Date.today - 8.months,
  user: user,
  name: "Old Mutt"
)
