# Activity 7: Data Hiding and Steganography 
### CSC 153 - Computer Forensics Principles and Practice  

## Objectives  
* Practice data hiding techniques.
* Use S-Tools to do image Steganography.
* Use Winhex to hide data.

### Part 1: Software installation
First we download [**S-Tools4**](https://packetstormsecurity.com/files/21688/s-tools4.zip.html) and install it on our workstation. 
![0_download_packet_storm](./images/0_download_packet_storm.png)  
**Figure 1:** Downloading S-Tools4. 

### Part 2: Create a steganography file using S-Tools  
In File Explorer, we navigate to the directory where we've installed [**S-Tools4**](https://packetstormsecurity.com/files/21688/s-tools4.zip.html) and start the program `S-
Tools.exe`.  
![1_stools_installed](./images/1_stools_installed.png)  
**Figure 2:** `S-Tools.exe` opened.  

Next we download `fun.bmp` from Canvas or google drive and save it in our work directory.
The google drive link is: `https://drive.google.com/file/d/1LL1pzZQ10Tz0RZUmL1js7Kp6Ux-n4LJ4/view?usp=sharing`.  
![2_download_bmp](./images/2_download_bmp.png)  
**Figure 3:** Downloading `fun.bmp` from Google Drive.  

We then drag `fun.bmp` from our work folder to the S-Tools window.  
![3_drag_drop](./images/3_drag_drop.png)  
**Figure 4:** After dragging `fun.bmp` into S-Tools.  

To hide information in our image file, we first must create a text file `secret_message.txt` and type our secret message into the file.  
![4_write_secret](./images/4_write_secret.png)  
**Figure 5:** Creating our secret message.  

After that we drag `secret_message.txt` from our work folder to the `fun.bmp` image. In the Hiding dialog box, we type `secret` in the Passphrase and Verify passphrase text boxes, and
then click `OK`.  
![5_hiding_data](./images/5_hiding_data.png)  
**Figure 6:** Hiding secret message inside image.  

  
After the hidden data window opens, we right click the window and click Save as. We'll save the image as `fun-steg.bmp` in your work folder.  
![6_fun_steg](./images/6_fun_steg.png)  
**Figure 7:** Saving `fun-steg.bmp`.