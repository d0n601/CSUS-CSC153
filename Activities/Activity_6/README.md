# Activity 6: Recovering Graphics Files  
### CSC 153 - Computer Forensics Principles and Practice  

## Objectives  
* Split and combine files in Linux.
* Use WinHex to recover graphics files.


### Part 1: Split and combine files in Linux.  
Since evaluation version of Winhex cannot process files larger than 200KBs, we must split the file into pieces in order to edit it.    

The first step is to download the file `funpicture` from Canvas onto our local Linux machine.    
![1_download_fun_picture](./images/1_download_fun_picture.png)    
**Figure 1:** Downloading `funpicture` to our local machine.  

We then open the terminal and navigate to the directory that cointains this file.    
![1_cd_to_filelocation](./images/1_cd_to_filelocation.png)  
**Figure 2:** Change directory to where we've downloaded `funpicture`.  

 Now we must split the file via the split command `split –b 19000 funpicture`.  
![1_split_funpicture](./images/1_split_funpicture.png)  
**Figure 3:** Splitting `funpicture` file, and listing results.  

After splitting the file we recombine it with the command `cat x*>newfun`.    
![1_recombine](./images/1_recombine.png)  
**Figure 4:** Recombining the image with the `cat` command.  

The last step for part 1 is to rename the combined file to include the `.jpg` extension, via `mv newfile newfile.jpg`.  
![1_mv_rename](./images/1_mv_rename.png)  
**Figure 5:** Rename `newfile` to `newfile.jpg`.  

  
### Part 2: Practice recovering graphics files using Winhex.  

Now we download the file `smallsmallsmall` from Canvas and save it to our working directory folder. This file is a `PNG` file, but the
header has been modified by the suspect.  
![2_download_smallsmall](./images/2_download_smallsmall.png)  
**Figure 6:** Downloading `smallsmallsmall` to our local machine, in a shared folder with our the Windows VM.  

Now we boot our Windows VM and start WinHex with the Run as administrator option.  
![2_run_winhex_admin](./images/2_run_winhex_admin.png)  
**Figure 7:** Launching WinHex as Admin. 


As a safety precaution, we click `Options -> Edit Mode` from the menu. In the Select Mode dialog box,  we click `Read-Only Mode (=write protected)`, as shown in Figure 8, and then click OK.  
![2_readonly](./images/2_readonly.png)    
**Figure 8:** Select read-only mode for safety.  


Next we click `Tools -> Open Disk` from the menu. In the View Disk dialog box, we click the drive where you saved `smallsmallsmall`. In our case we've moved the file to the `Desktop`, so we'll select the `C:` drive.  
![2_select_c_drive](./images/2_select_c_drive.png)  
**Figure 9:** Selecting the `C:` drive to open and examine.  

After we click `Ok` WinHex beings traversing the `C:` drive.  
![2_grabbing_c](./images/2_grabbing_c.png)  
**Figure 10:** WinHex traversing our `C:` drive.  


Now we scroll down and find the `$MFT` file, right click and choose open. We open the MFT file in a new window as seen in the figure 11 below.  2
![2_open_MFT](./images/2_open_MFT.png)  
**Figure 11:** Opening `$MFT` to seach for our file. 


The next task is to find the `smallsmallsmall` file. In the `$MFT`, characters in a file name are usually separated by hexadecimal value `00`. The hexidecimal value for the *small* is `73 6d 61 6c 6c`. Separating each character with `00` it becomes `73 00 6d 00 61 00 6c 00 6c`. Repeating this three times to get *smallsmallsmall* becomes `73006D0061006C006C0073006D0061006C006C0073006D0061006C006C`.  

We click `Search -> Find Hex Values`, and query the hexidecimal string we calculated above.  
![2_fine_hex](./images/2_fine_hex.png)  
**Figure 12:** Searching for the hexidecimal title of `smallsmallsmall`.  

After our search we can see that there is a hit.  
![2_found_small](./images/2_found_small.png)  
**Figure 13:** A it for the hexidecimal search.  







