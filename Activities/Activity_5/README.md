# Activity 5: Use Winhex to Examine NTFS Disks  
### CSC 153 - Computer Forensics Principles and Practice  

## Objectives  
* Become familiar with the WinHex forensics tool.
* Use WinHex to become familiar with different file types.
* Use WinHex to explore and become familiar with the MFT, including headers and attributes.


### Part 1: Explore different file types

First we use Microsoft Word to create a new document named `Mywordnew.doc`, containing text `This is a test`. Then we open WinHex, navigate to the directory where our `.doc` file was saved, and open it. Lastly, we copy the file  hexadecimal header `D0 CF 11 E0 A1 B1 1A E1` to a new text document.  

Hexadecimal header for `.doc` file.  
```
Offset      0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F

00000000   D0 CF 11 E0 A1 B1 1A E1  00 00 00 00 00 00 00 00   �� ࡱ �  
```  

![doc_hex](./images/doc_hex.png)  
**Figure 1:** Header for Word 97-2003 Document `.doc`.  

These steps are repeated for the following file types.    
* `.xls`
* `.docx`
* `.xlsx`
* `.jpg`
* `.png`  

Screenshots and text for each file type can be found listed below.


Hexadecimal header for `.xls` file type.
```
Offset      0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F

00000000   D0 CF 11 E0 A1 B1 1A E1  00 00 00 00 00 00 00 00   �� ࡱ �  
```  

![xls_hex](./images/xls_hex.png)  
**Figure 2:** Header for Excel 97-2003 Workbook `.xls`.  

Hexadecimal header for  `.docx` file type.
```
Offset      0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F

00000000   50 4B 03 04 14 00 06 00  08 00 00 00 21 00 DF A4   PK          ! ߤ
```  

![docx_hex](./images/docx_hex.png)  
**Figure 3:** Header for Word 2007 Document `.docx`.  

Hexadecimal header for  `.xlsx` file type.
```
Offset      0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F

00000000   50 4B 03 04 14 00 06 00  08 00 00 00 21 00 62 EE   PK          ! b�
```  

![xlsx_hex](./images/xlsx_hex.png)  
**Figure 4:** Header for Excel 2007 Workbook `.xlsx`.  

Hexadecimal header for  `.jpg` file type.  
```
Offset      0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F

00000000   FF D8 FF E0 00 10 4A 46  49 46 00 01 01 01 00 60   ����  JFIF     `
```  

![jpg_hex](./images/jpg_hex.png)  
**Figure 5:** Header for `.jpg`.


Hexadecimal header for `.png` file type.  
```  
Offset      0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F

00000000   89 50 4E 47 0D 0A 1A 0A  00 00 00 0D 49 48 44 52   �PNG        IHDR
```  

![png_hex](./images/png_hex.png)  
**Figure 6:** Header for `.png`.


**Observations:** As you can see, hexadecimal headers for `.doc` and `.xls` files match one another. Additionally, `.docx` and `.xlsx` also match one another. It seems the Microsoft Office Suite versions produce files with the same hex header, version 97-2003 match one another, and version 2007+ match one another. It doesn't appear that spreadsheet files differ from word documents, which is surprising. It's all about the version.  

### Part 2: Explore MFT.  
