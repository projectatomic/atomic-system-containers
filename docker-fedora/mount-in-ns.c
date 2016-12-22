#define _GNU_SOURCE
#include <stdio.h>
#include <error.h>
#include <errno.h>
#include <dirent.h>
#include <fcntl.h>
#include <sched.h>
#include <stdlib.h>
#include <sys/mount.h>

int main(int argc, char *argv[])
{
  int ret, targetfd;
  char ns[PATH_MAX];

  if (argc <= 3)
    error (EXIT_FAILURE, 0, "Not enough params");

  sprintf (ns, "/proc/%s/ns/mnt", argv[1]);
  targetfd = open (ns, O_RDONLY);

  if (setns (targetfd, CLONE_NEWNS))
    error (EXIT_FAILURE, errno, "setns");

  umount2 (argv[3], MNT_DETACH);
  ret = mount (argv[2], argv[3], NULL, MS_MGC_VAL | MS_BIND | MS_REC, NULL);
  if (ret < 0)
    error (EXIT_FAILURE, errno, "mount");

  return 0;
}
