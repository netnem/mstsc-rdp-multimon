# mstsc-rdp-multimon
Intent of this script is to make sure an RDP session is always on the *exact* monitors you want, regardless of monitor IDs changing.  This is only necessary when you want multi-monitor support on *some* of your displays, but not all of them (leaving 1 for the host machine for example.) 

The problem: When using (selective) multiple monitors AND undocking and redocking a laptop under Windows 10, the monitors will often get jumbled up making your primary monitor not the one you prefer.

Example:

In this example if I want my rdp session to use monitor 2 as my "primary" monitor with my taskbar/start button for a 3-monitor setup (leaving my far left 1920x1080 monitor available to the host machine), then I need to set my rdp file for selectedmonitors to **3, 7, 4**.

![image](https://user-images.githubusercontent.com/32517635/209716814-c3619857-9b63-487f-a11b-b28d8881a5eb.png)

Please note that Windows display numbers are not the same as mstsc /l output.  

Normally a static file works fine for this, but when undocking and redocking, occasionally the monitors change:

After redocking or rebooting the monitor IDs have changed, I now need #4 to be primary:
![image](https://user-images.githubusercontent.com/32517635/209719194-8a683ff0-2885-401c-b7dd-b4f26514f373.png)

selectedmonitors now needs to be **8, 3, 7**.

This powershell script will launch mstsc /l, copy the output to the clipboard, parse the output, and write a .rdp file with the appropiate output.  The only requirement to use this script is to understand how to read the mstsc /l output and adjust the script to match your personal setup.  The monitors IDs may change, but the absolute resolution will not. The output of the file will drop a .rdp file to the scripts current directory which you can double click 

I couldn't figure out any other way to parse mstsc /l other than ctrl-c to clipboard.  All the other powershell commands I tried didn't exactly line up with mstsc /l's output.
