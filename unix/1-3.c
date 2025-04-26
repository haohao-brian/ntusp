// list all the file name uder path

#include "apue.h"
#include <dirent.h>
int main(int argc, char *argv[])
{
  DIR *dp;
  struct dirent *dirp;
  if (argc != 2)
    printf("fail\n");             // from textbook:  err_quit("usage: ls directory_name");
  if ((dp = opendir(argv[1])) == NULL)
    printf("fail\n");             // from textbook:  err_sys("can’t open %s", argv[1]);
  while ((dirp = readdir(dp)) != NULL)
    printf("%s\n", dirp->d_name);
  closedir(dp);
  exit(0);
}
