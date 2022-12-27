# mstsc-rdp-multimon
Powershell scripts to generate RDP files for multi-monitors

The problem: When using (selective) multiple monitors AND undocking and redocking a laptop under Windows 10, the monitors will often get jumbled up making your primary monitor not the one you prefer.

Example:

In this example if I want my rdp session to use monitor 2 as my "primary" monitor with my taskbar/start button for a 3-monitor setup (leaving my far left 1920x1080 monitor available to the host machine), then I need to set my rdp file for selectedmonitors to 3, 7, 4.

![image](https://user-images.githubusercontent.com/32517635/209716814-c3619857-9b63-487f-a11b-b28d8881a5eb.png)

Please note that Windows display numbers are not the same as mstsc /l output.  

This powershell script will launch mstsc /l, copy the output to the clipboard, parse the output, and write a .rdp file with the appropiate output.  The only requirement to use this script is to understand how to read the mstsc /l output and adjust the script to match your personal setup.
