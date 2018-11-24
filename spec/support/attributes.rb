def movie_attributes(overrides = {})
  {
    title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
    director: "Jon Favreau",
    duration: "126 min",
    image_file_name: "moviemarathon.png"
  }.merge(overrides)
end

def review_attributes(overrides = {})
  {
    name: "Mr. Movie Guy",
    comment: "It was great!",
    stars: 5,
    location: "somewhere"
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: "Testy Testerton",
    email: "test@test.com",
    password: "testtesttest",
    password_confirmation: "testtesttest",
    username: "McTesty"
  }.merge(overrides)
end
