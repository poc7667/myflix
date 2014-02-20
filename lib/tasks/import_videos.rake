desc "import videos"

namespace :import do
  task :videos => :environment do
    require 'faker'
    require 'ap'
    require 'pry'

    movies = []
    get_movie_list(movies)
    get_covers(movies)

    #try to fetch covers

    # Video.create(
    #     title: 'abs'
    #     )
  end

  def get_movie_list(movies)
      prev_path = Dir.pwd
      Dir.chdir("lib/tasks")
      files = Dir.glob("*video*txt")
      files.each do |file|
          f = open(file, 'r')
          f.each_line do |line|
            movie_title = line.gsub(/(\d+:\d+:\d+)(.*)/, '\2').strip()
            movies << movie_title
          end
      end
      Dir.chdir prev_path
  end

  def get_covers(movies)
    prev_path = Dir.pwd
    _prefix_path = "public/tmp/"
    Dir.chdir(_prefix_path)
    small_covers =  Dir.glob("small/*")
    # large_covers =  Dir.glob("large/*")
    covers = small_covers.collect do |cover|
      cover.gsub( /(.*?\/)(.*)/, '\2') 
    end
    movies.each do |movie|
      ap(movie)  
      ap(Faker::Lorem.paragraphs(2..8).join(''))
      cover_fname = covers.sample
      small_cover_path = "#{_prefix_path}/small/#{cover_fname}"
      large_cover_path = "#{_prefix_path}/large/#{cover_fname}"
      Video.create(
        title: movie,
        description: Faker::Lorem.paragraphs(2..8).join(''),
        small_cover_url: small_cover_path,
        large_cover_url: large_cover_path,
        )

    end
    Dir.chdir prev_path
  end
end

