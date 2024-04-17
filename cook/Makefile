all: recipe
	mkdir -p pkgs/HowToCook/
	fish main.fish https://github.com/Anduin2017/HowToCook/blob/master <./recipe >pkgs/HowToCook/spell.fish # TODO 应该生成一个中间文件，好给？加内容的，本TODO有两份

recipe:
	curl -L https://github.com/Anduin2017/HowToCook/raw/master/README.md -o recipe # TODO can be very slow, what to do?

.PHONY: all
