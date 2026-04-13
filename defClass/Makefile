# Executable name
NAME = defClass

# Compiler and flags
CC = cc
CFLAGS = -Wall -Wextra -Werror

# Installation path (system-wide)
INSTALL_PATH = /usr/local/bin

# Source file
SRC = defClass.c

# Default rule: compile the executable
all: $(NAME)

$(NAME): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(NAME)
	@echo "\033[0;32m[+] Compilation successful:\033[0m $(NAME)"

# Remove the binary from the local directory
clean:
	rm -f $(NAME)
	@echo "\033[0;31m[-] $(NAME):\033[0m Binary removed!"

# Install the executable to the system path
install: $(NAME)
	sudo cp $(NAME) $(INSTALL_PATH)
	@echo "\033[0;32m[+] Installed to:\033[0m $(INSTALL_PATH)"

# Remove the executable from the system path
uninstall:
	sudo rm -f $(INSTALL_PATH)/$(NAME)
	@echo "\033[0;31m[-] Uninstalled from:\033[0m $(INSTALL_PATH)"

# Rebuild the project
re: clean all

.PHONY: all clean install uninstall re
