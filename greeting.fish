function fish_greeting
    if type -q fortune; and test -d ~/.fortunes
	fortune ~/.fortunes
    end
end
