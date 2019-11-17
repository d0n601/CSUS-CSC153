# Independent Project: Anti-Forensics  
### CSC 153 - Computer Forensics Principles and Practice


## Encryption  
Yay VeraCrypt!  

## Stenography  
### Hiding Data in Bad Blocks
Before doing anything, we should have already created an encrypted container via VeraCrypt, that contains a hidden volume. Next, we plugin a USB drive and see where the drive is at via `sudo fdisk -l`. The following steps will assume it's `/dev/sdc`.  

0. Zero out the drive `sudo dd if=/dev/zero of=/dev/sdc status=progress`.

1. Create our inner partition of `56.32MB`. The starting point is sector `2630`, and it is `110000` sectors, all `512B` each.
```bash
sudo sfdisk /dev/sdc << EOF
2630,110000,6
EOF
```  

2. Make a `FAT 16` file system for the inner partition.  

```bash
sudo mkfs.vfat -F 16 /dev/sdc1
```

3. Place our encrypted container inside this partition.

4. Unmount the drive via `sudo umount/dev/sdc1`.

5. Create an outer partition that takes up all the space on the drive. This will consume the entire inner partition.  
```bash
sudo sfdisk /dev/sdc << EOF
,,6
EOF
```

6. Build a file of bad blocks, to set when creating the file system for the outer partition. In this case we will start at block `288` and go to block `58000`. Each block is `1kb`, so the size of this comes out to be about `57.7KB`. The reason that this is slightly larger than our inner partition is because we're padding the size a bit to account for poor calculations.  
```bash
seq 288 58000 > /tmp/badblocks
```

7. Make a `FAT 16` file system for the outer partition, marking the blocks of the inner partition as bad. This will prevent the outer partition from using these blocks.  
```bash
sudo mkfs.vfat -F 16 -l /tmp/badblocks /dev/sdc1
```

8. Fill the outer partition with harmless data.


#### Further Information  
Switching between partitions to access data is simple. The hidden partition can be accessed again by unmounting the drive and using the command from step 1. To toggle to the outer partition, unmount and enter the command from step 5. Repeat those two processes as necessary.

We're going to take an image of the drive with the outer partition mounted for a forensic analysis.
```bash
dcfldd if=/dev/sdc1 of=/home/x/Research/CSUS-CSC153/Project/crime.dd conv=noerror,sync hash=md5 hashwindow=0 hashlog=/home/x/Research/CSUS-CSC153/Project/crime.md5.txt
```


### Analysis of Encrypted Data Hidden in Bad Blocks
Encrypted data hidden in bad blocks.

## Destroying Data
### Data Destruction with dd  
See dis [ddKillDisk.sh](./ddKillDisk.sh)  

## References
1. [davidverhasselt.com](https://davidverhasselt.com/hide-data-in-bad-blocks/)
