#include <sys/mman.h>

int main(void)
{
    mmap(NULL, 10, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    return 1;
}