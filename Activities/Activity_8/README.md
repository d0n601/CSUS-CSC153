# Activity 8: Steganography with Audio Files 
### CSC 153 - Computer Forensics Principles and Practice  

## Objectives  
* Practice steganography with audio files.

## Part 1: Software installation  
Download the following software and install them on your workstation.
1. Coagula. **[https://www.abc.se/~re/Coagula/Coagula.html](https://www.abc.se/~re/Coagula/Coagula.html)**    
![1_install_coagula](./images/1_install_coagula.png)  
**Figure 1:** Coagula installed.  

2. Audacity. **[https://www.audacityteam.org/](https://www.audacityteam.org/)**  
![1_install_audacity](./images/1_install_audacity.png)  
**Figure 2:** Audacity installation.    

3. Sonic Visualizer. **[https://www.sonicvisualiser.org/]([https://www.sonicvisualiser.org/)**  
![1_install_sonic_v](./images/1_install_sonic_v.png)  
**Figure 3:** Sonic Visualizer installation.


## Part 2: Create a steganography audio file  
1. Download carrysong.wav from Canvas or google drive and save it in your work directory. The
google drive link is:
https://drive.google.com/file/d/1p3q6BfeA10PAq2ygxPeuPMb5VPpyYGNb/view?usp=sharing

2. In Windows, click the search icon, and type in Paint. Open the paint application.

3. The original canvas is white color. To change the background color into black and front color into
white, click on the Color 2 to choose black, and click on the Color 1 to choose white.  

4. Put the mouse onto the right bottom corner of original white canvas and drag it to the left-top corner to shrink the canvas size and make the canvas disappear, and then drag it to the right bottom to create a new canvas with black color.

5. Click on `File->Properties` to change the canvas size to `400x300`. The canvas should not be too big or too small.

6. Click on “A” to insert text onto the canvas.

7. Type the secret message on the Canvas. In this instruction, it is “No class on 11/12”. Align the message to the top center of the canvas.


8. Click on File->Save as to save the file as `secretemessage.bmp` in your work directory. Remember
to choose 24-bit Bitmap as the type.  

9. Navigate to the directory where the Coagula program is installed and click on Coagula to open it. Click on File->Open Image to open the file `secretemessage.bmp`.  

10. Click on Tools and click on Render Options to open the Render Options window.  

11. In the Render Options window, change the High of pitch range to 3000, and Amp factor into 0.5.  

12. Click on Render Image without Blue Noise (the button with green/red gears)

13. Click on `File->Save Sound As` to save the image as an audio file. It is saved as secretmessage.wav
in this instruction.  

14. Click on Audacity to start the program. Click `File->Open` to open `carrysong.wav` file. 

15. Click on `File->Import->Audio` to import the `secretmessage.wav` file. Click on OK for the warning
window.   

16. This step needs to move the secretmessage.wmv to the end of carrysong.m4v. Click on the right end of the secretmessage and drag to the left end to select the entire piece of the audio file, right click to cut the piece (or you can press the scissor-like button on the top menu), click the position aligned with the end of carrysong, and then paste the secretmessage there by right clicking and paste (or you can press the paste button on the top menu). You may click on the zoom in or zoom out icon to zoom in/out the audio tracks.  

17. In the secretmessage track, below the Mute and Solo buttons, drag the bar to move it to the very left. This will change the Gain to `-36.0 dB`.  

18. Click on `File->Export` to export the audio. Save the audio as `carrysong-with secret message.wav`.

19. Click OK on the warning message and on the following Edit Metadata Tags window.  

20. You may play the `carrysong-with secret message.wav` file in media player.  


## Part 3: Display the secret message in a steganography audio file  

21. Start Sonic Visualiser program. Click on `File->Open` to open the `carrysong-with secret message.wav file`.  

22. Click on `Layer->Add Spectrogram-> carrysong-with secret message.wav`: All Channels Mixed. 

23. You can move around to display the secret message.  

24. You may also choose different color theme in the right column to make the message more visible, if necessary. 

## Questions  
1. In Part2 step 6, why do we change the background color into black? (hint: the image is converted to audio later)  

2. In part 2 step 19, why do we need to move the secretmessage to the end of carrysong?  

3. Take screenshots to document what you’ve done in Step 13, 16, and 23.  