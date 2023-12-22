# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

User.destroy_all

jack = User.new(
  nickname: "jack",
  email: "jack@caraibes.com",
  password: "password",
  description: "Jack Sparrow, célèbre pirate au charisme inégalable, navigua sur les flots tumultueux des mers du monde avec audace et ingéniosité. Au fil de ses périples, entre trésors cachés et batailles épiques, il développa un art de la narration captivant. Son insatiable curiosité pour les histoires et son talent pour raconter ses propres exploits devinrent sa marque de fabrique. Ébloui par la magie de ses récits, le jeune Jack trouva sa voie dans le journalisme. Il canalisa sa passion pour l'aventure en des récits exaltants, transportant ses lecteurs dans un univers vibrant où l'impossible devenait tangible. Ses expériences en mer, empreintes d'adrénaline et de découvertes, façonnèrent un journaliste intrépide, partageant ses chroniques comme autant de voyages envoûtants au cœur de l'inconnu. Jack Sparrow, l'ancien pirate, se transforma en conteur émérite des mers, captivant le monde avec ses récits extraordinaires, prouvant ainsi que l'aventure peut aussi s'écrire entre les lignes d'un journal."
)
photo = URI.open("https://ladepeche24.com/wp-content/uploads/2021/04/C-2.jpg")
jack.photo.attach(io: photo, filename: "jack-picture", content_type: 'image/jpg')
jack.save!

frodon = User.new(
  nickname: "frodon",
  email: "frodon@terredumilieu.com",
  password: "password",
  description: "Après avoir terminé sa quête épique pour détruire l'Anneau Unique, Frodon Sacquet, inspiré par son expérience et sa connaissance des événements incroyables qu'il a vécus, ressent le besoin de partager ces histoires captivantes avec le reste du monde. Sa passion pour l'écriture et son désir de communication le poussent à devenir un chroniqueur renommé.

  Frodon se tourne vers le journalisme, utilisant ses compétences acquises au cours de son voyage pour devenir un reporter talentueux. Sa capacité à décrire avec détail les péripéties, les cultures variées rencontrées et les leçons tirées de son aventure extraordinaire devient sa marque de fabrique. Il rédige des articles fascinants, transportant les lecteurs dans un monde imaginaire et les captivant avec ses récits incroyables.

  Armé de sa perspicacité, de sa sensibilité aux histoires et de sa compréhension des enjeux, Frodon Sacquet devient un journaliste respecté, utilisant ses écrits pour inspirer, informer et divertir le public avec la même passion et le même courage qu'il avait démontrés lors de sa quête pour sauver la Terre du Milieu."
)
photo = URI.open("https://pbs.twimg.com/profile_images/614753628491005952/QxQ7anEp_400x400.jpg")
frodon.photo.attach(io: photo, filename: "frodon-picture", content_type: 'image/jpg')
frodon.save!

5.times do
  post = Post.new(
    user: jack,
    title: Faker::Lorem.paragraph(sentence_count: 2),
    summary: Faker::Lorem.paragraph(sentence_count: 20),
    citation: Faker::Lorem.paragraph(sentence_count: 7),
    content: Faker::Lorem.paragraph(sentence_count: 100),
    publication_date: Date.today,
    url: "www.google.com",
  )
  post.save!

  3.times do
    Comment.create!(
      user: frodon,
      post: post,
      content: Faker::Lorem.paragraph(sentence_count: 6)
    )
  end
end
