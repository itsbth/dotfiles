# Get a list of all .fnl files
# FNL_FILES := $(wildcard *.fnl)
FNL_FILES := $(shell find . -type f -name "*.fnl")

# Convert the list of .fnl files to .lua files
LUA_FILES_TO_DELETE := $(FNL_FILES:.fnl=.lua)

# Rule to delete .lua files that have a corresponding .fnl file
clean-lua:
	@for file in $(LUA_FILES_TO_DELETE); do \
		if [ -f $$file ]; then \
			echo "Deleting $$file"; \
			echo rm $$file; \
		fi; \
	done

