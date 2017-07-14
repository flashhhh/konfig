function fish_prompt
  set_color -o red
  set -l filepath ~/.config/fish/functions/emoji.txt
  set -l random_emoji (bash -c "head -\$((\${RANDOM} % `wc -l < $filepath` + 1)) $filepath | tail -1")
  echo -n -s -e "\n$random_emoji  "
end
