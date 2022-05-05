#include "util.h"

void my_itoa(int i, char* buffer)
{
    snprintf(buffer, sizeof(buffer),"%d",i);
}