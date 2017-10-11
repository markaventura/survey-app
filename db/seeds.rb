def save_obj obj
  if obj.save
  else
    puts "ERROR >>>>>>> #{obj.class.name} --> #{obj.errors.full_messages}"
  end
end

# NOTE: seed for populating roles
[
  {
    name: 'admin', 
    code: 'admin'
  }
].each do |role|
  Role.find_or_create_by(role)
end

# NOTE: seed admin user
[
  {
    full_name: 'Mark Aventura',
    email: 'admin@survey.com',
    password: "password"
  }
].each do |admin|
  user = User.find_or_initialize_by(email: admin[:email])
  user.update(admin)
  save_obj(user)

  role = Role.find_by(code: 'admin')
  role.user_roles.find_or_create_by(user_id: user.id)
end

# NOTE: seed default questions
[
  { question: "What is your favorite book?" },
  { question: "Who is your favorite band?" },
  { question: "What is your favorite food?" }
].each do |question|
  DefaultQuestion.find_or_create_by(question: question[:question])
end
