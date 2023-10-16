##
## Makefile to compile ex1
##

SRC			=	main.asm
OBJ			=	$(SRC:.asm=.o)
NAME		=	ex1

LD			=	ld
AS			=	nasm
AS_FLAGS	=	-f elf64
LD_FLAGS	=	

all: $(NAME)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

$(NAME): $(OBJ)
	$(LD) $(LD_FLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(AS) $(AS_FLAGS) $< -o $@
