function path_add -d "Add supplied paths to $PATH if it exits but not yet in $PATH";
    for p in $argv
	if not contains $p $PATH; and test -d $path
	    set PATH $p $PATH
	end
    end
end
