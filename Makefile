all: source/mozconfig source/comm nixpkgs-mozilla
	cd source; ./mach build

nixpkgs-mozilla:
	git clone https://github.com/mozilla/nixpkgs-mozilla.git
	sed -i '' 's~/\\* \\("x86_64-darwin"\\) \\*/~\\1~' nixpkgs-mozilla/release.nix

source:
	hg clone https://hg.mozilla.org/mozilla-central source/
source/comm: source
	hg clone https://hg.mozilla.org/comm-central source/comm/
	#cd source && ./mach bootstrap
source/mozconfig: source
	echo 'ac_add_options --enable-application=comm/mail' > source/mozconfig
	echo 'ac_add_options --enable-debug' >> source/mozconfig
	echo 'ac_add_options --enable-calendar' >> source/mozconfig
