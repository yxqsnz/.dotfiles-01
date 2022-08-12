source ~/.asdf/asdf.fish
if not test -d ~/.config/fish/completions
	mkdir -p ~/.config/fish/completions
	ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end
