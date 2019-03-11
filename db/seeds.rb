admin = Admin.new([
    {email: "drwoodgrain@gmail.com", 
    password: "tinman1963", 
    password_confirmation: "tinman1963"},
    {email: "rskompinski@gmail.com", 
    password: "tinman1963", 
    password_confirmation: "tinman1963"}
])
admin.save!