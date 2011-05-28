namespace :test do
  namespace :coverage do
 
    task :clean do
      rm_f "test/coverage"
      rm_f "test/coverage.data"
      Rcov = "rcov --rails --aggregate test/coverage.data -Ilib \
                     --text-summary -x 'bundler/*,gems/*'"
    end
   
    def display_coverage
      system("launch test/coverage/index.html")
    end
   
    desc 'Measures unit test coverage'
    task :unit => :clean do
      system("#{Rcov} --html test/unit/*_test.rb")
      display_coverage
    end
   
    desc 'Measures functional test coverage'
    task :func => :clean do
      system("#{Rcov} --html test/functional/*_test.rb")
      display_coverage
    end
   
    desc 'All unit test coverage'
    task :all => :clean do
      system("#{Rcov} --html test/*/*_test.rb")
      display_coverage
    end
   
  end
 
  task :coverage do
    Rake::Task["test:coverage:all"].invoke
  end
end
