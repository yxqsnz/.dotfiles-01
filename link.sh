link() {
	SRC="$(realpath $1)"
	OUT="$2"
	if [[ "$3" == "-p" ]]; then
		export IS_DIR=true
	else 
		export IS_DIR=false
	fi
	check() {
		if $IS_DIR; then
			return $(test -d $1)
		else 
			return $(test -f $1)
		fi
	}
	if ! check $OUT; then
		ln -s "${SRC}" "${OUT}"
		echo "[✓] link ${SRC}"
	else
		echo "[✗] skipped ${SRC}"
	fi
}
link home-manager ~/.config/nixpkgs -p
link cargo-config.toml ~/.cargo/config.toml
link .doom.d ~/.doom.d -p
