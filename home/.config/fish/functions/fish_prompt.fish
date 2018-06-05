function fish_prompt
  set_color -o red
  set -l filepath ~/.config/fish/functions/emoji.2.txt
  set -l random_emoji (bash -c "head -\$((\${RANDOM} % `wc -l < $filepath` + 1)) $filepath | tail -1")
  if [ -z "$SSH_TTY" ]
      set -x marker "$random_emoji"
  else
      set -x marker ">"
  end
  echo -n -s -e "\n$marker  "
end
