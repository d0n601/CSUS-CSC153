# Lab 3: Lab 3 Examining NTFS Disks
### CSC 153 - Computer Forensics Principles and Practice

## Objectives  
* Become familiar with the WinHex forensics tool.
* Use WinHex to explore the MFT and be able to analyze both resident and non-resident files.


## Part 1: Explore MFT of a file.  

To begin, we create a text file named `forensicsclass.txt` and put it on our Desktop.  
![1_create_forensicsclass_file](./images/1_create_forensicsclass_file.png)  
**Figure 1:** Create text file `forensicsclass.txt`.  

In the file, we type `We will have a forensics class on Monday`.  

![1_message_in_text_file](./images/1_message_in_text_file.png)  
**Figure 2:** We will have a forensics class on Monday.  

Next we append an alternate data stream containing ` If you study hard, then you are likely to succeed` to the file via the command below.

```console
echo If you study hard, then you are likely to succeed > forensicsclass.txt:secret
```  
  

![1_append_datastream](./images/1_append_datastream.png)  
**Figure 3:** Appending alternate data stream `secret` to `forensicsclass.txt`.  

We can now display that data stream via the command `more < forensicsclass.txt:secret`.  
![1_display_stream](./images/1_display_stream.png)  
**Figure 4:** Displaying alternate data stream `secret` for `forensicsclass.txt`.

Next,  we examine the metadata of the `forensicsclass.txt` file stored in the `$MFT` file. First we run WinHex as an administrator.  
![1_winhex_admin](./images/1_winhex_admin.png)  
**Figure 5:** Launching WinHex in administrator mode..

As safety precaution, click `Options -> Edit Mode` and select `Read-Only Mode (=write protected)` from the `Select Mode` dialog box.  
![1_readonly](./images/1_readonly.png)  
**Figure 6:** Set Edit Mode to Read-Only.  


To examine or disk, we click `Tools -> Open Disk` from the menu. In the View Disk dialog box we select the `C:` drive and then click OK.  
![1_select_c_drive](./images/1_select_c_drive.png)  
**Figure 7:** Selecting the `C:` drive as our disk to open.  

![1_traversing](./images/1_traversing.png)  
**Figure 8:** WinHex traversing the `C:` drive.  


Before we examine the disk we need to navigate to `Options -> Data Interpreter` from the menu. In the` Data Interpreter Options` dialog box, we click the `Win32 FILETIME (64 bit)` check box, shown in Figure 9, and then click OK. The Data Interpreter should then have FILETIME as an addition display item.  
![di_options](./images/1_di_options.png)  
**Figure 9:** Data Interpreter Option include `Win32 FILETIME (64 bit)`.  


Now in WinHex we need to navigate to where we saved `forensicsclass.txt` and click it.  
![1_navigate](./images/1_nagivate.png)  
**Figure 10:** Selecting `forensicsclass.txt`.  


Next we click at the beginning of the record, on the letter `F` in `FILE,` and then drag down and to the right while monitoring the hexadecimal counter in the lower-right corner. At offset `0x38` from the beginning of the MTF record we find the start of the attribute `0x10`.   
![1_0x01att](./images/1_0x01att.png)  
**Figure 11:** Attribute `0x01` at offset `0x38` from the start of the MFT record.

The file’s create date and time can be found from offset `0x18` to `0x1F` from the beginning of attribute `0x10`.  In the same manner we used above, we can determine the files created date and time to be `11/10/19 17:26:00`.  
![1_created_date_time](./images/1_created_date_time.png)  
**Figure 12:** File created date and time for `forensicsclass.txt`.  



### Questions for Part 1  
1. According to the data interpreter, what is the file create date and time for the file `forensicsclass.txt`?  
    * The created date and time for `forensicsclass.txt` is **11/10/19 17:26:00**. It's found from offset `0x18` to `0x1F` from the beginning of  the attribute `0x10`. It should be noted that this is with the box for `Timestamps based on UTC` selected.    
    ![1_created_date_time](./images/1_created_date_time.png)  
    **Figure 13:** File created date and time for `forensicsclass.txt`.

2. What is the size of the MFT record?
    * The size of the MTF record is, in big endian, is `00 00 04 00` . We can find that at offset `0x1C to 0x1F` from attribute `0x00`.  
    ![1_mft_size](./images/1_mft_size.png)    
    **Figure 14:** The size of the MTF record for `forensicsclass.txt` is `0x0400`.

3. What is the length of the header?  
	* The header length for the MFT record is `0x` . This can be found at offset `0x14` from `0x00`.
	![1_header_length](/images/1_header_length.png)  
	**Figure 15:** The length of the MTF record header for `forensicsclass.txt` is `0x38`.  

4. What is the file’s last modified date and time?  
	* The file’s last modified date and time is  **11/10/19 17:26:00** . We can find that information at offset `0x20` to `0x27` from attribute `0x10` . It should be noted that this is with the box for `Timestamps based on UTC` selected.  
	![1_created_date_time](./images/1_created_date_time.png)  
    **Figure 16:** File last modified date and time for `forensicsclass.txt`.


5. How many `0x30` attributes does this file have? Why?  
   * There are **two** attribute `0x30`s'. This is because our file name is longer than 8 characters, so we have a **short file name**, and a **long file name**. 

6. What is the name of this file?
   * As stated above there are two file names, a short file name and long file name.
   * Short file names are found at offset `0x5A` from the **first** `0x30` attribute. Our short file name is `FORENS~1.TXT`. 
   ![1_shotfile_name](./images/1_shotfile_name.png)    
   **Figure 17:** The short file name at `0x5A` from the first `0x30` attribute.    
   * Long file names are found at offset `0x5A` from the **second** `0x30` attribute. Our short file name is `forensicsclass.txt`.
   ![1_longfile_name](./images/1_longfile_name.png)  
   **Figure 18:** The long file name at `0x5A` from the second `0x30` attribute.

7. Is this file a resident file or nonresident file? Where can you find the evidence?  
	* The resident/nonresident flag exists at offset `0x08` from attribute `0x80` . In this case we can see it is a **resident file**. This makes sense because it is only `40` Bytes in size.  
	![1_resident_file](./images/1_resident_file.png)  
	**Figure 19:** The resident/non-resident flag set to `0x00`, meaning resident.


8. Did you find the hidden message in the file when you check the MFT record?   
	* Yes, it was not difficult to find the hidden message. It lies inside of a second `0x80` attribute, and is easily found by looking at the `ascii` screen on WinHex.
	![1_secret_message](./images/1_secret_message.png)  
	**Figure 20:** The secret message contained in the second `0x80` attribute.  

	* More specifically, it's located in the data run for the second `0x80` attribute at offset `0x18`.  
	![1_secret_datarun](./images/1_secret_datarun.png)  
	**Figure 21:** Secret message contained inside of the data run for the second `0x80` attribute.


9. How many `0x80` attributes does this file have? What is the possible reason?  
	* The reason for this would be the **hidden data stream**. This creates an additional `0x80` attribute for the stream. We can verify this by going to offset `0x18` for the second `0x80` attribute. This is where the data run is for resident files. This contains the secret message.  
	![1_secret_datarun](./images/1_secret_datarun.png)  
	**Figure 22:** Secret message contained inside of the data run for the second `0x80` attribute.