role :libs, "staging.chasejensen.com"

task :search_libs do
  run "ls -x1 /usr/lib | grep -i xml"
end

task :count_libs do
  run "ls -x1 /usr/lib | wc -l"
end
