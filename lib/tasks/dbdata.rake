namespace :dbdata do
  desc "user article comment table show"
  task :uac_table => :environment do
    User.all.each do |user|
      puts "name: " + user.name

      user.articles.each do |article|
        puts "title: " + article.title + ", text: " + article.text
       
        article.comments.each do |comment|
          puts "commenter: " + comment.commenter + ", body: " + comment.body
        end
      end
    end
  end
end
