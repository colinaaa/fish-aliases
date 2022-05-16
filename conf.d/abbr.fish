function create_abbr -d "Create abbreviation"
  set -l name $argv[1]
  set -l body $argv[2..-1]
  abbr -a $name $body
end

create_abbr gz git cz
create_abbr npmr npm run

