# The example mounts “//dartfs-hpc/rc/lab/I/ImaginaryLab” on the mount point “/mnt” using the NetID credential for “f123456”.
# “localme” is your username locally on the Linux system.  Replace those elements of the command with appropriate values
# for your situation. 

sudo mount -t cifs -o username=f006fkc,domain=KIEWIT.DARTMOUTH.EDU \
-o vers=3.0,file_mode=0660,dir_mode=0770,uid=thadryan \
//dartfs-hpc.dartmouth.edu/rc/home/c/f006fkc /mnt

# to see if the connect is available, use this:
# smbclient -U f006fkc@KIEWIT.DARTMOUTH.EDU -L dartfs-hpc
# mount error: could not resolve address for dartfs-hpc.dartmouth.edu: Unknown error
