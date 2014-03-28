#include <stdio.h>
#include <stdlib.h>
#include <time.h>

const unsigned long long size = 128ULL * 1024ULL;
unsigned long long a[size];

int main(int argc, char** argv)
{
   if (argc != 3)
   {
      printf("Usage: test <mb_to_write> <output_file>, e.g. test 4 ramdisk/out.bin\n");
      exit(EXIT_FAILURE);
   }
   unsigned long long megabytes_to_write = atoi(argv[1]);
   const char * filepath = argv[2];

   printf("Writing %lld Mb to file.\n", megabytes_to_write);

    FILE* pFile;
    pFile = fopen(filepath, "wb");
    for (unsigned long long j = 0; j < megabytes_to_write; ++j){
        //Some calculations to fill a[]
        fwrite(a, 1, size*sizeof(unsigned long long), pFile);
    }
    fclose(pFile);

    return 0;
}
